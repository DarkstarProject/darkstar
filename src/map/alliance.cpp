/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "alliance.h"
#include "../common/showmsg.h"

#include <string.h>

#include "entities/battleentity.h"
#include "utils/charutils.h"
#include "conquest_system.h"
#include "utils/jailutils.h"
#include "map.h"
#include "party.h"
#include "treasure_pool.h"
#include "message.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/menu_config.h"
#include "packets/party_define.h"
#include "packets/party_member_update.h"

CAlliance::CAlliance(CBattleEntity* PEntity, Sql_t* Sql)
{
	DSP_DEBUG_BREAK_IF(PEntity->PParty == NULL);

    m_AllianceID   = PEntity->PParty->GetPartyID();

	//will need to deal with these
	//m_PSyncTarget 	= NULL;
//	m_PQuaterMaster = NULL;


    addParty(PEntity->PParty, Sql);
	this->aLeader = PEntity->PParty;
    Sql_Query(SqlHandle, "UPDATE accounts_parties SET partyflag = partyflag | %d WHERE partyid = %u AND partyflag & %d;", ALLIANCE_LEADER, m_AllianceID, PARTY_LEADER);
}

CAlliance::CAlliance(uint32 id)
{
	m_AllianceID = id;
}

void CAlliance::dissolveAlliance(bool playerInitiated, Sql_t* sql) 
{   
    if (playerInitiated)
    {
        //Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE allianceid = %u;", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, m_AllianceID);
        uint8 data[4];
        WBUFL(data, 0) = m_AllianceID;
        message::send(MSG_PT_DISBAND, data, sizeof data, NULL);
    }
    else
    {
        Sql_Query(sql, "UPDATE accounts_parties JOIN accounts_sessions USING (charid) \
                        SET allianceid = 0, partyflag = partyflag & ~%d \
                        WHERE allianceid = %u AND IF(%u = 0 AND %u = 0, true, server_addr = %u AND server_port = %u);", 
                        ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, m_AllianceID, map_ip, map_port, map_ip, map_port);
        //first kick out the third party if it exsists
        CParty* party = NULL;
        if (this->partyCount() == 3)
        {
            party = this->partyList.at(2);
            this->delParty(party);
            for (auto PChar : party->members)
            {
                
            }
            party->ReloadParty();
        }

        //kick out the second party
        if (this->partyCount() == 2)
        {
            party = this->partyList.at(1);
            this->delParty(party);
            for (auto PChar : party->members)
            {
                Sql_Query(sql, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE charid = %u", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, PChar->id);
            }
            party->ReloadParty();
        }

        party = this->partyList.at(0);
        this->partyList.clear();

        party->m_PAlliance = NULL;

        for (auto PChar : party->members)
        {
            Sql_Query(sql, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE charid = %u", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, PChar->id);
        }

        party->ReloadParty();

        delete this;
    }
}


uint32 CAlliance::partyCount(void) 
{	
	if (!partyList.empty()) return (unsigned int) partyList.size();
	return 0;
}

void CAlliance::removeParty(CParty * party) 
{
    delParty(party);

    Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE partyid = %u;", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, party->GetPartyID());
	uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, NULL);

    uint8 data2[4];
    WBUFL(data2, 0) = party->GetPartyID();
    message::send(MSG_PT_RELOAD, data2, sizeof data2, NULL);
}

void CAlliance::delParty(CParty* party)
{
    CAlliance* alliance = party->m_PAlliance;
    bool mainPartyDisbanding = false;

    //if main party then pass alliance lead to the next (d/c fix)
    if (alliance->getMainParty() == party){
        mainPartyDisbanding = true;
    }

    //delete the party from the alliance list
    for (uint8 i = 0; i < party->m_PAlliance->partyList.size(); ++i)
    {
        if (party == party->m_PAlliance->partyList.at(i))
            party->m_PAlliance->partyList.erase(partyList.begin() + i);
    }

    party->m_PAlliance = NULL;
    party->SetPartyNumber(0);

    //update the remaining members of the alliance to show the party left
    if (alliance != NULL)
    {
        //if main party was removed then pass alliance leader
        if (mainPartyDisbanding == true){
            alliance->aLeader = alliance->partyList.at(0);
            alliance->partyList.at(0)->GetMemberFlags(alliance->partyList.at(0)->GetLeader());
        }
    }

    //remove party members from the alliance treasure pool
    for (uint8 i = 0; i < party->members.size(); ++i)
    {
        CCharEntity* PChar = (CCharEntity*)party->members.at(i);

        if (PChar->PTreasurePool != NULL &&
            PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
        {
            PChar->PTreasurePool->DelMember(PChar);
        }
    }

    //create a a new treasure pool for whoever is in the server from this party (if anyone)
    CCharEntity* PChar = NULL;
    try
    {
        PChar = (CCharEntity*)party->members.at(0);
    }
    catch (std::out_of_range& e)
    {
        return;
    }
    PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_PARTY);
    PChar->PTreasurePool->AddMember(PChar);
    PChar->PTreasurePool->UpdatePool(PChar);

    for (uint8 i = 0; i < party->members.size(); ++i)
    {
        CCharEntity* PMember = (CCharEntity*)party->members.at(i);
        //party->ReloadPartyMembers((CCharEntity*)party->members.at(i));

        if (PChar != PMember)
        {
            PMember->PTreasurePool = PChar->PTreasurePool;
            PChar->PTreasurePool->AddMember(PMember);
            PChar->PTreasurePool->UpdatePool(PMember);
        }
    }
}

void CAlliance::addParty(CParty * party, Sql_t* Sql)
{
	party->m_PAlliance = this;
	partyList.push_back(party);
	
    int newparty = 0;

    int ret = Sql_Query(Sql, "SELECT partyflag & %d FROM accounts_parties WHERE allianceid = %d ORDER BY partyflag & %d ASC;", PARTY_SECOND | PARTY_THIRD, m_AllianceID, PARTY_SECOND | PARTY_THIRD);

    if (ret != SQL_ERROR && Sql_NumRows(Sql) > 0)
    {
        while (Sql_NextRow(Sql) == SQL_SUCCESS)
        {
            if (Sql_GetUIntData(Sql, 0) == newparty)
            {
                newparty++;
            }
        }
    }

	for (uint8 i = 0; i < party->members.size(); ++i)
	{
		party->ReloadTreasurePool((CCharEntity*)party->members.at(i));
		charutils::SaveCharStats((CCharEntity*)party->members.at(i));
	}
    Sql_Query(Sql, "UPDATE accounts_parties SET allianceid = %u, partyflag = partyflag | %d WHERE partyid = %u;", m_AllianceID, newparty, party->GetPartyID());
    party->SetPartyNumber(newparty);

	uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, NULL);

}

