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

#include "conquest_system.h"
#include "vana_time.h"


namespace conquest
{

/************************************************************************
*																		*
*	Баланс сил на текущий conquest										*
*																		*
************************************************************************/

uint8 GetBalance()
{
	return 0x1E;
}

/************************************************************************
*																		*
*  Оставшееся количество дняй до подсчета conquest						*
*																		*
************************************************************************/

uint8 GetNexTally()
{
	uint32 currData = CVanaTime::getInstance()->getDate() / 1440;
	return (uint8)(175 - ((currData - 85)%175));
}

/************************************************************************
*																		*
*  Узнаем текущий регион по номеру зоны									*
*																		*
************************************************************************/

REGIONTYPE GetCurrentRegion(uint8 ZoneID)
{
	REGIONTYPE RegionID = REGION_UNKNOWN;

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
			RegionID = REGION_RONFAURE;
			break;
		case ZONE_GUSGEN_MINES:
		case ZONE_KONSCHTAT_HIGHLANDS:
		case ZONE_LA_THEINE_PLATEAU:
		case ZONE_ORDELLES_CAVES:
		case ZONE_SELBINA:
		case ZONE_VALKURM_DUNES:
			RegionID = REGION_ZULKHEIM;
			break;
		case ZONE_BATALLIA_DOWNS:
		case ZONE_CARPENTERS_LANDING:
		case ZONE_DAVOI:
		case ZONE_THE_ELDIEME_NECROPOLIS:
		case ZONE_JUGNER_FOREST:
		case ZONE_MONASTIC_CAVERN:
		case ZONE_PHANAUET_CHANNEL:
			RegionID = REGION_NORVALLEN;
			break;
		case ZONE_DANGRUF_WADI:
		case ZONE_KORROLOKA_TUNNEL:
		case ZONE_NORTH_GUSTABERG:
		case ZONE_PALBOROUGH_MINES:
		case ZONE_SOUTH_GUSTABERG:
		case ZONE_WAUGHROON_SHRINE:
		case ZONE_ZERUHN_MINES:
			RegionID = REGION_GUSTABERG;
			break;
		case ZONE_BEADEAUX:
		case ZONE_CRAWLERS_NEST:
		case ZONE_PASHHOW_MARSHLANDS:
		case ZONE_QULUN_DOME:
		case ZONE_ROLANBERRY_FIELDS:
			RegionID = REGION_DERFLAND;
			break;
		case ZONE_BALGAS_DAIS:
		case ZONE_EAST_SARUTABARUTA:
		case ZONE_FULL_MOON_FOUNTAIN:
		case ZONE_GIDDEUS:
		case ZONE_INNER_HORUTOTO_RUINS:
		case ZONE_OUTER_HORUTOTO_RUINS:
		case ZONE_TORAIMARAI_CANAL:
		case ZONE_WEST_SARUTABARUTA:
			RegionID = REGION_SARUTABARUTA;
			break;
		case ZONE_BIBIKI_BAY:
		case ZONE_BUBURIMU_PENINSULA:
		case ZONE_LABYRINTH_OF_ONZOZO:
		case ZONE_MANACLIPPER:
		case ZONE_MAZE_OF_SHAKHRAMI:
		case ZONE_MHAURA:
		case ZONE_TAHRONGI_CANYON:
			RegionID = REGION_KOLSHUSHU;
			break;
		case ZONE_ALTAR_ROOM:
		case ZONE_ATTOHWA_CHASM:
		case ZONE_BONEYARD_GULLY:
		case ZONE_CASTLE_OZTROJA:
		case ZONE_GARLAIGE_CITADEL:
		case ZONE_MERIPHATAUD_MOUNTAINS:
		case ZONE_SAUROMUGUE_CHAMPAIGN:
			RegionID = REGION_ARAGONEU;
			break;
		case ZONE_BEAUCEDINE_GLACIER:
		case ZONE_CLOISTER_OF_FROST:
		case ZONE_FEIYIN:
		case ZONE_PSOXJA:
		case ZONE_QUBIA_ARENA:
		case ZONE_RANGUEMONT_PASS:
		case ZONE_THE_SHROUDED_MAW:
			RegionID = REGION_FAUREGANDI;
			break;
		case ZONE_BEARCLAW_PINNACLE:
		case ZONE_CASTLE_ZVAHL_BAILEYS:
		case ZONE_CASTLE_ZVAHL_KEEP:
		case ZONE_THRONE_ROOM:
		case ZONE_ULEGUERAND_RANGE:
		case ZONE_XARCABARD:
			RegionID = REGION_VALDEAUNIA;
			break;
		case ZONE_BEHEMOTHS_DOMINION:
		case ZONE_LOWER_DELKFUTTS_TOWER:
		case ZONE_MIDDLE_DELKFUTTS_TOWER:
		case ZONE_QUFIM_ISLAND:
		case ZONE_STELLAR_FULCRUM:
		case ZONE_UPPER_DELKFUTTS_TOWER:
			RegionID = REGION_QUFIMISLAND;
			break;
		case ZONE_THE_BOYAHDA_TREE:
		case ZONE_CLOISTER_OF_STORMS:
		case ZONE_DRAGONS_AERY:
		case ZONE_HALL_OF_THE_GODS:
		case ZONE_ROMAEVE:
		case ZONE_THE_SANCTUARY_OF_ZITAH:
			RegionID = REGION_LITELOR;
			break;
		case ZONE_CLOISTER_OF_TREMORS:
		case ZONE_EASTERN_ALTEPA_DESERT:
		case ZONE_CHAMBER_OF_ORACLES:
		case ZONE_QUICKSAND_CAVES:
		case ZONE_RABAO:
		case ZONE_WESTERN_ALTEPA_DESERT:
			RegionID = REGION_KUZOTZ;
			break;
		case ZONE_CAPE_TERIGGAN:
		case ZONE_CLOISTER_OF_GALES:
		case ZONE_GUSTAV_TUNNEL:
		case ZONE_KUFTAL_TUNNEL:
		case ZONE_VALLEY_OF_SORROWS:
			RegionID = REGION_VOLLBOW;
			break;
		case ZONE_KAZHAM:
		case ZONE_NORG:
		case ZONE_SEA_SERPENT_GROTTO:
		case ZONE_YUHTUNGA_JUNGLE:
			RegionID = REGION_ELSHIMOLOWLANDS;
			break;
		case ZONE_CLOISTER_OF_FLAMES:
		case ZONE_CLOISTER_OF_TIDES:
		case ZONE_DEN_OF_RANCOR:
		case ZONE_IFRITS_CAULDRON:
		case ZONE_SACRIFICIAL_CHAMBER:
		case ZONE_TEMPLE_OF_UGGALEPIH:
		case ZONE_YHOATOR_JUNGLE:
			RegionID = REGION_ELSHIMOUPLANDS;
			break;
		case ZONE_THE_CELESTIAL_NEXUS:
		case ZONE_LALOFF_AMPHITHEATER:
		case ZONE_RUAUN_GARDENS:
		case ZONE_THE_SHRINE_OF_RUAVITAU:
		case ZONE_VELUGANNON_PALACE:
			RegionID = REGION_TULIA;
			break;
		case ZONE_MINE_SHAFT_2716:
		case ZONE_NEWTON_MOVALPOLOS:
		case ZONE_OLDTON_MOVALPOLOS:
			RegionID = REGION_MOVALPOLOS;
			break;
		case ZONE_LUFAISE_MEADOWS:
		case ZONE_MISAREAUX_COAST:
		case ZONE_MONARCH_LINN:
		case ZONE_PHOMIUNA_AQUEDUCTS:
		case ZONE_RIVERNE_SITE_A01:
		case ZONE_RIVERNE_SITE_B01:
		case ZONE_SACRARIUM:
		case ZONE_SEALIONS_DEN:
		case ZONE_TAVNAZIAN_SAFEHOLD:
			RegionID = REGION_TAVNAZIA;
			break;
	}
	return RegionID;
}

}; // namespace conquest