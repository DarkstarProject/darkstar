/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

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

CAlliance::CAlliance(CBattleEntity* PEntity)
{
	DSP_DEBUG_BREAK_IF(PEntity->PParty == nullptr);

    m_AllianceID   = PEntity->PParty->GetPartyID();

	//will need to deal with these
	//m_PSyncTarget 	= nullptr;
//	m_PQuaterMaster = nullptr;


    addParty(PEntity->PParty);
	this->aLeader = PEntity->PParty;
    Sql_Query(SqlHandle, "UPDATE accounts_parties SET partyflag = partyflag | %d WHERE partyid = %u AND partyflag & %d;", ALLIANCE_LEADER, m_AllianceID, PARTY_LEADER);
}

CAlliance::CAlliance(uint32 id)
{
	m_AllianceID = id;
}

void CAlliance::dissolveAlliance(bool playerInitiated) 
{   
    if (playerInitiated)
    {
        //Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE allianceid = %u;", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, m_AllianceID);
        uint8 data[8];
        WBUFL(data, 0) = m_AllianceID;
        WBUFL(data, 4) = m_AllianceID;
        message::send(MSG_PT_DISBAND, data, sizeof data, nullptr);
    }
    else
    {
        Sql_Query(SqlHandle, "UPDATE accounts_parties JOIN accounts_sessions USING (charid) \
                        SET allianceid = 0, partyflag = partyflag & ~%d \
                        WHERE allianceid = %u AND IF(%u = 0 AND %u = 0, true, server_addr = %u AND server_port = %u);", 
                        ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, m_AllianceID, map_ip, map_port, map_ip, map_port);
        //first kick out the third party if it exsists
        CParty* party = nullptr;
        if (this->partyList.size() == 3)
        {
            party = this->partyList.at(2);
            this->delParty(party);
            party->ReloadParty();
        }

        //kick out the second party
        if (this->partyList.size() == 2)
        {
            party = this->partyList.at(1);
            this->delParty(party);
            party->ReloadParty();
        }

        party = this->partyList.at(0);
        this->partyList.clear();

        party->m_PAlliance = nullptr;

        party->ReloadParty();

        delete this;
    }
}


uint32 CAlliance::partyCount(void) 
{	
    int ret = Sql_Query(SqlHandle, "SELECT * FROM accounts_parties WHERE allianceid = %d GROUP BY partyid;", m_AllianceID, PARTY_SECOND | PARTY_THIRD);

    if (ret != SQL_ERROR)
    {
        return Sql_NumRows(SqlHandle);
    }
    return 0;
}

void CAlliance::removeParty(CParty * party) 
{
    delParty(party);

    Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = 0, partyflag = partyflag & ~%d WHERE partyid = %u;", ALLIANCE_LEADER | PARTY_SECOND | PARTY_THIRD, party->GetPartyID());
	uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, nullptr);

    uint8 data2[4];
    WBUFL(data2, 0) = party->GetPartyID();
    message::send(MSG_PT_RELOAD, data2, sizeof data2, nullptr);
}

