/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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
#include "party.h"
#include "charutils.h"

CAlliance::CAlliance(void) 
{
	this->aLeader = NULL;
}

CAlliance::~CAlliance(void) 
{

}

int CAlliance::dissolveAlliance(void) 
{
	/*	
	
	//kick all of the parties out
	for (int i=0;i<(int)partyList.size();i++) {
		partyList[i]->setAlliance(NULL);
		//Drops the treasure pool
		partyList[i]->dropTreasurePool();
		partyList[i]->rebuildTreasurePool();
	}
	//Send the party updates once everyone is removed
	for (int i=0;i<(int)partyList.size();i++) {
		//Send the removal updates... THERE -HAS- TO BE A BETTER WAY THAN THIS

		this->unlockAllianceList();
		//Redefine the party removing the alliances
		//partyList[i]->getLeader()->insertPacket(CHAR_INPARTY_SELF,CDefinePartyPacket(partyList[i]));

		PushPacketList(partyList[i]->getLeader(),CHAR_INPARTY_SELF,CDefinePartyPacket(partyList[i]));
		this->lockAllianceList();

		//Loop through every party
		for (int x=0;x<(int)partyList.size();x++) {
			// ignoring your own party
			if (x != i) {
				partyList[i]->lockPartyList();
				//Remove the other parties members from your display
				for (int y=0;y<(int)partyList[i]->memberCount();y++) {
					partyList[x]->reloadParty(partyList[i]->members[y],true);
				}
				partyList[i]->unlockPartyList();
			}
		}
	}
	//Empty the alliance
	partyList.clear();
	this->unlockAllianceList();
	*/
	return 0;
}

unsigned int CAlliance::partyCount(void) 
{	
	if (!partyList.empty()) return (unsigned int) partyList.size();
	return 0;
}

int CAlliance::removeParty(CParty * party) 
{
	/*
	//Verify that the main party is not being dropped.
	if ( party != this->getMainParty() ) {
		//Remove the party from the alliance
		party->setAlliance(NULL);
		//Drop the parties treasure pool
		party->dropTreasurePool();
		//Rebuild the treasure pool for the party
		party->rebuildTreasurePool();
		//Send the single party definition for everyone in the leaving party
		//party->getLeader()->insertPacket(CHAR_INALLIANCE_SELF,CDefinePartyPacket(party));
		PushPacketList(party->getLeader(),CHAR_INALLIANCE_SELF,CDefinePartyPacket(party));
		this->lockAllianceList();
		for (unsigned int x = 0; x < this->partyList.size(); x++) {
			//Check to see if the member is the one we are removing
			if (party == this->partyList.at(x)) {
				//Match found, shift down the inAlliance numbers 
				for (unsigned int y = (x+1); y < this->partyList.size(); y++) {
					//Is this member a valid pointer?
					if (this->partyList.at(y) != NULL) {
						//Valid party, do a quick refresh of the alliance index
						this->partyList.at(y)->inAlliance--;
						//Lock the party members list
						party->lockPartyList();
						for (unsigned int z = 0; z < party->memberCount(); z++) {
							//Remove the old alliance party information from the leaving party
							this->partyList[x]->reloadParty(party->members[z], true);
						}
						//unlock the party members
						party->unlockPartyList();
					}
				}
				//Erase the party out of the party list
				this->partyList.erase(this->partyList.begin()+x,this->partyList.begin()+x+1);
				//Quickly unlock the list
				this->unlockAllianceList();
				//Now that the leaving party is fully removed from the alliance, we can update the remaining parties
				//this->getMainParty()->getLeader()->insertPacket(CHAR_INALLIANCE_SELF,CDefinePartyPacket(this->getMainParty()));

				PushPacketList(this->getMainParty()->getLeader(),CHAR_INALLIANCE_SELF,CDefinePartyPacket(this->getMainParty()));
				//Lock the party list to update the remaining parties
				this->lockAllianceList();
				for (unsigned int y = 0; y < this->partyList.size(); y++) {
					//Update every party member in the parties that are not being dropped about the removal
					this->partyList[y]->lockPartyList();
					for (unsigned int z = 0; z < this->partyList[y]->memberCount(); z++) {
						//party is being removed, update partyList[y]->members[z] of the removal
						party->reloadParty(this->partyList[y]->members[z],true);
					}
					this->partyList[y]->unlockPartyList();
				}
				break;
			} else if (this->partyList[x] != NULL) {
				//Update every party member in the party that is being dropped about the removal
				party->lockPartyList();
				for (unsigned int z = 0; z < party->memberCount(); z++) {
					//Remove the old alliance party information from the leaving party
					this->partyList[x]->reloadParty(party->members[z], true);
				}
				party->unlockPartyList();
			}
		}
		this->unlockAllianceList();
	}
	*/
	return 0;
}

int CAlliance::addParty(CParty * party) 
{
	/*
	if (this->partyCount() < 3) {
		this->lockAllianceList();
		partyList.push_back(party);
		this->unlockAllianceList();
		party->dropTreasurePool();
		party->setAlliance(this);
		party->inAlliance = this->partyCount();
		party->rebuildTreasurePool();
	}
	*/
	return 0;
}

CParty * CAlliance::getMainParty(void) 
{	
	/*
	if (this->aLeader != NULL)
		return this->aLeader;
	else
	*/
		return 0;
}

//Assigns a party leader for the party
int CAlliance::setMainParty(CParty * aLeader) 
{
	/*
	//Having no leader is bad so lets check if the pointer is not null.
	if (aLeader != NULL) {
		this->aLeader = aLeader;
	}
	*/
	return 0;
}