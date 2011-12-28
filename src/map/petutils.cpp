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

#include "../common/timer.h"

#include <string.h>
#include <vector>

#include "charentity.h"
#include "map.h"
#include "petentity.h"
#include "petutils.h"
#include "zoneutils.h"

#include "ai/ai_pet_dummy.h"

#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/entity_update.h"
#include "packets/pet_sync.h"

struct Pet_t
{
	look_t		look;		// внешний вид
	string_t	name;		// имя
	ECOSYSTEM	EcoSystem;	// эко-система

	uint8		minLevel;	// минимально-возможный  уровень
	uint8		maxLevel;	// максимально-возможный уровень

	uint8		size;		// размер модели

	uint32		time;		// время существования (будет использоваться для задания длительности статус эффекта)
};

std::vector<Pet_t*> g_PPetList;

namespace petutils
{

/************************************************************************
*																		*
*  Загружаем список прототипов питомцев									*
*																		*
************************************************************************/

void LoadPetList()
{
	FreePetList();

	const int8* fmtQuery = "SELECT pet_list.name, modelid, minLevel, maxLevel, time, mobsize, systemid \
						    FROM pet_list, mob_pools, mob_family_system \
							WHERE pet_list.poolid = mob_pools.poolid AND mob_pools.familyid = mob_family_system.familyid";

	if( Sql_Query(SqlHandle,fmtQuery) != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			Pet_t* Pet = new Pet_t();
			
			Pet->name.insert(0,Sql_GetData(SqlHandle,0));

			memcpy(&Pet->look,Sql_GetData(SqlHandle,1),20);

			Pet->minLevel = (uint8)Sql_GetIntData(SqlHandle,2);
			Pet->maxLevel = (uint8)Sql_GetIntData(SqlHandle,3);
			Pet->time = Sql_GetUIntData(SqlHandle,4);
			Pet->size = Sql_GetUIntData(SqlHandle,5);
			Pet->EcoSystem = (ECOSYSTEM)Sql_GetIntData(SqlHandle,6);
			
			g_PPetList.push_back(Pet);
		}
	}
}

/************************************************************************
*																		*
*  Освобождаем список прототипов питомцев								*
*																		*
************************************************************************/

void FreePetList()
{
	while(!g_PPetList.empty())
	{
		delete *g_PPetList.begin();
		g_PPetList.erase(g_PPetList.begin());
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void SpawnPet(CBattleEntity* PMaster, uint32 PetID)
{
	DSP_DEBUG_BREAK_IF(PetID >= g_PPetList.size());

	CPetEntity* PPet = new CPetEntity();

	PPet->loc = PMaster->loc;

	PPet->look = g_PPetList.at(PetID)->look;
	PPet->name = g_PPetList.at(PetID)->name;

	PPet->health.hp    = 1;
	PPet->health.maxhp = 1;

	PPet->status = STATUS_NORMAL;
	PPet->m_ModelSize += g_PPetList.at(PetID)->size;
	PPet->m_EcoSystem  = g_PPetList.at(PetID)->EcoSystem;

	PPet->PBattleAI = new CAIPetDummy(PPet);
	PPet->PBattleAI->SetLastActionTime(gettick());
	PPet->PBattleAI->SetCurrentAction(ACTION_SPAWN);
	PPet->PBattleAI->SetCurrentZone(zoneutils::GetZone(PMaster->getZone()));

    PMaster->PPet = PPet;
	PPet->PMaster = PMaster;

	zoneutils::GetZone(PMaster->getZone())->InsertPET(PPet);

	if (PMaster->objtype == TYPE_PC)
	{
		((CCharEntity*)PMaster)->pushPacket(new CCharUpdatePacket((CCharEntity*)PMaster));
		((CCharEntity*)PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)PMaster));
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void DespawnPet(CBattleEntity* PMaster)
{
	DSP_DEBUG_BREAK_IF(PMaster->PPet == NULL);

	CBattleEntity* PPet = PMaster->PPet;

	switch (PPet->objtype)
	{
		case TYPE_PET:
		{
			PPet->PBattleAI->SetCurrentAction(ACTION_DEATH);
		}
		break;
		case TYPE_MOB:
		{
			// освобождаем монстра из под контроля
		}
		break;
		case TYPE_PC:
		{
			// освобождаем персонажа из под контроля
		}
		break;
	}
}

}; // namespace petutils
