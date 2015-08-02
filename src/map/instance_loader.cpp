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

#include <chrono>
#include <future>

#include "instance_loader.h"
#include "zone_instance.h"

#include "ai/ai_mob_dummy.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"
#include "entities/npcentity.h"
#include "lua/luautils.h"

CInstanceLoader::CInstanceLoader(uint8 instanceid, CZone* PZone, CCharEntity* PRequester)
{
    DSP_DEBUG_BREAK_IF(PZone->GetType() != ZONETYPE_DUNGEON_INSTANCED);

	requester = PRequester;
    zone = PZone;
    CInstance* instance = ((CZoneInstance*)PZone)->CreateInstance(instanceid);

	SqlInstanceHandle = Sql_Malloc();

	if (Sql_Connect(SqlInstanceHandle, map_config.mysql_login,
		map_config.mysql_password,
		map_config.mysql_host,
		map_config.mysql_port,
		map_config.mysql_database) == SQL_ERROR)
	{
		do_final(EXIT_FAILURE);
	}
	Sql_Keepalive(SqlInstanceHandle);

	task = std::async(std::launch::async, &CInstanceLoader::LoadInstance, this, instance);
}

CInstanceLoader::~CInstanceLoader()
{
	Sql_Free(SqlInstanceHandle);
}

bool CInstanceLoader::Check()
{
	if (task.valid())
	{
		if (task.wait_for(std::chrono::milliseconds(0)) == std::future_status::ready)
		{
			CInstance* instance = task.get();
			if (!instance)
			{
				//Instance failed to load
				luautils::OnInstanceCreated(requester, nullptr);
			}
			else
			{
                // finish loading by launching remaining setup scripts
                for (auto PMob : instance->m_mobList)
                {
                    luautils::OnMobInitialize(PMob.second);
                    ((CMobEntity*)PMob.second)->saveModifiers();
                    ((CMobEntity*)PMob.second)->saveMobModifiers();
                }
                for (auto PNpc : instance->m_npcList)
                {
                    luautils::OnNpcSpawn(PNpc.second);
                }
				luautils::OnInstanceCreated(requester, instance);
				luautils::OnInstanceCreated(instance);
			}
			return true;
		}
	}
	return false;
}

