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

#include <string.h>

#include "alliance.h"
#include "entities/charentity.h"
#include "instance_handler.h"
#include "entities/mobentity.h"
#include "utils/zoneutils.h"
#include "utils/charutils.h"
#include "lua/luautils.h"
#include "packets/char_skills.h"


CInstanceHandler::CInstanceHandler(uint16 zoneid)
{
	m_ZoneId = zoneid;

	//Dynamis zone (need to add COP dyna zone)
	//added ghelsba outpost here, 1 instance only
	if (m_ZoneId > 184 && m_ZoneId < 189 ||  m_ZoneId > 133 && m_ZoneId < 136 || m_ZoneId == 140 || m_ZoneId == 35 || m_ZoneId > 38  && m_ZoneId < 43 )
    {
		m_MaxInstances = 1;
	}
	else
	   if(m_ZoneId == 37)
	   {
		   m_MaxInstances = 8;
	   }
	else
	   if(m_ZoneId == 38)
	   {
		   m_MaxInstances = 6;
	   }
	else
    {
		m_MaxInstances = 3;
	}
    memset(&m_Instances, 0, sizeof(m_Instances));
}

void CInstanceHandler::handleInstances(uint32 tick){
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]!=NULL){ //handle it!
			CInstance* PInstance = m_Instances[i];
			int instzone = PInstance->getZoneId();

			//Dynamis zone (need to add COP Dyna)
			if(instzone > 184 && instzone < 189 || instzone > 133 && instzone < 136 || instzone > 38  && instzone < 43){
				//handle death time
				if(PInstance->allPlayersDead()){//set dead time
					if(PInstance->getDeadTime()==0){
						PInstance->setDeadTime(tick);
						ShowDebug("Dynamis %i instance %i : All players have fallen.\n",PInstance->getID(),PInstance->getInstanceNumber());
					}
				}
				else{
					if(PInstance->getDeadTime()!=0){
						PInstance->setDeadTime(0); //reset dead time when people are alive
						ShowDebug("Dynamis %i instance %i : Death counter reset as a player is now alive.\n",PInstance->getID(),PInstance->getInstanceNumber());
					}
				}

				//handle time remaining prompts (since its useful!) Prompts every minute
				int Tremaining = (tick - PInstance->getStartTime())/1000;

				//New message (in yellow) at the end of dynamis (5min before the end)
				if((Tremaining % 60) == 0 && (PInstance->getTimeLimit() - Tremaining) <= 300){
					PInstance->pushMessageToAllInBcnm(449,((PInstance->getTimeLimit()-Tremaining)/60));
				}
				else{
					if(((tick - PInstance->getStartTime())/1000) % 60 == 0){
						PInstance->pushMessageToAllInBcnm(202,(PInstance->getTimeLimit()-Tremaining));
					}
				}

				//if the time is finished, exiting dynamis
				if(instanceutils::meetsLosingConditions(PInstance,tick)){
					ShowDebug("Dynamis %i instance %i : Dynamis is finished. Exiting battlefield.\n",PInstance->getID(),PInstance->getInstanceNumber());
					PInstance->finishDynamis();
				}
			}
			else
				if(instzone == 37 || instzone == 38){ //limbus ///////////////////////////////////////////////////////////
								//handle death time
				      if(PInstance->allPlayersDead()){//set dead time
					       if(PInstance->getDeadTime()==0){
						     PInstance->setDeadTime(tick);
						     ShowDebug("Limbus %i instance %i : All players have fallen.\n",PInstance->getID(),PInstance->getInstanceNumber());
					       }
				      }
				      else{
					       if(PInstance->getDeadTime()!=0){
						     PInstance->setDeadTime(0); //reset dead time when people are alive
						     ShowDebug("Limbus %i instance %i : Death counter reset as a player is now alive.\n",PInstance->getID(),PInstance->getInstanceNumber());
					       }
				      }
					  //handle time remaining prompts (since its useful!) Prompts every minute
				      int Tremaining = (tick - PInstance->getStartTime())/1000;

				if(((tick - PInstance->getStartTime())/1000) % 60 == 0){
						PInstance->pushMessageToAllInBcnm(202,((PInstance->getTimeLimit()-Tremaining)/60));
				}

				//if the time is finished, exiting Limbus
				if(instanceutils::meetsLosingConditions(PInstance,tick)){

					ShowDebug("Limbus %i instance %i : Limbus is finished. Exiting battlefield.\n",PInstance->getID(),PInstance->getInstanceNumber());
					PInstance->loseBcnm();
				}
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			}
			else{
				//handle locking of bcnm when engaged
				if(!PInstance->locked && PInstance->isPlayersFighting()){
					PInstance->lockBcnm();
					PInstance->fightTick = tick;
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
				if(((tick - PInstance->getStartTime())/1000) % 60 == 0){
					PInstance->pushMessageToAllInBcnm(202,(PInstance->getTimeLimit()-((tick - PInstance->getStartTime())/1000)));
				}

				//handle win conditions
				if(instanceutils::meetsWinningConditions(PInstance,tick)){
					//check rule mask to see if warp immediately or pop a chest
					if(PInstance->m_RuleMask & RULES_SPAWN_TREASURE_ON_WIN){
						//spawn chest
						if(PInstance->treasureChestSpawned == false)
						{
						ShowDebug("BCNM %i instance %i : Winning conditions met. Spawning chest.\n",PInstance->getID(),PInstance->getInstanceNumber());
						PInstance->spawnTreasureChest();
						//PInstance->getHighestTHforBcnm(); apparently not used in bcnm
						PInstance->treasureChestSpawned = true;
						}
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
	CInstance* PInstance = instanceutils::loadInstance(this,id, INSTANCETYPE_BCNM);
	if(PInstance==NULL){
		return -1;
	}
	if(id > 1289 && id < 1308){

	  switch(id)
	  {
	  case 1290:
		{PInstance->setInstanceNumber(1);}
       break;
	  case 1291:
        {PInstance->setInstanceNumber(2);}
       break;
	   	  case 1292:
	    {PInstance->setInstanceNumber(3);}
       break;
	   	  case 1293:
		{PInstance->setInstanceNumber(4);}
       break;
	   	  case 1294:
		{PInstance->setInstanceNumber(5);}
       break;
	   	  case 1295:
		{PInstance->setInstanceNumber(5);}
       break;
	   	  case 1296:
		{PInstance->setInstanceNumber(6);}
       break;
	   	  case 1297:
		{PInstance->setInstanceNumber(6);}
       break;
	   	 case 1298:
		{PInstance->setInstanceNumber(1);}
       break;
	   	 case 1299:
		{PInstance->setInstanceNumber(2);}
       break;
	    case 1300:
		{PInstance->setInstanceNumber(3);}
       break;
	    case 1301:
		{PInstance->setInstanceNumber(4);}
       break;
	    case 1302:
		{PInstance->setInstanceNumber(4);}
       break;
	   case 1303:
		{PInstance->setInstanceNumber(5);}
       break;
	   case 1304:
		{PInstance->setInstanceNumber(6);}
       break;
	  case 1305:
		{PInstance->setInstanceNumber(7);}
      break;
	  case 1306:
		{PInstance->setInstanceNumber(8);}
      break;
	  case 1307:
		{PInstance->setInstanceNumber(8);}
      break;
	  }
	}
	else{
	  for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]==NULL){
			PInstance->setInstanceNumber(i+1);
			break;
		}
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

		case 18:
			if(PChar->PParty == NULL){//1 player entering 18 man bcnm
				if(PInstance->addPlayerToBcnm(PChar)){
					ShowDebug("InstanceHandler ::18 Added %s to the valid players list for BCNM %i Instance %i \n",
						PChar->GetName(),id,PInstance->getInstanceNumber());
				}
			}else{//alliance entering 18 man bcnm
				if(PChar->PParty->m_PAlliance != NULL)
				{
					for(uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
					{
						for(uint8 j=0;j<PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); j++){
							if(PInstance->addPlayerToBcnm((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j))){
								ShowDebug("InstanceHandler ::18 Added %s to the valid players list for BCNM %i Instance %i \n",
									PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j)->GetName(),id,PInstance->getInstanceNumber());
							}
						}
					}
				}else{//single party entering 18 man bcnm
						for(uint8 j=0;j<PChar->PParty->members.size(); j++){
							if(PInstance->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))){
								ShowDebug("InstanceHandler ::18 Added %s to the valid players list for BCNM %i Instance %i \n",
									PChar->PParty->members.at(j)->GetName(),id,PInstance->getInstanceNumber());
							}
						}
					 }
			}
			break;

		default: ShowDebug("Unknown max participants value %i \n",PInstance->getMaxParticipants());
	}

	if(!PInstance->isReserved()){//no player met the criteria for entering, so revoke the previous permission.
		ShowDebug("No player has met the requirements for entering the BCNM.\n");
		delete PInstance;
		return -1;
	}

	m_Instances[PInstance->getInstanceNumber()-1] = PInstance;
	PInstance->init();
	luautils::OnBcnmRegister(PChar,PInstance);
	return PInstance->getInstanceNumber();
}