void CAlliance::addParty(uint32 partyid, Sql_t* Sql)
{
    int newparty = 0;

    int ret = Sql_Query(Sql, "SELECT partyflag FROM accounts_parties WHERE allianceid = %d ORDER BY partyflag & %d ASC;", m_AllianceID, PARTY_SECOND | PARTY_THIRD);

    if (ret != SQL_ERROR && Sql_NumRows(Sql) > 0)
    {
        while (Sql_NextRow(Sql) == SQL_SUCCESS)
        {
            uint8 partyflag = Sql_GetUIntData(Sql, 0);
            uint8 oldparty = partyflag & (PARTY_SECOND | PARTY_THIRD);
            if (oldparty == newparty)
            {
                newparty++;
            }
        }
    }
    Sql_Query(Sql, "UPDATE accounts_parties SET allianceid = %u, partyflag = partyflag | %d WHERE partyid = %u;", m_AllianceID, newparty, partyid);
    uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, NULL);
}

void CAlliance::pushParty(CParty* PParty, uint8 number)
{
    PParty->m_PAlliance = this;
    partyList.push_back(PParty);
    PParty->SetPartyNumber(number);

    for (uint8 i = 0; i < PParty->members.size(); ++i)
    {
        PParty->ReloadTreasurePool((CCharEntity*)PParty->members.at(i));
        charutils::SaveCharStats((CCharEntity*)PParty->members.at(i));
    }
}

CParty* CAlliance::getMainParty() 
{	
	return aLeader;
}

//Assigns a party leader for the party
void CAlliance::setMainParty(CParty * aLeader) 
{
	this->aLeader = aLeader;
}