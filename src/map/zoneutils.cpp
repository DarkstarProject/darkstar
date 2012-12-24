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
*  determines what weather conditions each zone qualifies for			*
*  and what the current weather condition should be						*
*																		*
************************************************************************/

// TOTO: общая погода для нескольких зон

void UpdateWeather()
{
    uint8 WeatherChange = 0;
    uint8 WeatherFrequency = 0;

    for (int32 ZoneID = 0; ZoneID < 256; ZoneID++)    
    {
        if (!g_PZoneList[ZoneID]->IsWeatherStatic())
        {
            WeatherFrequency = 0;
            WeatherChange = rand()%100;
			    
            for (uint8 weather = 0; weather < MAX_WEATHER_ID; ++weather)
            {
                WeatherFrequency += g_PZoneList[ZoneID]->m_WeatherFrequency[weather];				

                if (WeatherFrequency > WeatherChange)
                {
                    g_PZoneList[ZoneID]->SetWeather((WEATHER)weather); break;
                }
            }
        }
    }
    ShowDebug(CL_CYAN"UpdateWeather Finished\n"CL_RESET);
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
*  Получаем указатель на персонажа по имени                             *
*                                                                       *
************************************************************************/

CCharEntity* GetCharByName(int8* name)
{
    for(int32 ZoneID = 0; ZoneID < 256; ZoneID++)
    {
        CCharEntity* PChar = g_PZoneList[ZoneID]->GetCharByName(name);

        if (PChar != NULL)
        {
		    return PChar;
		}
    }
    return NULL;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на CCharEntity по id и targid                     *
*                                                                       *
************************************************************************/

CCharEntity* GetCharFromRegion(uint32 charid, uint16 targid, uint8 RegionID)
{
    for(int32 ZoneID = 0; ZoneID < 256; ZoneID++)
	{
        if (g_PZoneList[ZoneID]->GetRegionID() == RegionID)
        {
            CBaseEntity* PEntity = g_PZoneList[ZoneID]->GetEntity(targid, TYPE_PC); 
            
            if (PEntity != NULL && PEntity->id == charid)
            {
                return (CCharEntity*)PEntity;
            }
        }
    }
    return NULL;
}

/************************************************************************
*                                                                       *
*  Загружаем список NPC в указанную зону                                *
*                                                                       *
************************************************************************/

void LoadNPCList(CZone* PZone)
{
    const int8* Query = 
        "SELECT \
          npcid,\
          name,\
          pos_rot,\
          pos_x,\
          pos_y,\
          pos_z,\
          flag,\
          speed,\
          speedsub,\
          animation,\
          animationsub,\
          namevis,\
          status,\
          unknown,\
          look,\
          name_prefix \
        FROM npc_list \
        WHERE zoneid = %u AND npcid < 100000000;";
					  
    int32 ret = Sql_Query(SqlHandle, Query, PZone->GetID());

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
}

/************************************************************************
*                                                                       *
*  Загружаем список монстров в указанную зону                           *
*                                                                       *
************************************************************************/

void LoadMOBList(CZone* PZone)
{
    const int8* Query =  
        "SELECT name, mobid, pos_rot, pos_x, pos_y, pos_z, \
			respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, \
			modelid, mJob, sJob, cmbSkill, cmbDelay, behavior, links, mobType, immunity, \
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

    int32 ret = Sql_Query(SqlHandle, Query, PZone->GetID());

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

			memcpy(&PMob->look,Sql_GetData(SqlHandle,13),23);

			PMob->SetMJob(Sql_GetIntData(SqlHandle,14));
			PMob->SetSJob(Sql_GetIntData(SqlHandle,15));

            PMob->m_Weapons[SLOT_MAIN]->setMaxHit(1);
			PMob->m_Weapons[SLOT_MAIN]->setSkillType(Sql_GetIntData(SqlHandle,16));
			PMob->m_Weapons[SLOT_MAIN]->setDelay((Sql_GetIntData(SqlHandle,17) * 1000)/60);
			
			PMob->m_Behaviour  = (uint16)Sql_GetIntData(SqlHandle,18);
            PMob->m_Link       = (uint8)Sql_GetIntData(SqlHandle,19);
			PMob->m_Type       = (uint8)Sql_GetIntData(SqlHandle,20);
			PMob->m_Immunity   = (IMMUNITY)Sql_GetIntData(SqlHandle,21);
			PMob->m_EcoSystem  = (ECOSYSTEM)Sql_GetIntData(SqlHandle,22);
			PMob->m_ModelSize += (uint8)Sql_GetIntData(SqlHandle,23);
				
			PMob->speed    = (uint8)Sql_GetIntData(SqlHandle,24);
			PMob->speedsub = (uint8)Sql_GetIntData(SqlHandle,24);

			if(PMob->speed != 0)
			{
				PMob->speed += map_config.speed_mod;
				PMob->speedsub += map_config.speed_mod;
			}

			PMob->setModifier(MOD_SLASHRES, (uint16)(Sql_GetFloatData(SqlHandle,34) * 1000));
			PMob->setModifier(MOD_PIERCERES,(uint16)(Sql_GetFloatData(SqlHandle,35) * 1000));
			PMob->setModifier(MOD_HTHRES,   (uint16)(Sql_GetFloatData(SqlHandle,36) * 1000));
			PMob->setModifier(MOD_IMPACTRES,(uint16)(Sql_GetFloatData(SqlHandle,37) * 1000));

            PMob->setModifier(MOD_FIREDEF,    (int16)((Sql_GetFloatData(SqlHandle, 38) - 1) * -1000)); // These are stored as floating percentages 
            PMob->setModifier(MOD_ICEDEF,     (int16)((Sql_GetFloatData(SqlHandle, 39) - 1) * -1000)); // and need to be adjusted into modifier units.
            PMob->setModifier(MOD_WINDDEF,    (int16)((Sql_GetFloatData(SqlHandle, 40) - 1) * -1000)); // Higher DEF = lower damage.  
            PMob->setModifier(MOD_EARTHDEF,   (int16)((Sql_GetFloatData(SqlHandle, 41) - 1) * -1000)); // Negatives signify increased damage.
            PMob->setModifier(MOD_THUNDERDEF, (int16)((Sql_GetFloatData(SqlHandle, 42) - 1) * -1000)); // Positives signify reduced damage.
            PMob->setModifier(MOD_WATERDEF,   (int16)((Sql_GetFloatData(SqlHandle, 43) - 1) * -1000)); // Ex: 125% damage would be 1.25, 50% damage would be 0.50
            PMob->setModifier(MOD_LIGHTDEF,   (int16)((Sql_GetFloatData(SqlHandle, 44) - 1) * -1000)); // (1.25 - 1) * -1000 = -250 DEF
            PMob->setModifier(MOD_DARKDEF,    (int16)((Sql_GetFloatData(SqlHandle, 45) - 1) * -1000)); // (0.50 - 1) * -1000 = 500 DEF

            PMob->setModifier(MOD_FIRERES,    (int16)((Sql_GetFloatData(SqlHandle, 38) - 1) * -100)); // These are stored as floating percentages 
            PMob->setModifier(MOD_ICERES,     (int16)((Sql_GetFloatData(SqlHandle, 39) - 1) * -100)); // and need to be adjusted into modifier units.
            PMob->setModifier(MOD_WINDRES,    (int16)((Sql_GetFloatData(SqlHandle, 40) - 1) * -100)); // Higher RES = lower damage.  
            PMob->setModifier(MOD_EARTHRES,   (int16)((Sql_GetFloatData(SqlHandle, 41) - 1) * -100)); // Negatives signify lower resist chance.
            PMob->setModifier(MOD_THUNDERRES, (int16)((Sql_GetFloatData(SqlHandle, 42) - 1) * -100)); // Positives signify increased resist chance.
            PMob->setModifier(MOD_WATERRES,   (int16)((Sql_GetFloatData(SqlHandle, 43) - 1) * -100)); 
            PMob->setModifier(MOD_LIGHTRES,   (int16)((Sql_GetFloatData(SqlHandle, 44) - 1) * -100)); 
            PMob->setModifier(MOD_DARKRES,    (int16)((Sql_GetFloatData(SqlHandle, 45) - 1) * -100)); 

			PMob->m_Element = (uint8)Sql_GetIntData(SqlHandle,46);
			PMob->m_Family = (uint16)Sql_GetIntData(SqlHandle,47); 
			PMob->m_name_prefix = (uint8)Sql_GetIntData(SqlHandle,48); 
			PMob->m_unknown = (uint32)Sql_GetIntData(SqlHandle,49); 
			PMob->PBattleAI = new CAIMobDummy(PMob);

            if (PMob->m_AllowRespawn = PMob->m_SpawnType == SPAWNTYPE_NORMAL)
            {
                PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
            }

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
			
            //TODO: traits монстров должны быть аналогичны traits персонажей
            //DA and TA
			if(PMob->GetMJob()==JOB_WAR && PMob->m_minLevel >= 25 || PMob->GetSJob()==JOB_WAR && PMob->m_minLevel >= 50){
				PMob->addModifier(MOD_DOUBLE_ATTACK,15);
			}
			if(PMob->GetMJob()==JOB_THF && PMob->m_minLevel >= 55){
				PMob->addModifier(MOD_TRIPLE_ATTACK,7);
			}
			PZone->InsertMOB(PMob);
			luautils::OnMobInitialise(PMob);
		}
	}
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
        CZone* PZone = new CZone((ZONEID)ZoneID, GetCurrentRegion(ZoneID), GetCurrentContinent(ZoneID));

		LoadNPCList(PZone);
        LoadMOBList(PZone);
		
		PZone->ZoneServer(-1);
		g_PZoneList[ZoneID] = PZone;

		if (PZone->GetIP() != 0)
		{
			luautils::OnZoneInitialise(PZone->GetID());
		}
	}
    UpdateWeather();
}

