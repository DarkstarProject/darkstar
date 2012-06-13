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

#include "charentity.h"
#include "mobentity.h"
#include "zoneutils.h"
#include "instanceutils.h"
#include "instance.h"

namespace instanceutils{
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
						
				        PMob->SetDespawnTimer(0); //never despawn
						ShowDebug("Spawned %s id %i inst %i \n",PMob->GetName(),instance->getID(),instance->getInstanceNumber());
						instance->addEnemy(PMob);
				    } else {
				        ShowDebug(CL_CYAN"SpawnMobForBcnm: <%s> is alredy spawned\n"CL_RESET, PMob->GetName());
				    }
				} else {
				    ShowDebug("SpawnMobForBcnm: mob %u not found\n", mobid);
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
		//check for expired duration e.g. >30min
		if(tick - instance->getStartTime() > instance->getTimeLimit()*1000){
			ShowDebug("BCNM %i inst:%i - You have exceeded your time limit! tick %u start %u limit %u \n",instance->getID(),
				instance->getInstanceNumber(),tick,instance->getStartTime(),instance->getTimeLimit());
			return true;
		}

		//check for all dead for 3min (or whatever the rule mask says)
		if(instance->getDeadTime()!=0){
			if(instance->m_RuleMask & RULES_REMOVE_3MIN){
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

};