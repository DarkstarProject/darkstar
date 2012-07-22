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

#include "../common/showmsg.h"

#include <string.h>

#include "ai/ai_mob_dummy.h"

#include "lua/luautils.h"

#include "conquest_system.h"
#include "map.h"
#include "mobentity.h"
#include "npcentity.h"
#include "zoneutils.h"


CZone* g_PZoneList[256];	// глобальный массив указателей на игровые зоны
CNpcEntity*  g_PTrigger;	// триггер для запуска событий


namespace zoneutils
{

/************************************************************************
*																		*
*  Реакция зон на смену времени суток									*
*																		*
************************************************************************/

void TOTDCharnge(TIMETYPE TOTD)
{
	for(int32 ZoneID = 0; ZoneID < 256; ++ZoneID)
	{
		g_PZoneList[ZoneID]->TOTDChange(TOTD);
	}
}

/************************************************************************
*																		*
*  Возвращаем указатель на класс зоны с указанным ID.					*
*																		*
************************************************************************/

CZone* GetZone(uint8 ZoneID)
{
	return g_PZoneList[ZoneID];
}

CNpcEntity* GetTrigger(uint16 TargID, uint8 ZoneID)
{
	g_PTrigger->targid = TargID;
	g_PTrigger->id = ((4096 + ZoneID) << 12) + TargID;

    ShowWarning(CL_YELLOW"Server need NPC <%u>\n" CL_RESET, g_PTrigger->id);
	return g_PTrigger;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на любую сущность по ID                           *
*                                                                       *
************************************************************************/

CBaseEntity* GetEntity(uint32 ID, uint8 filter)
{
    return g_PZoneList[(uint8)(ID >> 12)]->GetEntity((uint16)(ID & 0x0FFF), filter);
}

/************************************************************************
*                                                                       *
*  Получаем указатель на CCharEntity по id и targid                     *
*                                                                       *
************************************************************************/

CCharEntity* GetCharFromRegion(uint32 charid, uint16 targid, uint8 RegionID)
{
    CCharEntity* PChar = NULL;

    for(int32 ZoneID = 0; ZoneID < 256; ZoneID++)
	{
        if (g_PZoneList[ZoneID]->GetRegionID() == RegionID)
        {
            CBaseEntity* PEntity = g_PZoneList[ZoneID]->GetEntity(targid, TYPE_PC); 
            
            if (PEntity != NULL && PEntity->id == charid)
            {
                PChar = (CCharEntity*)PEntity;
                break;
            }
        }
    }
    return PChar;
}

/************************************************************************
*																		*
*  Инициализация зон. Возрождаем всех монстров при старте сервера.		*
*																		*
************************************************************************/

void LoadZoneList()
{
	g_PTrigger = new CNpcEntity();	// нужно в конструкторе CNpcEntity задавать модель по умолчанию

	for(int32 ZoneID = 0; ZoneID < 256; ZoneID++)
	{
        CZone* PZone = new CZone(ZoneID, conquest::GetCurrentRegion(ZoneID));

		// загружаем NPCs из базы и добавляем их в зону

		const int8* fmtQuery = "SELECT npcid, name, pos_rot, pos_x, pos_y, pos_z, flag, \
								speed, speedsub, animation, animationsub, namevis, status, unknown, look, name_prefix \
								FROM npc_list \
								WHERE zoneid = %u AND npcid < 100000000;";
					  
		int32 ret = Sql_Query(SqlHandle, fmtQuery, ZoneID);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0) 
		{	
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
			{
				CNpcEntity* PNpc = new CNpcEntity;

				PNpc->id = (uint32)Sql_GetUIntData(SqlHandle,0);
				PNpc->targid = (uint16)PNpc->id & 0x0FFF;

				PNpc->name.insert(0,Sql_GetData(SqlHandle,1));

				PNpc->loc.p.rotation = (uint8)Sql_GetIntData(SqlHandle,2);
				PNpc->loc.p.x = Sql_GetFloatData(SqlHandle,3);
				PNpc->loc.p.y = Sql_GetFloatData(SqlHandle,4);
				PNpc->loc.p.z = Sql_GetFloatData(SqlHandle,5);
				PNpc->loc.p.moving  = (uint16)Sql_GetUIntData(SqlHandle,6);

				PNpc->m_TargID = (uint32)Sql_GetUIntData(SqlHandle,6) >> 16; // вполне вероятно

				PNpc->speed = (uint8)Sql_GetIntData(SqlHandle,7);
				PNpc->speedsub = (uint8)Sql_GetIntData(SqlHandle,8);
				PNpc->animation = (uint8)Sql_GetIntData(SqlHandle,9);
				PNpc->animationsub = (uint8)Sql_GetIntData(SqlHandle,10);

				PNpc->namevis = (uint8)Sql_GetIntData(SqlHandle,11);
				PNpc->status  = (STATUSTYPE)Sql_GetIntData(SqlHandle,12);
				PNpc->unknown = (uint32)Sql_GetUIntData(SqlHandle,13);

				PNpc->name_prefix = (uint8)Sql_GetIntData(SqlHandle,15);

				memcpy(&PNpc->look,Sql_GetData(SqlHandle,14),20);

				PZone->InsertNPC(PNpc);
			}
		}

		// загружаем MOBs из базы и добавляем их в зону

		fmtQuery = "SELECT name, mobid, pos_rot, pos_x, pos_y, pos_z, \
					respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, \
					modelid, mJob, sJob, cmbSkill, cmbDelay, behavior, links, mobType, \
					systemid, mobsize, speed, \
					STR, DEX, VIT, AGI, `INT`, MND, CHR, EVA, DEF, \
					Slash, Pierce, H2H, Impact, \
					Fire, Ice, Wind, Earth, Lightning, Water, Light, Dark, Element, \
					mob_pools.familyid, name_prefix, unknown \
					FROM mob_groups, mob_pools, mob_spawn_points, mob_family_system \
					WHERE mob_groups.poolid = mob_pools.poolid \
					AND mob_groups.groupid = mob_spawn_points.groupid \
					AND mob_family_system.familyid = mob_pools.familyid \
					AND (pos_x <> 0 AND pos_y <> 0 AND pos_z <> 0) \
					AND mob_groups.zoneid = %u;";

		ret = Sql_Query(SqlHandle, fmtQuery, ZoneID);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0) 
		{	
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
			{
				CMobEntity* PMob = new CMobEntity;

				PMob->name.insert(0,Sql_GetData(SqlHandle,0));
				PMob->id = (uint32)Sql_GetUIntData(SqlHandle,1);
				PMob->targid = (uint16)PMob->id & 0x0FFF;
				
				PMob->m_SpawnPoint.rotation = (uint8)Sql_GetIntData(SqlHandle,2);
				PMob->m_SpawnPoint.x = Sql_GetFloatData(SqlHandle,3);
				PMob->m_SpawnPoint.y = Sql_GetFloatData(SqlHandle,4);
				PMob->m_SpawnPoint.z = Sql_GetFloatData(SqlHandle,5);

				PMob->m_RespawnTime = Sql_GetUIntData(SqlHandle,6) * 1000;
				PMob->m_SpawnType   = (SPAWNTYPE)Sql_GetUIntData(SqlHandle,7);
				PMob->m_DropID		= Sql_GetUIntData(SqlHandle,8);

				PMob->HPmodifier = (uint32)Sql_GetIntData(SqlHandle,9);
				PMob->MPmodifier = (uint32)Sql_GetIntData(SqlHandle,10);

				PMob->m_minLevel = (uint8)Sql_GetIntData(SqlHandle,11);
				PMob->m_maxLevel = (uint8)Sql_GetIntData(SqlHandle,12);

				memcpy(&PMob->look,Sql_GetData(SqlHandle,13),22);

				PMob->SetMJob(Sql_GetIntData(SqlHandle,14));
				PMob->SetSJob(Sql_GetIntData(SqlHandle,15));

				PMob->m_Weapons[SLOT_MAIN]->setSkillType(Sql_GetIntData(SqlHandle,16));
				PMob->m_Weapons[SLOT_MAIN]->setDelay((Sql_GetIntData(SqlHandle,17) * 1000)/60);

				PMob->m_Behaviour  = (uint16)Sql_GetIntData(SqlHandle,18);
                PMob->m_Link       = (uint8)Sql_GetIntData(SqlHandle,19);
				PMob->m_Type       = (uint8)Sql_GetIntData(SqlHandle,20);
				PMob->m_EcoSystem  = (ECOSYSTEM)Sql_GetIntData(SqlHandle,21);
				PMob->m_ModelSize += (uint8)Sql_GetIntData(SqlHandle,22);
				
				PMob->speed    = (uint8)Sql_GetIntData(SqlHandle,23);
				PMob->speedsub = (uint8)Sql_GetIntData(SqlHandle,23);

				PMob->setModifier(MOD_SLASHRES, (uint16)(Sql_GetFloatData(SqlHandle,33) * 1000));
				PMob->setModifier(MOD_PIERCERES,(uint16)(Sql_GetFloatData(SqlHandle,34) * 1000));
				PMob->setModifier(MOD_HTHRES,   (uint16)(Sql_GetFloatData(SqlHandle,35) * 1000));
				PMob->setModifier(MOD_IMPACTRES,(uint16)(Sql_GetFloatData(SqlHandle,36) * 1000));

                PMob->setModifier(MOD_FIRERES,    (int16)((Sql_GetFloatData(SqlHandle, 37) - 1) * -1000)); // These are stored as floating percentages 
                PMob->setModifier(MOD_ICERES,     (int16)((Sql_GetFloatData(SqlHandle, 38) - 1) * -1000)); // and need to be adjusted into modifier units.
                PMob->setModifier(MOD_WINDRES,    (int16)((Sql_GetFloatData(SqlHandle, 39) - 1) * -1000)); // Higher RES = lower damage.  
                PMob->setModifier(MOD_EARTHRES,   (int16)((Sql_GetFloatData(SqlHandle, 40) - 1) * -1000)); // Negatives signify increased damage.
                PMob->setModifier(MOD_THUNDERRES, (int16)((Sql_GetFloatData(SqlHandle, 41) - 1) * -1000)); // Positives signify reduced damage.
                PMob->setModifier(MOD_WATERRES,   (int16)((Sql_GetFloatData(SqlHandle, 42) - 1) * -1000)); // Ex: 125% damage would be 1.25, 50% damage would be 0.50
                PMob->setModifier(MOD_LIGHTRES,   (int16)((Sql_GetFloatData(SqlHandle, 43) - 1) * -1000)); // (1.25 - 1) * -1000 = -250 RES
                PMob->setModifier(MOD_DARKRES,    (int16)((Sql_GetFloatData(SqlHandle, 44) - 1) * -1000)); // (0.50 - 1) * -1000 = 500 RES

				PMob->m_Element = (uint8)Sql_GetIntData(SqlHandle,45);
				PMob->m_Family = (uint16)Sql_GetIntData(SqlHandle,46); 
				PMob->m_name_prefix = (uint8)Sql_GetIntData(SqlHandle,47); 
				PMob->m_unknown = (uint32)Sql_GetIntData(SqlHandle,48); 
				PMob->PBattleAI = new CAIMobDummy(PMob);
				PMob->PBattleAI->SetCurrentAction(PMob->m_SpawnType == SPAWNTYPE_NORMAL ? ACTION_SPAWN : ACTION_NONE);

                // Killer Effect
                switch (PMob->m_EcoSystem)
	            {
		            case SYSTEM_AMORPH:   PMob->addModifier(MOD_BIRD_KILLER,     5); break;
		            case SYSTEM_AQUAN:    PMob->addModifier(MOD_AMORPH_KILLER,   5); break;
		            case SYSTEM_ARCANA:   PMob->addModifier(MOD_UNDEAD_KILLER,   5); break;
		            case SYSTEM_BEAST:    PMob->addModifier(MOD_LIZARD_KILLER,   5); break;
		            case SYSTEM_BIRD:     PMob->addModifier(MOD_AQUAN_KILLER,    5); break;
		            case SYSTEM_DEMON:    PMob->addModifier(MOD_DRAGON_KILLER,   5); break;
		            case SYSTEM_DRAGON:   PMob->addModifier(MOD_DEMON_KILLER,    5); break;
		            case SYSTEM_LIZARD:   PMob->addModifier(MOD_VERMIN_KILLER,   5); break;
                    case SYSTEM_LUMINION: PMob->addModifier(MOD_LUMORIAN_KILLER, 5); break;
                    case SYSTEM_LUMORIAN: PMob->addModifier(MOD_LUMINION_KILLER, 5); break;
		            case SYSTEM_PLANTOID: PMob->addModifier(MOD_BEAST_KILLER,    5); break;
		            case SYSTEM_UNDEAD:   PMob->addModifier(MOD_ARCANA_KILLER,   5); break;
		            case SYSTEM_VERMIN:   PMob->addModifier(MOD_PLANTOID_KILLER, 5); break;
	            }
				//DA and TA
				if(PMob->GetMJob()==JOB_WAR && PMob->m_minLevel >= 25 || PMob->GetSJob()==JOB_WAR && PMob->m_minLevel >= 50){
					PMob->addModifier(MOD_DOUBLE_ATTACK,15);
				}
				if(PMob->GetMJob()==JOB_THF && PMob->m_minLevel >= 55){
					PMob->addModifier(MOD_TRIPLE_ATTACK,7);
				}
				PZone->InsertMOB(PMob);
			}
		}

		PZone->ZoneServer(-1);
		g_PZoneList[ZoneID] = PZone;

		if (PZone->GetIP() != 0)
		{
			luautils::OnZoneInitialise(PZone->GetID());
		}
	}
}

/************************************************************************
*																		*
*  Освобождаем список зон												*
*																		*
************************************************************************/

void FreeZoneList()
{
	for(int32 ZoneID = 0; ZoneID < 256; ++ZoneID)
	{
		delete g_PZoneList[ZoneID];
	}
	delete g_PTrigger;
}

}; // namespace zoneutils
