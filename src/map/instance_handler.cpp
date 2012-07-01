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
#include "lua/luautils.h"


CInstanceHandler::CInstanceHandler(uint8 zoneid)
{
	m_ZoneId = zoneid;
	m_MaxInstances = 3;
	for(int i=0; i<3;i++){
		m_Instances[i] = NULL;
	}
}

void CInstanceHandler::handleInstances(uint32 tick){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL){ //handle it!
			CInstance* PInstance = m_Instances[i];
			//handle locking of bcnm when engaged
			if(!PInstance->locked && PInstance->isPlayersFighting()){
				PInstance->lockBcnm();
				PInstance->locked = true;
				ShowDebug("BCNM %i instance %i : Battlefield has been locked. No more players can enter.\n",PInstance->getID(),PInstance->getInstanceNumber());
			}
			//handle death time
			if(PInstance->allPlayersDead()){//set dead time
				if(PInstance->getDeadTime()==0){
					PInstance->setDeadTime(tick);
					ShowDebug("BCNM %i instance %i : All players have fallen.\n",PInstance->getID(),PInstance->getInstanceNumber());
				}
			}
			else{
				if(PInstance->getDeadTime()!=0){
					PInstance->setDeadTime(0); //reset dead time when people are alive
					ShowDebug("BCNM %i instance %i : Death counter reset as a player is now alive.\n",PInstance->getID(),PInstance->getInstanceNumber());
				}
			}
			//handle time remaining prompts (since its useful!) Prompts every minute
			if(((tick - PInstance->getStartTime())/1000) % 120 == 0){
				PInstance->pushMessageToAllInBcnm(202,(PInstance->getTimeLimit()-((tick - PInstance->getStartTime())/1000)));
			}

			//handle win conditions
			if(instanceutils::meetsWinningConditions(PInstance,tick)){
				//check rule mask to see if warp immediately or pop a chest
				if(PInstance->m_RuleMask & RULES_SPAWN_TREASURE_ON_WIN){
					//todo: spawn chest
					ShowDebug("BCNM %i instance %i : Winning conditions met. Spawning chest.\n",PInstance->getID(),PInstance->getInstanceNumber());
					PInstance->winBcnm();
				}
				else{
					ShowDebug("BCNM %i instance %i : Winning conditions met. Exiting battlefield.\n",PInstance->getID(),PInstance->getInstanceNumber());
					PInstance->winBcnm();
				}
			}
			//handle lose conditions
			else if(instanceutils::meetsLosingConditions(PInstance,tick)){
				ShowDebug("BCNM %i instance %i : Losing conditions met. Exiting battlefield.\n",PInstance->getID(),PInstance->getInstanceNumber());
				PInstance->loseBcnm();
			}
		}
	}

	//send 246 with bunrning circle as target (bcnm is full. followed by time remaining)

}

void CInstanceHandler::wipeInstance(CInstance* inst){
	if(inst->getInstanceNumber() <= m_MaxInstances && inst->getInstanceNumber()>0 && 
		m_Instances[inst->getInstanceNumber()-1] != NULL){
			ShowDebug("Wiping instance BCNMID: %i Instance %i \n",inst->getID(),inst->getInstanceNumber());
			m_Instances[inst->getInstanceNumber()-1] = NULL;
	}
}

/* Disconnecting from BCNM (including warp)
This removes the player from the active list and calls the warp/dc callback. Must bear in mind
that this will be called if you warp BEFORE entering the bcnm (but still have battleifeld status)
hence it doesn't check if you're "in" the BCNM, it just tries to remove you from the list.
*/
bool CInstanceHandler::disconnectFromBcnm(CCharEntity* PChar){ //includes warping
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL){
			if(m_Instances[i]->delPlayerFromBcnm(PChar)){
				luautils::OnBcnmLeave(PChar,m_Instances[i],LEAVE_WARPDC);
				if(!m_Instances[i]->isReserved()){//no more players in BCNM
					ShowDebug("Detected no more players in BCNM Instance %i. Cleaning up. \n",
						m_Instances[i]->getInstanceNumber());
					m_Instances[i]->loseBcnm();
				}
				return true;
			}
		}
	}
	return false;
}