/************************************************************************
*                                                                       *
*  Узнаем текущий регион по номеру зоны                                 *
*                                                                       *
************************************************************************/

REGIONTYPE GetCurrentRegion(uint8 ZoneID)
{
	switch (ZoneID) 
	{
		case ZONE_BOSTAUNIEUX_OUBLIETTE: 
		case ZONE_EAST_RONFAURE:
		case ZONE_FORT_GHELSBA:
		case ZONE_GHELSBA_OUTPOST:
		case ZONE_HORLAIS_PEAK:
		case ZONE_KING_RANPERRES_TOMB:
		case ZONE_WEST_RONFAURE:
		case ZONE_YUGHOTT_GROTTO:	
			return REGION_RONFAURE;
		case ZONE_GUSGEN_MINES:
		case ZONE_KONSCHTAT_HIGHLANDS:
		case ZONE_LA_THEINE_PLATEAU:
		case ZONE_ORDELLES_CAVES:
		case ZONE_SELBINA:
		case ZONE_VALKURM_DUNES:
			return REGION_ZULKHEIM;
		case ZONE_BATALLIA_DOWNS:
		case ZONE_CARPENTERS_LANDING:
		case ZONE_DAVOI:
		case ZONE_THE_ELDIEME_NECROPOLIS:
		case ZONE_JUGNER_FOREST:
		case ZONE_MONASTIC_CAVERN:
		case ZONE_PHANAUET_CHANNEL:
			return REGION_NORVALLEN;
		case ZONE_DANGRUF_WADI:
		case ZONE_KORROLOKA_TUNNEL:
		case ZONE_NORTH_GUSTABERG:
		case ZONE_PALBOROUGH_MINES:
		case ZONE_SOUTH_GUSTABERG:
		case ZONE_WAUGHROON_SHRINE:
		case ZONE_ZERUHN_MINES:
			return REGION_GUSTABERG;
		case ZONE_BEADEAUX:
		case ZONE_CRAWLERS_NEST:
		case ZONE_PASHHOW_MARSHLANDS:
		case ZONE_QULUN_DOME:
		case ZONE_ROLANBERRY_FIELDS:
			return REGION_DERFLAND;
		case ZONE_BALGAS_DAIS:
		case ZONE_EAST_SARUTABARUTA:
		case ZONE_FULL_MOON_FOUNTAIN:
		case ZONE_GIDDEUS:
		case ZONE_INNER_HORUTOTO_RUINS:
		case ZONE_OUTER_HORUTOTO_RUINS:
		case ZONE_TORAIMARAI_CANAL:
		case ZONE_WEST_SARUTABARUTA:
			return REGION_SARUTABARUTA;
		case ZONE_BIBIKI_BAY:
		case ZONE_BUBURIMU_PENINSULA:
		case ZONE_LABYRINTH_OF_ONZOZO:
		case ZONE_MANACLIPPER:
		case ZONE_MAZE_OF_SHAKHRAMI:
		case ZONE_MHAURA:
		case ZONE_TAHRONGI_CANYON:
			return REGION_KOLSHUSHU;
		case ZONE_ALTAR_ROOM:
		case ZONE_ATTOHWA_CHASM:
		case ZONE_BONEYARD_GULLY:
		case ZONE_CASTLE_OZTROJA:
		case ZONE_GARLAIGE_CITADEL:
		case ZONE_MERIPHATAUD_MOUNTAINS:
		case ZONE_SAUROMUGUE_CHAMPAIGN:
			return REGION_ARAGONEU;
		case ZONE_BEAUCEDINE_GLACIER:
		case ZONE_CLOISTER_OF_FROST:
		case ZONE_FEIYIN:
		case ZONE_PSOXJA:
		case ZONE_QUBIA_ARENA:
		case ZONE_RANGUEMONT_PASS:
		case ZONE_THE_SHROUDED_MAW:
			return REGION_FAUREGANDI;
		case ZONE_BEARCLAW_PINNACLE:
		case ZONE_CASTLE_ZVAHL_BAILEYS:
		case ZONE_CASTLE_ZVAHL_KEEP:
		case ZONE_THRONE_ROOM:
		case ZONE_ULEGUERAND_RANGE:
		case ZONE_XARCABARD:
			return REGION_VALDEAUNIA;
		case ZONE_BEHEMOTHS_DOMINION:
		case ZONE_LOWER_DELKFUTTS_TOWER:
		case ZONE_MIDDLE_DELKFUTTS_TOWER:
		case ZONE_QUFIM_ISLAND:
		case ZONE_STELLAR_FULCRUM:
		case ZONE_UPPER_DELKFUTTS_TOWER:
			return REGION_QUFIMISLAND;
		case ZONE_THE_BOYAHDA_TREE:
		case ZONE_CLOISTER_OF_STORMS:
		case ZONE_DRAGONS_AERY:
		case ZONE_HALL_OF_THE_GODS:
		case ZONE_ROMAEVE:
		case ZONE_THE_SANCTUARY_OF_ZITAH:
			return REGION_LITELOR;
		case ZONE_CLOISTER_OF_TREMORS:
		case ZONE_EASTERN_ALTEPA_DESERT:
		case ZONE_CHAMBER_OF_ORACLES:
		case ZONE_QUICKSAND_CAVES:
		case ZONE_RABAO:
		case ZONE_WESTERN_ALTEPA_DESERT:
			return REGION_KUZOTZ;
		case ZONE_CAPE_TERIGGAN:
		case ZONE_CLOISTER_OF_GALES:
		case ZONE_GUSTAV_TUNNEL:
		case ZONE_KUFTAL_TUNNEL:
		case ZONE_VALLEY_OF_SORROWS:
			return REGION_VOLLBOW;
		case ZONE_KAZHAM:
		case ZONE_NORG:
		case ZONE_SEA_SERPENT_GROTTO:
		case ZONE_YUHTUNGA_JUNGLE:
			return REGION_ELSHIMOLOWLANDS;
		case ZONE_CLOISTER_OF_FLAMES:
		case ZONE_CLOISTER_OF_TIDES:
		case ZONE_DEN_OF_RANCOR:
		case ZONE_IFRITS_CAULDRON:
		case ZONE_SACRIFICIAL_CHAMBER:
		case ZONE_TEMPLE_OF_UGGALEPIH:
		case ZONE_YHOATOR_JUNGLE:
			return REGION_ELSHIMOUPLANDS;
		case ZONE_THE_CELESTIAL_NEXUS:
		case ZONE_LALOFF_AMPHITHEATER:
		case ZONE_RUAUN_GARDENS:
		case ZONE_THE_SHRINE_OF_RUAVITAU:
		case ZONE_VELUGANNON_PALACE:
			return REGION_TULIA;
		case ZONE_MINE_SHAFT_2716:
		case ZONE_NEWTON_MOVALPOLOS:
		case ZONE_OLDTON_MOVALPOLOS:
			return REGION_MOVALPOLOS;
		case ZONE_LUFAISE_MEADOWS:
		case ZONE_MISAREAUX_COAST:
		case ZONE_MONARCH_LINN:
		case ZONE_PHOMIUNA_AQUEDUCTS:
		case ZONE_RIVERNE_SITE_A01:
		case ZONE_RIVERNE_SITE_B01:
		case ZONE_SACRARIUM:
		case ZONE_SEALIONS_DEN:
		case ZONE_TAVNAZIAN_SAFEHOLD:
			return REGION_TAVNAZIA;
        case ZONE_SOUTHERN_SANDORIA:
        case ZONE_NORTHERN_SANDORIA:
        case ZONE_PORT_SANDORIA:
        case ZONE_CHATEAU_DORAGUILLE:
            return REGION_SANDORIA;
        case ZONE_BASTOK_MINES:
        case ZONE_BASTOK_MARKETS:
        case ZONE_PORT_BASTOK:
        case ZONE_METALWORKS:
            return REGION_BASTOK;
        case ZONE_WINDURST_WATERS:
        case ZONE_WINDURST_WALLS:
        case ZONE_PORT_WINDURST:
        case ZONE_WINDURST_WOODS:
        case ZONE_HEAVENS_TOWER:
            return REGION_WINDURST;
        case ZONE_RULUDE_GARDENS:
        case ZONE_UPPER_JEUNO:
        case ZONE_LOWER_JEUNO:
        case ZONE_PORT_JEUNO:
            return REGION_JEUNO;
	}
	return REGION_UNKNOWN;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CONTINENTTYPE GetCurrentContinent(uint8 ZoneID)
{
    return GetCurrentRegion(ZoneID) != REGION_UNKNOWN ? THE_MIDDLE_LANDS : OTHER_AREAS;
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