bool CInstanceHandler::hasFreeSpecialInstance(uint16 id){ //reserved for special instance like limbus

 switch(id)
	  {
	  case 1290:
		{ if( m_Instances[0] == NULL){return true;}}
       break;
	  case 1291:
        { if( m_Instances[1] == NULL){return true;}}
       break;
	   	  case 1292:
	    { if( m_Instances[2] == NULL){return true;}}
       break;
	   	  case 1293:
		{ if( m_Instances[3] == NULL){return true;}}
       break;
	   	  case 1294:
		{ if( m_Instances[4] == NULL){return true;}}
       break;
	   	  case 1295:
		{ if( m_Instances[4] == NULL){return true;}}
       break;
	   	  case 1296:
		{ if( m_Instances[5] == NULL){return true;}}
       break;
	   	  case 1297:
		{ if( m_Instances[5] == NULL){return true;}}
       break;
	   	 case 1298:
		{ if( m_Instances[0] == NULL){return true;}}
       break;
	   	 case 1299:
		{if( m_Instances[1] == NULL){return true;}}
       break;
	    case 1300:
		{if( m_Instances[2] == NULL){return true;}}
       break;
	    case 1301:
		{if( m_Instances[3] == NULL){return true;}}
       break;
	    case 1302:
		{if( m_Instances[3] == NULL){return true;}}
       break;
	   case 1303:
		{if( m_Instances[4] == NULL){return true;}}
       break;
	   case 1304:
		{if( m_Instances[5] == NULL){return true;}}
       break;
	  case 1305:
		{if( m_Instances[6] == NULL){return true;}}
      break;
	  case 1306:
		{if( m_Instances[7] == NULL){return true;}}
      break;
	  case 1307:
		{if( m_Instances[7] == NULL){return true;}}
      break;
	  default:
        return false;
	 break;
	  }
  return false;
}