CInstance* CInstanceLoader::LoadInstance(CInstance* instance)
{
	int8* Query =
		"SELECT mobname, mobid, pos_rot, pos_x, pos_y, pos_z, \
		respawntime, spawntype, dropid, mob_groups.HP, mob_groups.MP, minLevel, maxLevel, \
		modelid, mJob, sJob, cmbSkill, cmbDmgMult, cmbDelay, behavior, links, mobType, immunity, \
		systemid, mobsize, speed, \
		STR, DEX, VIT, AGI, `INT`, MND, CHR, EVA, DEF, \
		Slash, Pierce, H2H, Impact, \
		Fire, Ice, Wind, Earth, Lightning, Water, Light, Dark, Element, \
		mob_pools.familyid, name_prefix, flags, animationsub, \
		(mob_family_system.HP / 100), (mob_family_system.MP / 100), hasSpellScript, spellList, ATT, ACC, mob_groups.poolid, \
		allegiance, namevis, aggro, mob_groups.roam_distance \
		FROM instance_entities INNER JOIN mob_spawn_points ON instance_entities.id = mob_spawn_points.mobid \
		INNER JOIN mob_groups ON mob_groups.groupid = mob_spawn_points.groupid \
		INNER JOIN mob_pools ON mob_groups.poolid = mob_pools.poolid \
		INNER JOIN mob_family_system ON mob_pools.familyid = mob_family_system.familyid \
		WHERE instanceid = %u AND NOT (pos_x = 0 AND pos_y = 0 AND pos_z = 0);";

	int32 ret = Sql_Query(SqlInstanceHandle, Query, instance->GetID());

	if (!instance->Failed() && ret != SQL_ERROR && Sql_NumRows(SqlInstanceHandle) != 0)
	{
		while (Sql_NextRow(SqlInstanceHandle) == SQL_SUCCESS)
		{
			CMobEntity* PMob = new CMobEntity;

			PMob->name.insert(0, Sql_GetData(SqlInstanceHandle, 0));
			PMob->id = (uint32)Sql_GetUIntData(SqlInstanceHandle, 1);
			PMob->targid = (uint16)PMob->id & 0x0FFF;

			PMob->m_SpawnPoint.rotation = (uint8)Sql_GetIntData(SqlInstanceHandle, 2);
			PMob->m_SpawnPoint.x = Sql_GetFloatData(SqlInstanceHandle, 3);
			PMob->m_SpawnPoint.y = Sql_GetFloatData(SqlInstanceHandle, 4);
			PMob->m_SpawnPoint.z = Sql_GetFloatData(SqlInstanceHandle, 5);

			PMob->m_RespawnTime = Sql_GetUIntData(SqlInstanceHandle, 6) * 1000;
			PMob->m_SpawnType = (SPAWNTYPE)Sql_GetUIntData(SqlInstanceHandle, 7);
			PMob->m_DropID = Sql_GetUIntData(SqlInstanceHandle, 8);

			PMob->HPmodifier = (uint32)Sql_GetIntData(SqlInstanceHandle, 9);
			PMob->MPmodifier = (uint32)Sql_GetIntData(SqlInstanceHandle, 10);

			PMob->m_minLevel = (uint8)Sql_GetIntData(SqlInstanceHandle, 11);
			PMob->m_maxLevel = (uint8)Sql_GetIntData(SqlInstanceHandle, 12);

			memcpy(&PMob->look, Sql_GetData(SqlInstanceHandle, 13), 23);

			PMob->SetMJob(Sql_GetIntData(SqlInstanceHandle, 14));
			PMob->SetSJob(Sql_GetIntData(SqlInstanceHandle, 15));

			PMob->m_Weapons[SLOT_MAIN]->setMaxHit(1);
			PMob->m_Weapons[SLOT_MAIN]->setSkillType(Sql_GetIntData(SqlInstanceHandle, 16));
			PMob->m_dmgMult = Sql_GetUIntData(SqlInstanceHandle, 17);
			PMob->m_Weapons[SLOT_MAIN]->setDelay((Sql_GetIntData(SqlInstanceHandle, 18) * 1000) / 60);
			PMob->m_Weapons[SLOT_MAIN]->setBaseDelay((Sql_GetIntData(SqlInstanceHandle, 18) * 1000) / 60);

			PMob->m_Behaviour = (uint16)Sql_GetIntData(SqlInstanceHandle, 19);
			PMob->m_Link = (uint8)Sql_GetIntData(SqlInstanceHandle, 20);
			PMob->m_Type = (uint8)Sql_GetIntData(SqlInstanceHandle, 21);
			PMob->m_Immunity = (IMMUNITY)Sql_GetIntData(SqlInstanceHandle, 22);
			PMob->m_EcoSystem = (ECOSYSTEM)Sql_GetIntData(SqlInstanceHandle, 23);
			PMob->m_ModelSize += (uint8)Sql_GetIntData(SqlInstanceHandle, 24);

			PMob->speed = (uint8)Sql_GetIntData(SqlInstanceHandle, 25);
			PMob->speedsub = (uint8)Sql_GetIntData(SqlInstanceHandle, 25);

			PMob->strRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 26);
			PMob->dexRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 27);
			PMob->vitRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 28);
			PMob->agiRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 29);
			PMob->intRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 30);
			PMob->mndRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 31);
			PMob->chrRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 32);
			PMob->evaRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 33);
			PMob->defRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 34);
			PMob->attRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 56);
			PMob->accRank = (uint8)Sql_GetIntData(SqlInstanceHandle, 57);

			PMob->setModifier(MOD_SLASHRES, (uint16)(Sql_GetFloatData(SqlInstanceHandle, 35) * 1000));
			PMob->setModifier(MOD_PIERCERES, (uint16)(Sql_GetFloatData(SqlInstanceHandle, 36) * 1000));
			PMob->setModifier(MOD_HTHRES, (uint16)(Sql_GetFloatData(SqlInstanceHandle, 37) * 1000));
			PMob->setModifier(MOD_IMPACTRES, (uint16)(Sql_GetFloatData(SqlInstanceHandle, 38) * 1000));

			PMob->setModifier(MOD_FIREDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 39) - 1) * -1000)); // These are stored as floating percentages
			PMob->setModifier(MOD_ICEDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 40) - 1) * -1000)); // and need to be adjusted into modifier units.
			PMob->setModifier(MOD_WINDDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 41) - 1) * -1000)); // Higher DEF = lower damage.
			PMob->setModifier(MOD_EARTHDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 42) - 1) * -1000)); // Negatives signify increased damage.
			PMob->setModifier(MOD_THUNDERDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 43) - 1) * -1000)); // Positives signify reduced damage.
			PMob->setModifier(MOD_WATERDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 44) - 1) * -1000)); // Ex: 125% damage would be 1.25, 50% damage would be 0.50
			PMob->setModifier(MOD_LIGHTDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 45) - 1) * -1000)); // (1.25 - 1) * -1000 = -250 DEF
			PMob->setModifier(MOD_DARKDEF, (int16)((Sql_GetFloatData(SqlInstanceHandle, 46) - 1) * -1000)); // (0.50 - 1) * -1000 = 500 DEF

			PMob->setModifier(MOD_FIRERES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 39) - 1) * -100)); // These are stored as floating percentages
			PMob->setModifier(MOD_ICERES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 40) - 1) * -100)); // and need to be adjusted into modifier units.
			PMob->setModifier(MOD_WINDRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 41) - 1) * -100)); // Higher RES = lower damage.
			PMob->setModifier(MOD_EARTHRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 42) - 1) * -100)); // Negatives signify lower resist chance.
			PMob->setModifier(MOD_THUNDERRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 43) - 1) * -100)); // Positives signify increased resist chance.
			PMob->setModifier(MOD_WATERRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 44) - 1) * -100));
			PMob->setModifier(MOD_LIGHTRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 45) - 1) * -100));
			PMob->setModifier(MOD_DARKRES, (int16)((Sql_GetFloatData(SqlInstanceHandle, 46) - 1) * -100));

			PMob->m_Element = (uint8)Sql_GetIntData(SqlInstanceHandle, 47);
			PMob->m_Family = (uint16)Sql_GetIntData(SqlInstanceHandle, 48);
			PMob->m_name_prefix = (uint8)Sql_GetIntData(SqlInstanceHandle, 49);
			PMob->m_flags = (uint32)Sql_GetIntData(SqlInstanceHandle, 50);

			//Special sub animation for Mob (yovra, jailer of love, phuabo)
			// yovra 1: en hauteur, 2: en bas, 3: en haut
			// phuabo 1: sous l'eau, 2: sort de l'eau, 3: rentre dans l'eau
			PMob->animationsub = (uint32)Sql_GetIntData(SqlInstanceHandle, 51);

			// Setup HP / MP Stat Percentage Boost
			PMob->HPscale = Sql_GetFloatData(SqlInstanceHandle, 52);
			PMob->MPscale = Sql_GetFloatData(SqlInstanceHandle, 53);

			PMob->PBattleAI = new CAIMobDummy(PMob);

			if (PMob->m_AllowRespawn = PMob->m_SpawnType == SPAWNTYPE_NORMAL)
			{
				PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
			}

			// Check if we should be looking up scripts for this mob
			PMob->m_HasSpellScript = (uint8)Sql_GetIntData(SqlInstanceHandle, 54);

			PMob->m_SpellListContainer = mobSpellList::GetMobSpellList(Sql_GetIntData(SqlInstanceHandle, 55));

			PMob->m_Pool = Sql_GetUIntData(SqlInstanceHandle, 58);

            PMob->allegiance = Sql_GetUIntData(SqlInstanceHandle, 59);
            PMob->namevis = Sql_GetUIntData(SqlInstanceHandle, 60);
            PMob->m_Aggro = Sql_GetUIntData(SqlInstanceHandle, 61);
            PMob->m_roamDistance = Sql_GetFloatData(SqlInstanceHandle, 62);

			// must be here first to define mobmods
			mobutils::InitializeMob(PMob, zone);
			PMob->PInstance = instance;

			instance->InsertMOB(PMob);
		}

		Query =
			"SELECT npcid, name, pos_rot, pos_x, pos_y, pos_z,\
			flag, speed, speedsub, animation, animationsub, namevis,\
			status, flags, look, name_prefix \
			FROM instance_entities INNER JOIN npc_list ON \
			(instance_entities.id = npc_list.npcid) \
			WHERE instanceid = %u AND npcid >= %u and npcid < %u;";

		uint32 zoneMin = (zone->GetID() << 12) + 0x1000000;
		uint32 zoneMax = zoneMin + 1024;

		ret = Sql_Query(SqlHandle, Query, instance->GetID(), zoneMin, zoneMax);

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				CNpcEntity* PNpc = new CNpcEntity;
				PNpc->id = (uint16)Sql_GetUIntData(SqlHandle, 0);
				PNpc->targid = PNpc->id & 0xFFF;
				
				PNpc->name.insert(0, Sql_GetData(SqlHandle, 1));

				PNpc->loc.p.rotation = (uint8)Sql_GetIntData(SqlHandle, 2);
				PNpc->loc.p.x = Sql_GetFloatData(SqlHandle, 3);
				PNpc->loc.p.y = Sql_GetFloatData(SqlHandle, 4);
				PNpc->loc.p.z = Sql_GetFloatData(SqlHandle, 5);
				PNpc->loc.p.moving = (uint16)Sql_GetUIntData(SqlHandle, 6);

				PNpc->m_TargID = (uint32)Sql_GetUIntData(SqlHandle, 6) >> 16; // вполне вероятно

				PNpc->speed = (uint8)Sql_GetIntData(SqlHandle, 7);
				PNpc->speedsub = (uint8)Sql_GetIntData(SqlHandle, 8);
				PNpc->animation = (uint8)Sql_GetIntData(SqlHandle, 9);
				PNpc->animationsub = (uint8)Sql_GetIntData(SqlHandle, 10);

				PNpc->namevis = (uint8)Sql_GetIntData(SqlHandle, 11);
				PNpc->status = (STATUSTYPE)Sql_GetIntData(SqlHandle, 12);
				PNpc->m_flags = (uint32)Sql_GetUIntData(SqlHandle, 13);

				PNpc->name_prefix = (uint8)Sql_GetIntData(SqlHandle, 15);

				memcpy(&PNpc->look, Sql_GetData(SqlHandle, 14), 20);

				PNpc->PInstance = instance;

				instance->InsertNPC(PNpc);
			}
		}
	}
	else
	{
        instance->Cancel();
		instance = nullptr;
	}

	//TODO: pets

	return instance;
}
