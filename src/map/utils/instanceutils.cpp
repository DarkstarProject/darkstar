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

#include "../entities/charentity.h"
#include "../entities/mobentity.h"
#include "../party.h"
#include "charutils.h"
#include "../alliance.h"
#include "zoneutils.h"
#include "itemutils.h"
#include "instanceutils.h"
#include "../instance.h"
#include "../instance_handler.h"
#include "../packets/entity_update.h"

namespace instanceutils{
	/***************************************************************
		Loads the given instance from the database and returns
		a new Instance object.
	****************************************************************/
	CInstance* loadInstance(CInstanceHandler* hand, uint16 bcnmid, INSTANCETYPE type){
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
				CInstance* PInstance = new CInstance(hand,Sql_GetUIntData(SqlHandle,1), type);
				int8* tmpName;
				Sql_GetData(SqlHandle,0,&tmpName,NULL);
				PInstance->setBcnmName(tmpName);
				PInstance->setTimeLimit(Sql_GetUIntData(SqlHandle,4));
				PInstance->setLevelCap(Sql_GetUIntData(SqlHandle,5));
				PInstance->setLootId(Sql_GetUIntData(SqlHandle,6));
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
		const int8* fmtQuery = "SELECT monsterId, conditions \
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
				uint8 condition = Sql_GetUIntData(SqlHandle,1);
				CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
				if (PMob != NULL)
				{

					PMob->m_instanceID = instance->getInstanceNumber();
					PMob->m_bcnmID = instance->getID();

					if (condition & CONDITION_SPAWNED_AT_START)
					{
						// This condition is needed for some mob at dynamis, else he don't pop
						if(PMob->PBattleAI->GetCurrentAction() == ACTION_FADE_OUT){
							PMob->PBattleAI->SetLastActionTime(0);
							PMob->PBattleAI->SetCurrentAction(ACTION_NONE);
						}
						if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
							PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
						{
							PMob->PBattleAI->SetLastActionTime(0);
							PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

							if(strcmp(PMob->GetName(),"Maat")==0){
								mobutils::SetupMaat(PMob, (JOBTYPE)instance->getPlayerMainJob());
								PMob->m_DropID = 4485; //Give Maat his stealable Warp Scroll 

								// disable players subjob
								instance->disableSubJob();

								// disallow subjob, this will enable for later
								instance->m_RuleMask &= ~(1 << RULES_ALLOW_SUBJOBS);

							}
							//ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,instance->getID(),instance->getInstanceNumber());
							instance->addEnemy(PMob, condition);
						} else {
							ShowDebug(CL_CYAN"SpawnMobForBcnm: <%s> (%u) is alredy spawned\n" CL_RESET, PMob->GetName(), PMob->id);
						}
					} else {
						instance->addEnemy(PMob, condition);
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
						PNpc->animation = 0;
						PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_SPAWN));
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
		if(instance->locked && (instance->m_RuleMask & RULES_MAAT))
		{
			// survive for 5 mins
			if(instance->getPlayerMainJob() == JOB_WHM && (tick - instance->fightTick) > 5 * 60 * 1000)
				return true;

			if(instance->isEnemyBelowHPP(10))
				return true;
			
			
			if(instance->getPlayerMainJob() == JOB_THF && instance->m_EnemyList.at(0)->m_ItemStolen) //thf can win by stealing from maat only if maat not previously defeated
			{
			    const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;";
			    int32 ret = Sql_Query(SqlHandle,fmtQuery,instance->m_PlayerList.at(0)->id, "maatDefeated");
			    if(ret != SQL_ERROR && Sql_NumRows(SqlHandle) == 0)
			        return true;
			    else if(ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			    {
			        int16 value = (int16)Sql_GetIntData(SqlHandle,0);
			        if(value <= 0)
			            return true;
			    }
			}
		}

		// savage
		if(instance->getID() == 961 && instance->isEnemyBelowHPP(30)){
			return true;
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
	void getLosePosition(CInstance* instance, int (&pPosition)[4]){
		if(instance==NULL)
			return;

		switch(instance->getZoneId()){
		case 139: //Horlais Peak
			pPosition[0]=-503; pPosition[1]=158; pPosition[2]=-212; pPosition[3]=131;
			break;
		}
	}

	void getStartPosition(uint8 zoneid, int (&pPosition)[4]){

		switch(zoneid){
		case 139: //Horlais Peak
			pPosition[0]=-503; pPosition[1]=158; pPosition[2]=-212; pPosition[3]=131;
			break;
		case 144: //Waug. Shrine
			pPosition[0]=-361; pPosition[1]=100; pPosition[2]=-260; pPosition[3]=131;
			break;
		case 146: //Balgas Dias
			pPosition[0]=317; pPosition[1]=-126; pPosition[2]=380; pPosition[3]=131;
			break;
		case 165: //Throne Room
			pPosition[0]=114; pPosition[1]=-8; pPosition[2]=0; pPosition[3]=131;
			break;
		case 206: //QuBia Arena
			pPosition[0]=-241; pPosition[1]=-26; pPosition[2]=20; pPosition[3]=131;
			break;
		}
	}

	/*************************************************************
	Returns the winning exit position for this BCNM.
	****************************************************************/
	void getWinPosition(CInstance* instance, int (&pPosition)[4]){
		if(instance==NULL)
			return;

		switch(instance->getZoneId()){
		case 139: //Horlais Peak
			pPosition[0]=445; pPosition[1]=-38; pPosition[2]=-19; pPosition[3]=200;
			break;
		}
	}


	uint8 getMaxLootGroups(CInstance* instance){
		const int8* fmtQuery = "SELECT MAX(lootGroupId) \
						FROM bcnm_loot \
						JOIN bcnm_info ON bcnm_info.LootDropId = bcnm_loot.LootDropId \
						WHERE bcnm_info.LootDropId = %u LIMIT 1";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getLootId());
		if (ret == SQL_ERROR ||	Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS){
				ShowError("SQL error occured \n");
				return 0;
			}
			else {
				return (uint8)Sql_GetUIntData(SqlHandle,0);
			}
	}

	uint16 getRollsPerGroup(CInstance* instance, uint8 groupID){
		const int8* fmtQuery = "SELECT SUM(CASE \
			WHEN LootDropID = %u \
			AND lootGroupId = %u \
			THEN rolls  \
			ELSE 0 END) \
			FROM bcnm_loot;";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, instance->getLootId(), groupID);
		if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS){
			ShowError("SQL error occured \n");
			return 0;
		}
		else {
			return (uint16)Sql_GetUIntData(SqlHandle,0);
		}
	}