bool CInstanceHandler::hasSpecialInstanceEmpty(uint16 id){ //reserved for special instance like limbus
  if(id <= m_MaxInstances &&  id!=0){
	  if(m_Instances[id-1] != NULL){
					 return false;
	  }
   }
 return true;
}
void CInstanceHandler::SetLootToBCNM(uint16 LootID,uint16 id,uint32 npcID){
	m_Instances[id-1]->setLootId(LootID);
	CBaseEntity* PNpc = (CBaseEntity*)zoneutils::GetEntity(npcID, TYPE_NPC);
	m_Instances[id-1]->addNpc(PNpc);
}
void CInstanceHandler::RestoreOnInstance(uint16 id){
int playermaxMP = 0;
int playermaxHP = 0;
  if(id <= m_MaxInstances &&  id>0){
	  	CInstance* PInstance = m_Instances[id-1];
       for(int i=0; i<PInstance->m_PlayerList.size(); i++){
		   if(PInstance->m_PlayerList.at(i)->animation != ANIMATION_DEATH){

		   PInstance->m_PlayerList.at(i)->PRecastContainer->Del(RECAST_MAGIC);
		   PInstance->m_PlayerList.at(i)->PRecastContainer->Del(RECAST_ABILITY);

	       playermaxMP = PInstance->m_PlayerList.at(i)->GetMaxMP();
		   playermaxHP = PInstance->m_PlayerList.at(i)->GetMaxHP();

		   PInstance->m_PlayerList.at(i)->addHP(playermaxHP);
           PInstance->m_PlayerList.at(i)->addMP(playermaxMP);

		   PInstance->m_PlayerList.at(i)->pushPacket(new CCharSkillsPacket(PInstance->m_PlayerList.at(i)));
		   charutils::UpdateHealth(PInstance->m_PlayerList.at(i));


            //361 - All of <target>'s abilities are recharged.
		    PInstance->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PInstance->m_PlayerList.at(i)  ,PInstance->m_PlayerList.at(i) ,0,0,361));

            //357 - <target> regains .. HP.
		    PInstance->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PInstance->m_PlayerList.at(i)  ,PInstance->m_PlayerList.at(i) ,playermaxHP,playermaxHP,357));

             //357 - <target> regains .. HP.
		    PInstance->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PInstance->m_PlayerList.at(i)  ,PInstance->m_PlayerList.at(i) ,playermaxMP,playermaxMP,358));
		   }
	    }
    }
}
int CInstanceHandler::SpecialInstanceLeftTime(uint16 id,uint32 tick){ //reserved for special instance like limbus

  if(id <= m_MaxInstances &&  id>0){

	 if(m_Instances[id-1] != NULL){
	    int Tremaining = (tick -  m_Instances[id-1]->getStartTime())/1000;  //66
	    int timelimit =  m_Instances[id-1]->getTimeLimit();		  	 ///3600
					 return (timelimit-Tremaining)/60 ;
	  }
   }
 return 0;
}
int CInstanceHandler::GiveTimeToInstance(uint16 id, uint16 Time){
   if(id <= m_MaxInstances &&  id>0){
	  if(m_Instances[id-1] != NULL){
	          CInstance* PInstance = m_Instances[id-1];
	          PInstance->addTimeLimit(Time*60);
	  }
   }
  return 1;
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

CInstance* CInstanceHandler::getInstance(CCharEntity* PChar)
{
    for (int i = 0; i < m_MaxInstances; i++)
        if (m_Instances[i] != NULL)
			if (m_Instances[i]->isValidPlayerForBcnm(PChar))
                return m_Instances[i];
    return NULL;
}

uint32 CInstanceHandler::pollTimeLeft(uint16 id){
	return 0;
}

void CInstanceHandler::openTreasureChest(CCharEntity* PChar){
		for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i] != NULL){
			if(m_Instances[i]->isValidPlayerForBcnm(PChar)){
				CInstance* PInstance = m_Instances[i];
				PInstance->OpenChestinBcnm();
			}
		}
	}
}

