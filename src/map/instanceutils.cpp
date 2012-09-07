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
#include <string.h>

#include "charentity.h"
#include "mobentity.h"
#include "party.h"
#include "charutils.h"
#include "alliance.h"
#include "zoneutils.h"
#include "itemutils.h"
#include "instanceutils.h"
#include "instance.h"
#include "instance_handler.h"
#include "packets/entity_update.h"


namespace instanceutils{
	/***************************************************************
		Loads the given instance from the database and returns
		a new Instance object.
	****************************************************************/
	CInstance* loadInstance(CInstanceHandler* hand, uint16 bcnmid){
		const int8* fmtQuery = "SELECT name, bcnmId, fastestName, fastestTime, timeLimit, levelCap, lootDropId, rules, partySize, zoneId \
						    FROM bcnm_info \
							WHERE bcnmId = %u";
					  
		int32 ret = Sql_Query(SqlHandle, fmtQuery, bcnmid);

		if (ret == SQL_ERROR || 
		Sql_NumRows(SqlHandle) == 0 ||
		Sql_NextRow(SqlHandle) != SQL_SUCCESS) 
		{
			ShowError("Cannot load instance BCNM:%i \n",bcnmid);
		} 
		else 
		{
				CInstance* PInstance = new CInstance(hand,Sql_GetUIntData(SqlHandle,1));
				int8* tmpName;
				Sql_GetData(SqlHandle,0,&tmpName,NULL);
				PInstance->setBcnmName(tmpName);
				PInstance->setTimeLimit(Sql_GetUIntData(SqlHandle,4));
				PInstance->setLevelCap(Sql_GetUIntData(SqlHandle,5));
				PInstance->setDropId(Sql_GetUIntData(SqlHandle,6));
				PInstance->setMaxParticipants(Sql_GetUIntData(SqlHandle,8));
				PInstance->setZoneId(Sql_GetUIntData(SqlHandle,9));
				PInstance->m_RuleMask = (uint16)Sql_GetUIntData(SqlHandle,7);
				return PInstance;
		}
		return NULL;
	}

	/***************************************************************
		Spawns monsters for the given BCNMID/Instance number by
		looking at bcnm_instance table for mob ids then spawning
		them and adding them to the monster list for the given
		instance.
	****************************************************************/
	bool spawnMonstersForBcnm(CInstance* instance){
		DSP_DEBUG_BREAK_IF(instance==NULL);

		//get ids from DB
		const int8* fmtQuery = "SELECT monsterId \
						    FROM bcnm_instance \
							WHERE bcnmId = %u AND instanceNumber = %u";
					  
		int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getID(), instance->getInstanceNumber());