	/*************************************************************
	Get loot from the armoury crate
	****************************************************************/

  void getChestItems(CInstance* instance){
    int instzone = instance->getZoneId();
	uint8 maxloot = 0;
		LootList_t* LootList = itemutils::GetLootList(instance->getLootId());

		if (LootList == NULL){
			ShowError("BCNM Chest opened with no valid loot list!");
			//no loot available for bcnm. End bcnm.
			instance->winBcnm();
			return;
		}
		else
		{
		  for (uint8 sizeoflist=0; sizeoflist < LootList->size() ; ++sizeoflist){
			    if(LootList->at(sizeoflist).LootGroupId > maxloot){
			    maxloot= LootList->at(sizeoflist).LootGroupId;
				}
		  }
		}
		//getMaxLootGroups(instance);
	   if(maxloot!=0){
		 for (uint8 group = 0; group <= maxloot; ++group){
			uint16 maxRolls = getRollsPerGroup(instance,group);
			uint16 groupRoll = (uint16)(WELL512::irand()%maxRolls);
			uint16 itemRolls = 0;

			for (uint8 item = 0; item < LootList->size(); ++item)
			{
				if (group == LootList->at(item).LootGroupId)
				{
					itemRolls += LootList->at(item).Rolls;
					if (groupRoll <= itemRolls)
					{
						instance->m_PlayerList.at(0)->PTreasurePool->AddItemFromChest(LootList->at(item).ItemID, instance->m_NpcList.at(0));
						break;
					}
				}
			}
		  }
		}
	//user opened chest, complete bcnm
		  if(instzone!=37 && instzone!=38 ){
	       instance->winBcnm();
		  }
		  else{
		   instance->m_NpcList.clear();
		 }

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

						PMob->m_instanceID = instance->getInstanceNumber();

						ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,instance->getID(),instance->getInstanceNumber());
						instance->addEnemy(PMob, CONDITION_SPAWNED_AT_START & CONDITION_WIN_REQUIREMENT);
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