//========================DYNAMIS FUNCTIONS=============================================//

int CInstanceHandler::getUniqueDynaID(uint16 id){

	CInstance* PInstance = m_Instances[0];
	return PInstance->getDynaUniqueID();
}

int CInstanceHandler::registerDynamis(uint16 id, CCharEntity* PChar){
	if(!hasFreeInstance()){
		return -1;
	}
	CInstance* PInstance = instanceutils::loadInstance(this,id,INSTANCETYPE_DYNAMIS);
	if(PInstance==NULL){
		return -1;
	}
	for(int i=0; i<m_MaxInstances; i++){
		if(m_Instances[i]==NULL){
			PInstance->setInstanceNumber(i+1);
			break;
		}
	}

	if(PInstance->addPlayerToDynamis(PChar)){
		ShowDebug("InstanceHandler ::1 Added %s to the valid players list for Dynamis %i Instance %i \n",
			PChar->GetName(),id,PInstance->getInstanceNumber());
	}

	m_Instances[PInstance->getInstanceNumber()-1] = PInstance;
	PInstance->init();
	PInstance->setDynaUniqueID();
	luautils::OnBcnmRegister(PChar,PInstance);
	return PInstance->getInstanceNumber();
}

int CInstanceHandler::dynamisAddPlayer(uint16 dynaid, CCharEntity* PChar){

	if(m_Instances[0]->addPlayerToDynamis(PChar)){
		ShowDebug("InstanceHandler ::Registration for Dynamis by %s succeeded \n",PChar->GetName());
	}

	return 1;
}