		if (ret == SQL_ERROR || 
			Sql_NumRows(SqlHandle) == 0) 
		{
			ShowError("spawnMonstersForBcnm : SQL error - Cannot find any monster IDs for BCNMID %i Instance %i \n",
				instance->getID(), instance->getInstanceNumber());
		}
		else{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS){
				uint32 mobid = Sql_GetUIntData(SqlHandle,0);
				CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
				if (PMob != NULL)
				{
				    if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
				        PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
				    {
				        PMob->PBattleAI->SetLastActionTime(0);
				        PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

						if(strcmp(PMob->GetName(),"Maat")==0){//set job based on poppng char job
						//	PMob->
						//	ShowDebug("Change maat job to %i \n",instance->getPlayerMainJob());
						}
				        PMob->SetDespawnTimer(0); //never despawn
						ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,instance->getID(),instance->getInstanceNumber());
						instance->addEnemy(PMob);
				    } else {
				        ShowDebug(CL_CYAN"SpawnMobForBcnm: <%s> (%u) is alredy spawned\n" CL_RESET, PMob->GetName(), PMob->id);
				    }
				} else {
				    ShowDebug("SpawnMobForBcnm: mob %u not found\n", mobid);
				}
			}
			return true;
		}
		return false;
	}



	/***************************************************************
		Spawns treasure chest/armory crate, what ever on winning bcnm
	****************************************************************/
	bool spawnTreasureForBcnm(CInstance* instance){
		DSP_DEBUG_BREAK_IF(instance==NULL);

		//get ids from DB
		const int8* fmtQuery = "SELECT npcId \
						    FROM bcnm_treasure_chests \
							WHERE bcnmId = %u AND instanceNumber = %u";
					  
		int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getID(), instance->getInstanceNumber());

		if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0) 
		{
			ShowError("spawnTreasureForBcnm : SQL error - Cannot find any npc IDs for BCNMID %i Instance %i \n",
				instance->getID(), instance->getInstanceNumber());
		}
		else
		{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint32 npcid = Sql_GetUIntData(SqlHandle,0);
				CBaseEntity* PNpc = (CBaseEntity*)zoneutils::GetEntity(npcid, TYPE_NPC);
					if (PNpc != NULL)
					{
						PNpc->status = STATUS_NORMAL;
						instance->addNpc(PNpc);
						ShowDebug(CL_CYAN"Spawned %s id %i inst %i \n",PNpc->status,PNpc->id,instance->getInstanceNumber());
				    }else
						{
						ShowDebug(CL_CYAN"spawnTreasureForBcnm: <%s> is already spawned\n" CL_RESET, PNpc->GetName());
						}
			}
			return true;
		}
		return false;
	}



	/**************************************************************
	Called by ALL BCNMs to check winning conditions every tick. This
	is usually when all the monsters are defeated but can be other things
	(e.g. mob below X% HP, successful Steal, etc)
	***************************************************************/
	bool meetsWinningConditions(CInstance* instance, uint32 tick){
		//handle odd cases e.g. stop fight @ x% HP

		//handle Maat fights
		if(instance->getID()==1){//maat_horlais
			if(instance->isEnemyBelowHPP(50)){
				return true;
			}
		}

		//generic cases, kill all mobs
		if(instance->allEnemiesDefeated()){
			return true;
		}
		return false;
	}

	/**************************************************************
	Called by ALL BCNMs to check losing conditions every tick. This
	will be when everyone is dead and the death timer is >3min (usually)
	or when everyone has left, etc.
	****************************************************************/
	bool meetsLosingConditions(CInstance* instance, uint32 tick){
		//check for expired duration e.g. >30min. Need the tick>start check as the start can be assigned
		//after the tick initially due to threading
		if(tick>instance->getStartTime() && (tick - instance->getStartTime()) > instance->getTimeLimit()*1000){
			ShowDebug("BCNM %i inst:%i - You have exceeded your time limit!\n",instance->getID(),
				instance->getInstanceNumber(),tick,instance->getStartTime(),instance->getTimeLimit());
			return true;
		}

		instance->lastTick = tick;

		//check for all dead for 3min (or whatever the rule mask says)
		if(instance->getDeadTime()!=0){
			if(instance->m_RuleMask & RULES_REMOVE_3MIN){
			//	if(((tick - instance->getDeadTime())/1000) % 20 == 0){
			//		instance->pushMessageToAllInBcnm(200,180 - (tick - instance->getDeadTime())/1000);
			//	}
				if(tick - instance->getDeadTime() > 180000){
					ShowDebug("All players from the battlefield %i inst:%i have fallen for 3mins. Removing.\n",
						instance->getID(),instance->getInstanceNumber());
					return true;
				}
			}
			else{
				ShowDebug("All players have fallen. Failed battlefield %i inst %i. No 3min mask. \n",instance->getID(),instance->getInstanceNumber());
				return true;
			}
		}

		return false;
	}

	/*************************************************************
	Returns the losing exit position for this BCNM.
	****************************************************************/
	int* getLosePosition(CInstance* instance){
		if(instance==NULL){return NULL;}
		int position [4] = {0,0,0,0}; 

		switch(instance->getZoneId()){
		case 139: //Horlais Peak
			position[0]=-503; position[1]=158; position[2]=-212; position[3]=131;
			return position;
		}
	}

	int* getStartPosition(uint8 zoneid){
		int position[4] = {0,0,0,0};

		switch(zoneid){
		case 139: //Horlais Peak
			position[0]=-503; position[1]=158; position[2]=-212; position[3]=131;
			return position;
		case 144: //Waug. Shrine
			position[0]=-361; position[1]=100; position[2]=-260; position[3]=131;
			return position;
		case 146: //Balgas Dias
			position[0]=317; position[1]=-126; position[2]=380; position[3]=131;
			return position;
		case 165: //Throne Room
			position[0]=114; position[1]=-8; position[2]=0; position[3]=131;
			return position;
		case 206: //QuBia Arena
			position[0]=-241; position[1]=-26; position[2]=20; position[3]=131;
			return position;
		}
		return NULL;
	}

	/*************************************************************
	Returns the winning exit position for this BCNM.
	****************************************************************/
	int* getWinPosition(CInstance* instance){
		if(instance==NULL){return NULL;}
		int position [4] = {0,0,0,0}; 

		switch(instance->getZoneId()){
		case 139: //Horlais Peak
			position[0]=445; position[1]=-38; position[2]=-19; position[3]=200;
			return position;
		}
	}


	/*************************************************************
	Get loot from the armoury crate
	****************************************************************/

	void getChestItems(CInstance* instance){
		DropList_t* DropList = itemutils::GetDropList(instance->getDropId());

		if (DropList != NULL && DropList->size())
		{
			//get the number of loot groups for the bcnm
			const int8* fmtQuery = "SELECT MAX(bcnmGroupId) \
						    FROM mob_droplist \
							JOIN bcnm_info ON bcnm_info.LootDropId = mob_droplist.dropId \
							WHERE bcnm_info.LootDropId = %u LIMIT 1";
					  
			int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getDropId());

			if (ret == SQL_ERROR ||	Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS){
				ShowError("SQL error occured \n");
			} 
			else {

				int8 numberOflootGroups = Sql_GetUIntData(SqlHandle,0);

				//randomly shuffle the loot before picking process
				std::random_shuffle(DropList->begin(), DropList->end()); 

				while(numberOflootGroups >= 0)
				{
					//pick 1 drop per bcnm loot group
					for(uint8 i = 0; i < DropList->size(); ++i)
					{
						if(rand()%100 < DropList->at(i).DropRate && numberOflootGroups == DropList->at(i).BcnmGroupId && numberOflootGroups >= 0)
						{
							instance->m_PlayerList.at(0)->PTreasurePool->AddItemFromChest(DropList->at(i).ItemID, instance->m_NpcList.at(0)); 
							numberOflootGroups--;
						}
					}
				}
			}
		}
	//user opened chest, complete bcnm
	instance->winBcnm();
	}
	
	bool spawnSecondPartDynamis(CInstance* instance){
		DSP_DEBUG_BREAK_IF(instance==NULL);

		//get ids from DB
		const int8* fmtQuery = "SELECT monsterId \
								FROM bcnm_instance \
								WHERE bcnmId = %u AND instanceNumber = 2";
					  
		int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getID());

		if (ret == SQL_ERROR || 
			Sql_NumRows(SqlHandle) == 0) 
		{
			ShowError("spawnSecondPartDynamis : SQL error - Cannot find any monster IDs for Dynamis %i \n",
				instance->getID(), instance->getInstanceNumber());
		}
		else{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS){
				uint32 mobid = Sql_GetUIntData(SqlHandle,0);
				CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
				if (PMob != NULL)
				{
				    if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
				        PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
				    {
				        PMob->PBattleAI->SetLastActionTime(0);
				        PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

				        PMob->SetDespawnTimer(0); //never despawn
						ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,instance->getID(),instance->getInstanceNumber());
						instance->addEnemy(PMob);
				    } else {
				        ShowDebug(CL_CYAN"spawnSecondPartDynamis: <%s> (%u) is alredy spawned\n" CL_RESET, PMob->GetName(), PMob->id);
				    }
				} else {
				    ShowDebug("spawnSecondPartDynamis: mob %u not found\n", mobid);
				}
			}
			return true;
		}
		return false;
	}
};