bool CInstanceHandler::leaveBcnm(uint16 bcnmid, CCharEntity* PChar){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL && m_Instances[i]->getID() == bcnmid){
			if(m_Instances[i]->isPlayerInBcnm(PChar)){
				if(m_Instances[i]->delPlayerFromBcnm(PChar)){
					luautils::OnBcnmLeave(PChar,m_Instances[i],LEAVE_EXIT);
					if(!m_Instances[i]->isReserved()){//no more players in BCNM
						ShowDebug("Detected no more players in BCNM Instance %i. Cleaning up. \n",
							m_Instances[i]->getInstanceNumber());
						m_Instances[i]->loseBcnm();
					}
					return true;
				}
			}
		}
	}
	return false;
}

bool CInstanceHandler::winBcnm(uint16 bcnmid, CCharEntity* PChar){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL && m_Instances[i]->getID() == bcnmid){
			if(m_Instances[i]->isPlayerInBcnm(PChar)){
				m_Instances[i]->winBcnm();
				return true;
			}
		}
	}
	return false;
}

bool CInstanceHandler::enterBcnm(uint16 bcnmid, CCharEntity* PChar){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL && m_Instances[i]->getID() == bcnmid){
			if(m_Instances[i]->isValidPlayerForBcnm(PChar)){
				if(m_Instances[i]->enterBcnm(PChar)){
					return true;
				}
			}
		}
	}
	return false;
}

int CInstanceHandler::registerBcnm(uint16 id, CCharEntity* PChar){
	if(!hasFreeInstance()){
		return -1;
	}
	CInstance* PInstance = instanceutils::loadInstance(this,id);
	if(PInstance==NULL){
		return -1;
	}
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]==NULL){
			PInstance->setInstanceNumber(i+1);
			break;
		}
	}

	switch(PInstance->getMaxParticipants()){
	case 1:
		if(PInstance->addPlayerToBcnm(PChar)){
			ShowDebug("InstanceHandler ::1 Added %s to the valid players list for BCNM %i Instance %i \n",
				PChar->GetName(),id,PInstance->getInstanceNumber());
		}
		break;
	case 3:
		if(PChar->PParty == NULL){//just add the initiator
			if(PInstance->addPlayerToBcnm(PChar)){
				ShowDebug("InstanceHandler ::3 Added %s to the valid players list for BCNM %i Instance %i \n",
					PChar->GetName(),id,PInstance->getInstanceNumber());
			}
		}
			else{
				int numRegistered = 0;
				for(int j=0;j<PChar->PParty->members.size(); j++){
					if(PInstance->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))){
						ShowDebug("InstanceHandler ::3 Added %s to the valid players list for BCNM %i Instance %i \n",
							PChar->PParty->members.at(j)->GetName(),id,PInstance->getInstanceNumber());
						numRegistered++;
					}
					if(numRegistered>=3){break;}
				}
			}
			break;
		case 6:
			if(PChar->PParty == NULL){//just add the initiator
				if(PInstance->addPlayerToBcnm(PChar)){
					ShowDebug("InstanceHandler ::6 Added %s to the valid players list for BCNM %i Instance %i \n",
						PChar->GetName(),id,PInstance->getInstanceNumber());
				}
			}
			else{
				for(int j=0;j<PChar->PParty->members.size(); j++){
					if(PInstance->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))){
						ShowDebug("InstanceHandler ::6 Added %s to the valid players list for BCNM %i Instance %i \n",
							PChar->PParty->members.at(j)->GetName(),id,PInstance->getInstanceNumber());
					}
				}
			}
			break;
		case 12: ShowDebug("BCNMs for 12 people are not implemented yet.\n"); break;
		case 18: ShowDebug("BCNMs for 18 people are not implemented yet.\n"); break;
		default: ShowDebug("Unknown max participants value %i \n",PInstance->getMaxParticipants());
	}

	m_Instances[PInstance->getInstanceNumber()-1] = PInstance;
	PInstance->init();
	luautils::OnBcnmRegister(PChar,PInstance);
	return PInstance->getInstanceNumber();
}

bool CInstanceHandler::hasFreeInstance(){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i] == NULL){
			return true;
		}
	}
	return false;
}

uint8 CInstanceHandler::findInstanceIDFor(CCharEntity* PChar){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i] != NULL){
			if(m_Instances[i]->isValidPlayerForBcnm(PChar)){
				return m_Instances[i]->getInstanceNumber();
			}
		}
	}
	return 255;
}

uint32 CInstanceHandler::pollTimeLeft(uint16 id){
	return 0;
}