int CInstanceHandler::SpecialInstanceAddPlayer(uint16 id, CCharEntity* PChar)
{
	short Inst =0;
	switch(id)
	{
	  case 1290: Inst = 0; break;
	  case 1291: Inst = 1; break;
	  case 1292: Inst = 2; break;
	  case 1293: Inst = 3; break;
	  case 1294: Inst = 4; break;
	  case 1295: Inst = 4; break;
	  case 1296: Inst = 5; break;
	  case 1297: Inst = 5; break;
	  case 1298: Inst = 0; break;
	  case 1299: Inst = 1; break;
	  case 1300: Inst = 2; break;
	  case 1301: Inst = 3; break;
	  case 1302: Inst = 3; break;
	  case 1303: Inst = 4; break;
	  case 1304: Inst = 5; break;
	  case 1305: Inst = 6; break;
	  case 1306: Inst = 7; break;
	  case 1307: Inst = 7; break;
	}

	if(m_Instances[Inst]->addPlayerToBcnm(PChar)){
		ShowDebug("InstanceHandler ::Registration for Special Instance by %s succeeded \n",PChar->GetName());
	}
	return 1;
}
int CInstanceHandler::dynamisMessage(uint16 Param1, uint16 Param2){

	CInstance* PInstance = m_Instances[0];

	PInstance->addTimeLimit(Param2*60);
	PInstance->pushMessageToAllInBcnm(Param1,Param2);

	return 1;
}

void CInstanceHandler::launchDynamisSecondPart(){
	instanceutils::spawnSecondPartDynamis(m_Instances[0]);
}

/* Disconnecting from Dynamis (including warp)
This removes the player from the active list and calls the warp/dc callback. Must bear in mind
that this will be called if you warp BEFORE entering the dyna (but still have dynamis status)
hence it doesn't check if you're "in" the BCNM, it just tries to remove you from the list.
*/
bool CInstanceHandler::disconnectFromDynamis(CCharEntity* PChar){ //includes warping
	if(m_Instances[0]!=NULL){
		if(m_Instances[0]->delPlayerFromDynamis(PChar)){
			luautils::OnBcnmLeave(PChar,m_Instances[0],LEAVE_WARPDC);
			if(!m_Instances[0]->isReserved()){//no more players in BCNM
				ShowDebug("Detected no more players in Dynamis Instance %i. Cleaning up. \n",m_Instances[0]->getInstanceNumber());
				luautils::OnBcnmLeave(PChar,m_Instances[0],LEAVE_LOSE);
				m_Instances[0]->finishDynamis();
			}
			return true;
		}
	}
	return false;
}

void CInstanceHandler::insertMonsterInList(CMobEntity* PMob)
{
	CInstance* PInstance = m_Instances[0];

	if(PInstance->isMonsterInList(PMob) == false)
	{
		PInstance->addMonsterInList(PMob);
	}
}

bool CInstanceHandler::checkMonsterInList(CMobEntity* PMob)
{
	CInstance* PInstance = m_Instances[0];

	if(PInstance->isMonsterInList(PMob))
		return true;
	else
		return false;
}