/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "battleentity.h"
#include "charutils.h"
#include "conquest_system.h"
#include "jailutils.h"
#include "map.h"
#include "party.h"
#include "treasure_pool.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/menu_config.h"
#include "packets/party_define.h"
#include "packets/party_member_update.h"

CAlliance::CAlliance(CBattleEntity* PEntity) 
{
	DSP_DEBUG_BREAK_IF(PEntity->PParty == NULL);

    m_AllianceID   = PEntity->PParty->GetPartyID();

	//will need to deal with these
	//m_PSyncTarget 	= NULL;
//	m_PQuaterMaster = NULL;


	addParty(PEntity->PParty);
	this->aLeader = PEntity->PParty;

}



void CAlliance::dissolveAlliance(void) 
{
	//first kick out the third party if it exsists
	if (this->partyCount() == 3)
		this->removeParty(this->partyList.at(2));

		//kick out the second party
		this->removeParty(this->partyList.at(1));

		CParty* party = this->partyList.at(0);
		this->partyList.clear();

		party->m_PAlliance = NULL;
			 
	party->ReloadParty();

	delete this;
}


uint32 CAlliance::partyCount(void) 
{	
	if (!partyList.empty()) return (unsigned int) partyList.size();
	return 0;
}

void CAlliance::removeParty(CParty * party) 
{
		CAlliance* alliance = party->m_PAlliance;
		bool mainPartyDisbanding = false;

		//if main party then pass alliance lead to the next (d/c fix)
		if(alliance->getMainParty() == party){
			mainPartyDisbanding = true;}

		//delete the party from the alliance list
		for (uint8 i = 0; i < party->m_PAlliance->partyList.size(); ++i) 
		{
			if (party == party->m_PAlliance->partyList.at(i)) 
				party->m_PAlliance->partyList.erase(partyList.begin()+i);
		}

		party->m_PAlliance = NULL;

		//update the remaining members of the alliance to show the party left
		if (alliance != NULL)
		{
			//if main party was removed then pass alliance leader
			if(mainPartyDisbanding == true){
				alliance->aLeader = alliance->partyList.at(0);
				alliance->partyList.at(0)->GetMemberFlags(alliance->partyList.at(0)->GetLeader());
			}

			for (uint8 i = 0; i < alliance->partyList.size(); ++i) 
			{
				alliance->partyList.at(i)->ReloadParty();
			}
		}

		//remove party members from the alliance treasure pool
	    for (uint8 i = 0; i < party->members.size(); ++i) 
	    {
			CCharEntity* PChar = (CCharEntity*)party->members.at(i);
			PChar->PTreasurePool->DelMember(PChar);
		}

		CCharEntity* PChar = (CCharEntity*)party->GetLeader();
		PChar->PTreasurePool = new CTreasurePool(TREASUREPOOL_PARTY);
		PChar->PTreasurePool->AddMember(PChar);
        PChar->PTreasurePool->UpdatePool(PChar);

	    for (uint8 i = 0; i < party->members.size(); ++i) 
	    {
		    CCharEntity* PChar = (CCharEntity*)party->members.at(i);
			party->ReloadPartyMembers((CCharEntity*)party->members.at(i));

				if (PChar->PParty->GetLeader() != PChar)
				{
					PChar->PTreasurePool = ((CCharEntity*)PChar->PParty->GetLeader())->PTreasurePool;
					((CCharEntity*)PChar->PParty->GetLeader())->PTreasurePool->AddMember(PChar);
					((CCharEntity*)PChar->PParty->GetLeader())->PTreasurePool->UpdatePool(PChar);
				}

		}
	party->ReloadParty();
}

void CAlliance::addParty(CParty * party) 
{
	party->m_PAlliance = this;
	partyList.push_back(party);

	for (uint8 a = 0; a < this->partyList.size(); ++a) 
	{
		this->partyList.at(a)->ReloadParty();
	}
		
	for (uint8 i = 0; i < party->members.size(); ++i)
	{
		party->ReloadTreasurePool((CCharEntity*)party->members.at(i));
		charutils::SaveCharStats((CCharEntity*)party->members.at(i));
	}
}





CParty* CAlliance::getMainParty() 
{	
		return aLeader;
}

//Assigns a party leader for the party
void CAlliance::setMainParty(CParty * aLeader) 
{
	
	//Having no leader is bad so lets check if the pointer is not null.
	if (aLeader != NULL) {
		this->aLeader = aLeader;
	}
	
}