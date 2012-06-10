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

#include "instance_handler.h"
#include "charentity.h"
#include "mobentity.h"


CInstanceHandler::CInstanceHandler(uint8 zoneid)
{
	m_ZoneId = zoneid;
}

void CInstanceHandler::handleInstances(uint32 tick){
	//send 246 with bunrning circle as target (bcnm is full. followed by time remaining)
}

void CInstanceHandler::storeInstance(CInstance* inst){
	m_Instances.push_back(inst);
}

bool CInstanceHandler::enterBcnm(uint16 bcnmid, CCharEntity* PChar){
	for(int i=0; i<m_Instances.size(); i++){
		if(m_Instances.at(i)->getID() == bcnmid){
			if(m_Instances.at(i)->isValidPlayerForBcnm(PChar)){
				if(m_Instances.at(i)->enterBcnm(PChar)){
					return true;
				}
			}
		}
	}
	return false;
}

int CInstanceHandler::registerBcnm(uint16 id, CCharEntity* PChar){
	for(int i=0; i<m_Instances.size(); i++){
		if(m_Instances.at(i)->getID()==id && !m_Instances.at(i)->isReserved()){
			switch(m_Instances.at(i)->getMaxParticipants()){
			case 1:
				if(m_Instances.at(i)->addPlayerToBcnm(PChar)){
					ShowDebug("InstanceHandler ::1 Added %s to the valid players list for BCNM %i Instance %i \n",
						PChar->GetName(),id,m_Instances.at(i)->getInstanceNumber());
					return m_Instances.at(i)->getInstanceNumber();
				}
				break;
			case 3:
				if(PChar->PParty == NULL){//just add the initiator
					if(m_Instances.at(i)->addPlayerToBcnm(PChar)){
						ShowDebug("InstanceHandler ::3 Added %s to the valid players list for BCNM %i Instance %i \n",
							PChar->GetName(),id,m_Instances.at(i)->getInstanceNumber());
						return m_Instances.at(i)->getInstanceNumber();
					}
				}
				else if(PChar->PParty->members.size() > 3){//too many people in pt for this bcnm, fail.
					ShowDebug("InstanceHandler ::3 Too many people in party to register BCNM.\n");
				}
				else{
					for(int i=0;i<PChar->PParty->members.size(); i++){
						if(m_Instances.at(i)->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(i))){
							ShowDebug("InstanceHandler ::3 Added %s to the valid players list for BCNM %i Instance %i \n",
								PChar->GetName(),id,m_Instances.at(i)->getInstanceNumber());
						}
					}
					return m_Instances.at(i)->getInstanceNumber();
				}
				break;
			case 6:
				if(PChar->PParty == NULL){//just add the initiator
					if(m_Instances.at(i)->addPlayerToBcnm(PChar)){
						ShowDebug("InstanceHandler ::6 Added %s to the valid players list for BCNM %i Instance %i \n",
							PChar->GetName(),id,m_Instances.at(i)->getInstanceNumber());
						return m_Instances.at(i)->getInstanceNumber();
					}
				}
				else{
					for(int i=0;i<PChar->PParty->members.size(); i++){
						if(m_Instances.at(i)->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(i))){
							ShowDebug("InstanceHandler ::6 Added %s to the valid players list for BCNM %i Instance %i \n",
								PChar->GetName(),id,m_Instances.at(i)->getInstanceNumber());
						}
					}
					return m_Instances.at(i)->getInstanceNumber();
				}
				break;
			case 12: ShowDebug("BCNMs for 12 people are not implemented yet.\n"); break;
			case 18: ShowDebug("BCNMs for 18 people are not implemented yet.\n"); break;
			default: ShowDebug("Unknown max participants value %i \n",m_Instances.at(i)->getMaxParticipants());
		}
		}
	}
	return -1;
}

bool CInstanceHandler::hasFreeInstance(uint16 id){
	for(int i=0; i<m_Instances.size(); i++){
		if(m_Instances.at(i)->getID()==id && !m_Instances.at(i)->isReserved()){
			return true;
		}
	}
	return false;
}

uint32 CInstanceHandler::pollTimeLeft(uint16 id){
	return 0;
}