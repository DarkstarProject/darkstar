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
#include <string.h>

#include "../entities/charentity.h"
#include "../entities/mobentity.h"
#include "../party.h"
#include "charutils.h"
#include "../alliance.h"
#include "zoneutils.h"
#include "itemutils.h"
#include "battlefieldutils.h"
#include "../battlefield.h"
#include "../battlefield_handler.h"
#include "../packets/entity_update.h"

namespace battlefieldutils{
	/***************************************************************
		Loads the given battlefield from the database and returns
		a new Battlefield object.
	****************************************************************/
	CBattlefield* loadBattlefield(CBattlefieldHandler* hand, uint16 bcnmid, BATTLEFIELDTYPE type){
		const int8* fmtQuery = "SELECT name, bcnmId, fastestName, fastestTime, timeLimit, levelCap, lootDropId, rules, partySize, zoneId \
						    FROM bcnm_info \
							WHERE bcnmId = %u";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, bcnmid);

		if (ret == SQL_ERROR ||
		Sql_NumRows(SqlHandle) == 0 ||
		Sql_NextRow(SqlHandle) != SQL_SUCCESS)
		{
			ShowError("Cannot load battlefield BCNM:%i \n",bcnmid);
		}
		else
		{
				CBattlefield* PBattlefield = new CBattlefield(hand,Sql_GetUIntData(SqlHandle,1), type);
				int8* tmpName;
				Sql_GetData(SqlHandle,0,&tmpName,nullptr);
				PBattlefield->setBcnmName(tmpName);
				PBattlefield->setTimeLimit(Sql_GetUIntData(SqlHandle,4));
				PBattlefield->setLevelCap(Sql_GetUIntData(SqlHandle,5));
				PBattlefield->setLootId(Sql_GetUIntData(SqlHandle,6));
				PBattlefield->setMaxParticipants(Sql_GetUIntData(SqlHandle,8));
				PBattlefield->setZoneId(Sql_GetUIntData(SqlHandle,9));
				PBattlefield->m_RuleMask = (uint16)Sql_GetUIntData(SqlHandle,7);
				return PBattlefield;
		}
		return nullptr;
	}

	/***************************************************************
		Spawns monsters for the given BCNMID/Battlefield number by
		looking at bcnm_battlefield table for mob ids then spawning
		them and adding them to the monster list for the given
		battlefield.
	****************************************************************/
	bool spawnMonstersForBcnm(CBattlefield* battlefield){
		DSP_DEBUG_BREAK_IF(battlefield==nullptr);

		//get ids from DB
		const int8* fmtQuery = "SELECT monsterId, conditions \
						    FROM bcnm_battlefield \
							WHERE bcnmId = %u AND battlefieldNumber = %u";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getID(), battlefield->getBattlefieldNumber());

		if (ret == SQL_ERROR ||
			Sql_NumRows(SqlHandle) == 0)
		{
			ShowError("spawnMonstersForBcnm : SQL error - Cannot find any monster IDs for BCNMID %i Battlefield %i \n",
				battlefield->getID(), battlefield->getBattlefieldNumber());
		}
		else{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS){
				uint32 mobid = Sql_GetUIntData(SqlHandle,0);
				uint8 condition = Sql_GetUIntData(SqlHandle,1);
				CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
				if (PMob != nullptr)
				{

					PMob->m_battlefieldID = battlefield->getBattlefieldNumber();
					PMob->m_bcnmID = battlefield->getID();

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
								mobutils::InitializeMaat(PMob, (JOBTYPE)battlefield->getPlayerMainJob());

								// disable players subjob
								battlefield->disableSubJob();

								// disallow subjob, this will enable for later
								battlefield->m_RuleMask &= ~(1 << RULES_ALLOW_SUBJOBS);

							}
							//ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,battlefield->getID(),battlefield->getBattlefieldNumber());
							battlefield->addEnemy(PMob, condition);
						} else {
							ShowDebug(CL_CYAN"SpawnMobForBcnm: <%s> (%u) is already spawned\n" CL_RESET, PMob->GetName(), PMob->id);
						}
					} else {
						battlefield->addEnemy(PMob, condition);
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
	bool spawnTreasureForBcnm(CBattlefield* battlefield){
		DSP_DEBUG_BREAK_IF(battlefield==nullptr);

		//get ids from DB
		const int8* fmtQuery = "SELECT npcId \
						    FROM bcnm_treasure_chests \
							WHERE bcnmId = %u AND battlefieldNumber = %u";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getID(), battlefield->getBattlefieldNumber());

		if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0)
		{
			ShowError("spawnTreasureForBcnm : SQL error - Cannot find any npc IDs for BCNMID %i Battlefield %i \n",
				battlefield->getID(), battlefield->getBattlefieldNumber());
		}
		else
		{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint32 npcid = Sql_GetUIntData(SqlHandle,0);
				CBaseEntity* PNpc = (CBaseEntity*)zoneutils::GetEntity(npcid, TYPE_NPC);
					if (PNpc != nullptr)
					{
						PNpc->status = STATUS_NORMAL;
						PNpc->animation = 0;
						PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_SPAWN, UPDATE_ALL_MOB));
						battlefield->addNpc(PNpc);
						ShowDebug(CL_CYAN"Spawned %s id %i inst %i \n",PNpc->status,PNpc->id,battlefield->getBattlefieldNumber());
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
	bool meetsWinningConditions(CBattlefield* battlefield, uint32 tick){

		if (battlefield->won()) return true;

		//handle odd cases e.g. stop fight @ x% HP

		//handle Maat fights
		if(battlefield->locked && (battlefield->m_RuleMask & RULES_MAAT))
		{
			// survive for 5 mins
			if(battlefield->getPlayerMainJob() == JOB_WHM && (tick - battlefield->fightTick) > 5 * 60 * 1000)
				return true;

			if(battlefield->isEnemyBelowHPP(10))
				return true;
			
			
			if(battlefield->getPlayerMainJob() == JOB_THF && battlefield->m_EnemyList.at(0)->m_ItemStolen) //thf can win by stealing from maat only if maat not previously defeated
			{
			    const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;";
			    int32 ret = Sql_Query(SqlHandle,fmtQuery,battlefield->m_PlayerList.at(0)->id, "maatDefeated");
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
		if(battlefield->getID() == 961 && battlefield->isEnemyBelowHPP(30)){
			return true;
		}

		//generic cases, kill all mobs
		if(battlefield->allEnemiesDefeated()){
			return true;
		}
		return false;
	}

	/**************************************************************
	Called by ALL BCNMs to check losing conditions every tick. This
	will be when everyone is dead and the death timer is >3min (usually)
	or when everyone has left, etc.
	****************************************************************/
	bool meetsLosingConditions(CBattlefield* battlefield, uint32 tick){
		if (battlefield->lost()) return true;
		//check for expired duration e.g. >30min. Need the tick>start check as the start can be assigned
		//after the tick initially due to threading
		if(tick>battlefield->getStartTime() && (tick - battlefield->getStartTime()) > battlefield->getTimeLimit()*1000){
			ShowDebug("BCNM %i inst:%i - You have exceeded your time limit!\n",battlefield->getID(),
				battlefield->getBattlefieldNumber(),tick,battlefield->getStartTime(),battlefield->getTimeLimit());
			return true;
		}

		battlefield->lastTick = tick;

		//check for all dead for 3min (or whatever the rule mask says)
		if(battlefield->getDeadTime()!=0){
			if(battlefield->m_RuleMask & RULES_REMOVE_3MIN){
			//	if(((tick - battlefield->getDeadTime())/1000) % 20 == 0){
			//		battlefield->pushMessageToAllInBcnm(200,180 - (tick - battlefield->getDeadTime())/1000);
			//	}
				if(tick - battlefield->getDeadTime() > 180000){
					ShowDebug("All players from the battlefield %i inst:%i have fallen for 3mins. Removing.\n",
						battlefield->getID(),battlefield->getBattlefieldNumber());
					return true;
				}
			}
			else{
				ShowDebug("All players have fallen. Failed battlefield %i inst %i. No 3min mask. \n",battlefield->getID(),battlefield->getBattlefieldNumber());
				return true;
			}
		}

		return false;
	}

	/*************************************************************
	Returns the losing exit position for this BCNM.
	****************************************************************/
	void getLosePosition(CBattlefield* battlefield, int (&pPosition)[4]){
		if(battlefield==nullptr)
			return;

		switch(battlefield->getZoneId()){
		case 139: //Horlais Peak
			pPosition[0]=-503; pPosition[1]=158; pPosition[2]=-212; pPosition[3]=131;
			break;
		}
	}

	void getStartPosition(uint16 zoneid, int (&pPosition)[4]){

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
	void getWinPosition(CBattlefield* battlefield, int (&pPosition)[4]){
		if(battlefield==nullptr)
			return;

		switch(battlefield->getZoneId()){
		case 139: //Horlais Peak
			pPosition[0]=445; pPosition[1]=-38; pPosition[2]=-19; pPosition[3]=200;
			break;
		}
	}


	uint8 getMaxLootGroups(CBattlefield* battlefield){
		const int8* fmtQuery = "SELECT MAX(lootGroupId) \
						FROM bcnm_loot \
						JOIN bcnm_info ON bcnm_info.LootDropId = bcnm_loot.LootDropId \
						WHERE bcnm_info.LootDropId = %u LIMIT 1";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getLootId());
		if (ret == SQL_ERROR ||	Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS){
				ShowError("SQL error occured \n");
				return 0;
			}
			else {
				return (uint8)Sql_GetUIntData(SqlHandle,0);
			}
	}

	uint16 getRollsPerGroup(CBattlefield* battlefield, uint8 groupID){
		const int8* fmtQuery = "SELECT SUM(CASE \
			WHEN LootDropID = %u \
			AND lootGroupId = %u \
			THEN rolls  \
			ELSE 0 END) \
			FROM bcnm_loot;";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getLootId(), groupID);
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

  void getChestItems(CBattlefield* battlefield){
    int instzone = battlefield->getZoneId();
	uint8 maxloot = 0;
		LootList_t* LootList = itemutils::GetLootList(battlefield->getLootId());

		if (LootList == nullptr){
			ShowError("BCNM Chest opened with no valid loot list!");
			//no loot available for bcnm. End bcnm.
			battlefield->winBcnm();
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
		//getMaxLootGroups(battlefield);
	   if(maxloot!=0){
		 for (uint8 group = 0; group <= maxloot; ++group){
			uint16 maxRolls = getRollsPerGroup(battlefield,group);
            uint16 groupRoll = dsprand::GetRandomNumber(maxRolls);
			uint16 itemRolls = 0;

			for (uint8 item = 0; item < LootList->size(); ++item)
			{
				if (group == LootList->at(item).LootGroupId)
				{
					itemRolls += LootList->at(item).Rolls;
					if (groupRoll <= itemRolls)
					{
						battlefield->m_PlayerList.at(0)->PTreasurePool->AddItem(LootList->at(item).ItemID, battlefield->m_NpcList.at(0));
						break;
					}
				}
			}
		  }
		}
	//user opened chest, complete bcnm
		  if(instzone!=37 && instzone!=38 ){
	       battlefield->winBcnm();
		  }
		  else{
		   battlefield->m_NpcList.clear();
		 }

	}

	bool spawnSecondPartDynamis(CBattlefield* battlefield){
		DSP_DEBUG_BREAK_IF(battlefield==nullptr);

		//get ids from DB
		const int8* fmtQuery = "SELECT monsterId \
								FROM bcnm_battlefield \
								WHERE bcnmId = %u AND battlefieldNumber = 2";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getID());

		if (ret == SQL_ERROR ||
			Sql_NumRows(SqlHandle) == 0)
		{
			ShowError("spawnSecondPartDynamis : SQL error - Cannot find any monster IDs for Dynamis %i \n",
				battlefield->getID(), battlefield->getBattlefieldNumber());
		}
		else{
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS){
				uint32 mobid = Sql_GetUIntData(SqlHandle,0);
				CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
				if (PMob != nullptr)
				{
				    if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
				        PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
				    {
				        PMob->PBattleAI->SetLastActionTime(0);
				        PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

						PMob->m_battlefieldID = battlefield->getBattlefieldNumber();

						ShowDebug("Spawned %s (%u) id %i inst %i \n",PMob->GetName(),PMob->id,battlefield->getID(),battlefield->getBattlefieldNumber());
						battlefield->addEnemy(PMob, CONDITION_SPAWNED_AT_START & CONDITION_WIN_REQUIREMENT);
				    } else {
				        ShowDebug(CL_CYAN"spawnSecondPartDynamis: <%s> (%u) is already spawned\n" CL_RESET, PMob->GetName(), PMob->id);
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