void CAlliance::delParty(CParty* party)
{
    CAlliance* alliance = party->m_PAlliance;

    //if main party then pass alliance lead to the next (d/c fix)
    if (alliance->getMainParty() == party){
        int ret = Sql_Query(SqlHandle, "SELECT charname FROM accounts_sessions JOIN chars ON accounts_sessions.charid = chars.charid \
                                JOIN accounts_parties ON accounts_parties.charid = chars.charid WHERE allianceid = %u AND partyflag & %d \
                                AND partyid != %d ORDER BY timestamp ASC LIMIT 1;", m_AllianceID, PARTY_LEADER, party->GetPartyID());
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            std::string newLeader(Sql_GetData(SqlHandle, 0));
            assignAllianceLeader(newLeader.c_str());
        }
        if (alliance->getMainParty() == party)
        {
            dissolveAlliance();
            return;
        }
    }

    //delete the party from the alliance list
    for (uint8 i = 0; i < party->m_PAlliance->partyList.size(); ++i)
    {
        if (party == party->m_PAlliance->partyList.at(i))
            party->m_PAlliance->partyList.erase(partyList.begin() + i);
    }

    party->m_PAlliance = nullptr;
    party->SetPartyNumber(0);

    //remove party members from the alliance treasure pool
    for (uint8 i = 0; i < party->members.size(); ++i)
    {
        CCharEntity* PChar = (CCharEntity*)party->members.at(i);

        if (PChar->PTreasurePool != nullptr &&
            PChar->PTreasurePool->GetPoolType() != TREASUREPOOL_ZONE)
        {
            PChar->PTreasurePool->DelMember(PChar);
        }
    }

    //create a a new treasure pool for whoever is in the server from this party (if anyone)
    CCharEntity* PChar = nullptr;
    try
    {
        PChar = (CCharEntity*)party->members.at(0);
    }
    catch (std::out_of_range&)
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

void CAlliance::addParty(CParty * party)
{
	party->m_PAlliance = this;
	partyList.push_back(party);
	
    int newparty = 0;

    int ret = Sql_Query(SqlHandle, "SELECT partyflag & %d FROM accounts_parties WHERE allianceid = %d ORDER BY partyflag & %d ASC;", PARTY_SECOND | PARTY_THIRD, m_AllianceID, PARTY_SECOND | PARTY_THIRD);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            if (Sql_GetUIntData(SqlHandle, 0) == newparty)
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
    Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = %u, partyflag = partyflag | %d WHERE partyid = %u;", m_AllianceID, newparty, party->GetPartyID());
    party->SetPartyNumber(newparty);

	uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, nullptr);

}

void CAlliance::addParty(uint32 partyid)
{
    int newparty = 0;

    int ret = Sql_Query(SqlHandle, "SELECT partyflag FROM accounts_parties WHERE allianceid = %d ORDER BY partyflag & %d ASC;", m_AllianceID, PARTY_SECOND | PARTY_THIRD);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            uint8 partyflag = Sql_GetUIntData(SqlHandle, 0);
            uint8 oldparty = partyflag & (PARTY_SECOND | PARTY_THIRD);
            if (oldparty == newparty)
            {
                newparty++;
            }
        }
    }
    Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = %u, partyflag = partyflag | %d WHERE partyid = %u;", m_AllianceID, newparty, partyid);
    uint8 data[4];
	WBUFL(data, 0) = m_AllianceID;
    message::send(MSG_PT_RELOAD, data, sizeof data, nullptr);
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

void CAlliance::assignAllianceLeader(const char* name)
{
    int ret = Sql_Query(SqlHandle, "SELECT chars.charid from accounts_sessions JOIN chars USING (charid) JOIN accounts_parties USING (charid) "
        "WHERE charname = '%s' AND allianceid = %d AND partyflag & %d;", name, m_AllianceID, PARTY_LEADER);
    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        int charid = Sql_GetUIntData(SqlHandle, 0);

        Sql_Query(SqlHandle, "UPDATE accounts_parties SET partyflag = partyflag & ~%d WHERE allianceid = %u AND partyflag & %d", ALLIANCE_LEADER, m_AllianceID, ALLIANCE_LEADER);
        Sql_Query(SqlHandle, "UPDATE accounts_parties SET allianceid = %u WHERE allianceid = %u;", charid, m_AllianceID);
        m_AllianceID = charid;

        //in case leader's on another server 
        this->aLeader = nullptr;

        for (auto PParty : partyList)
        {
            if (PParty->GetMemberByName(name))
            {
                this->aLeader = PParty;
                break;
            }
        }

        Sql_Query(SqlHandle, "UPDATE accounts_parties SET partyflag = partyflag | %d WHERE charid = %u", ALLIANCE_LEADER, charid);
    }
}