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

#include "../common/showmsg.h"

#include <string.h> 

#include "packets/caught_fish.h"
#include "packets/char_update.h"
#include "packets/char_sync.h"
#include "packets/fishing.h"
#include "packets/inventory_finish.h"
#include "packets/message_text.h"
#include "packets/release.h"
#include "packets/message_system.h"

#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "map.h"
#include "vana_time.h"
#include "zoneutils.h"


namespace fishingutils
{

/************************************************************************
*																		*
*  Массив смещений для сообщений рыбалки								*
*																		*
************************************************************************/

uint16 MessageOffset[] =
{
	0,		// Residential_Area
	7163,	// Phanauet_Channel
	7215,	// Carpenters_Landing
	7164,	// Manaclipper
	7209,	// Bibiki_Bay
	0,		// Uleguerand_Range
	0,		// Bearclaw_Pinnacle
	0,		// Attohwa_Chasm
	0,		// Boneyard_Gully
	0,		// PsoXja
	0,		// The_Shrouded_Maw
	7512,	// Oldton_Movalpolos
	0,		// Newton_Movalpolos
	0,		// MineShaft_#2716
	0,		// Hall_of_Transference
	0,		// none
	0,		// Promyvion_Holla
	0,		// Spire_of_Holla
	0,		// Promyvion_Dem
	0,		// Spire_of_Dem
	0,		// Promyvion_Mea
	0,		// Spire_of_Mea
	0,		// Promyvion_Vahzl
	0,		// Spire_of_Vahzl
	7495,	// Lufaise_Meadows
	7016,	// Misareaux_Coast
	10202,	// Tavnazian_Safehold
	7177,	// Phomiuna_Aqueducts
	0,		// Sacrarium
	0,		// Riverne_Site_#B01
	0,		// Riverne_Site_#A01
	0,		// Monarch_Linn
	0,		// Sealions_Den
	0,		// AlTaieu
	0,		// Grand_Palace_of_HuXzoi
	0,		// The_Garden_of_RuHmet
	0,		// Empyreal_Paradox
	0,		// Temenos
	0,		// Apollyon
	0,		// Dynamis_Valkurm
	0,		// Dynamis_Buburimu
	0,		// Dynamis_Qufim
	0,		// Dynamis_Tavnazia
	0,		// Diorama_Abdhaljs_Ghelsba
	0,		// Abdhaljs_Isle_Purgonorgo
	0,		// Abyssea-Tahrongi
	6994,	// Open_sea_route_to_Al_Zahbi
	6994,	// Open_sea_route_to_Mhaura
	6994,	// Al_Zahbi
	0,		// none
	831,	// Aht_Urhgan_Whitegate
	6994,	// Wajaom_Woodlands
	6994,	// Bhaflau_Thickets
	6994,	// Nashmau
	6994,	// Arrapago_Reef
	0,		// Ilrusi_Atoll
	0,		// Periqia
	6994,	// Talacca_Cove
	6994,	// Silver_Sea_route_to_Nashmau
	6994,	// Silver_Sea_route_to_Al_Zahbi
	0,		// The_Ashu_Talif
	6994,	// Mount_Zhayolm
	0,		// Halvung
	0,		// Lebros_Cavern
	0,		// Navukgo_Execution_Chamber
	6994,	// Mamook
	0,		// Mamool_Ja_Training_Grounds
	0,		// Jade_Sepulcher
	6994,	// Aydeewa_Subterrane
	0,		// Leujaoam_Sanctum
	0,		// Chocobo_Circuit
	0,		// The_Colosseum
	0,		// Alzadaal_Undersea_Ruins
	0,		// Zhayolm_Remnants
	0,		// Arrapago_Remnants
	0,		// Bhaflau_Remnants
	0,		// Silver_Sea_Remnants
	0,		// Nyzul_Isle
	0,		// Hazhalm_Testing_Grounds
	6994,	// Caedarva_Mire
	0,		// Southern_San_d'Oria_[S]
	7674,	// East_Ronfaure_[S]
	7306,	// Jugner_Forest_[S]
	6994,	// Vunkerl_Inlet_[S]
	7013,	// Batallia_Downs_[S]
	0,		// La_Vaule_[S]
	0,		// Everbloom_Hollow
	6994,	// Bastok_Markets_[S]
	7299,	// North_Gustaberg_[S]
	6994,	// Grauberg_[S]
	7090,	// Pashhow_Marshlands_[S]
	7013,	// Rolanberry_Fields_[S]
	0,		// Beadeaux_[S]
	0,		// Ruhotz_Silvermines
	6994,	// Windurst_Waters_[S]
	7020,	// West_Sarutabaruta_[S]
	0,		// Fort_Karugo-Narugo_[S]
	0,		// Meriphataud_Mountains_[S]
	0,		// Sauromugue_Champaign_[S]
	6994,	// Castle_Oztroja_[S]
	7156,	// West_Ronfaure
	7156,	// East_Ronfaure
	7156,	// La_Theine_Plateau
	7156,	// Valkurm_Dunes
	7628,	// Jugner_Forest
	7156,	// Batallia_Downs
	7156,	// North_Gustaberg
	7156,	// South_Gustaberg
	0,		// Konschtat_Highlands
	7156,	// Pashhow_Marshlands
	7156,	// Rolanberry_Fields
	7156,	// Beaucedine_Glacier
	0,		// Xarcabard
	7494,	// Cape_Teriggan
	7494,	// Eastern_Altepa_Desert
	6994,	// West_Sarutabaruta
	7153,	// East_Sarutabaruta
	7156,	// Tahrongi_Canyon
	7162,	// Buburimu_Peninsula
	7156,	// Meriphataud_Mountains
	7164,	// Sauromugue_Champaign
	7494,	// The_Sanctuary_of_ZiTah
	7153,	// RoMaeve
	7494,	// Yuhtunga_Jungle
	7494,	// Yhoator_Jungle
	7153,	// Western_Altepa_Desert
	7153,	// Qufim_Island
	0,		// Behemoths_Dominion
	0,		// Valley_of_Sorrows
	0,		// Ghoyu's_Reverie
	0,		// RuAun_Gardens
	0,		// Mordion_Gaol
	6994,	// Abyssea-La_Theine
	0,		// unknown
	0,		// Dynamis_Beaucedine
	0,		// Dynamis_Xarcabard
	0,		// Beaucedine_Glacier_[S]
	0,		// Xarcabard_[S]
	0,		// Castle_Zvahl_Baileys_[S]
	0,		// Horlais_Peak
	7512,	// Ghelsba_Outpost
	0,		// Fort_Ghelsba
	7153,	// Yughott_Grotto
	7153,	// Palborough_Mines
	0,		// Waughroon_Shrine
	7153,	// Giddeus
	0,		// Balgas_Dais
	0,		// Beadeaux
	0,		// Qulun_Dome
	7153,	// Davoi
	0,		// Monastic_Cavern
	7198,	// Castle_Oztroja
	0,		// Altar_Room
	6994,	// The_Boyahda_Tree
	6994,	// Dragons_Aery
	0,		// Castle_Zvahl_Keep_[S]
	0,		// Throne_Room_[S]
	0,		// Middle_Delkfutts_Tower
	0,		// Upper_Delkfutts_Tower
	7153,	// Temple_of_Uggalepih
	7181,	// Den_of_Rancor
	0,		// Castle_Zvahl_Baileys
	0,		// Castle_Zvahl_Keep
	0,		// Sacrificial_Chamber
	0,		// Garlaige_Citadel_[S]
	0,		// Throne_Room
	7153,	// Ranguemont_Pass
	7153,	// Bostaunieux_Oubliette
	0,		// Chamber_of_Oracles
	7199,	// Toraimarai_Canal
	0,		// Full_Moon_Fountain
	0,		// Crawlers'_Nest_[S]
	7153,	// Zeruhn_Mines
	6994,	// Korroloka_Tunnel
	7153,	// Kuftal_Tunnel
	0,		// The_Eldieme_Necropolis_[S]
	7153,	// Sea_Serpent_Grotto
	0,		// VeLugannon_Palace
	0,		// The_Shrine_of_RuAvitau
	0,		// Stellar_Fulcrum
	0,		// LaLoff_Amphitheater
	0,		// The_Celestial_Nexus
	0,		// Walk_of_Echos
	0,		// The_Last_Stand
	0,		// Lower_Delkfutts_Tower
	0,		// Dynamis_San_dOria
	0,		// Dynamis_Bastok
	0,		// Dynamis_Windurst
	0,		// Dynamis_Jeuno
	0,		// unknown
	0,		// King_Ranperres_Tomb
	7153,	// Dangruf_Wadi
	0,		// Inner_Horutoto_Ruins
	7153,	// Ordelles_Caves
	0,		// Outer_Horutoto_Ruins
	0,		// The_Eldieme_Necropolis
	7153,	// Gusgen_Mines
	0,		// Crawlers_Nest
	0,		// Maze_of_Shakhrami
	0,		// unknown
	0,		// Garlaige_Citadel
	0,		// Cloister_of_Gales
	0,		// Cloister_of_Storms
	0,		// Cloister_of_Frost
	7173,	// FeiYin
	0,		// Ifrits_Cauldron
	0,		// QuBia_Arena
	0,		// Cloister_of_Flames
	7153,	// Quicksand_Caves
	0,		// Cloister_of_Tremors
	0,		// unknown
	0,		// Cloister_of_Tides
	0,		// Gustav_Tunnel
	7153,	// Labyrinth_of_Onzozo
	0,		// Al_Zahbi_Residential_Area
	0,		// Abyssea-Attohwa
	6994,	// Abyssea-Misareaux
	6994,	// Abyssea-Vunkerl
	0,		// Abyssea-Altepa
	0,		// unknown
	7156,	// Ship_bound_for_Selbina
	7156,	// Ship_bound_for_Mhaura
	0,		// test_zone
	0,		// San_dOria_Jeuno_Airship
	0,		// Bastok_Jeuno_Airship
	0,		// Windurst_Jeuno_Airship
	0,		// Kazham_Jeuno_Airship
	7156,	// Ship_bound_for_Selbina_Pirate
	7156,	// Ship_bound_for_Mhaura_Pirate
	0,		// unknown
	0,		// Southern_San_dOria
	7199,	// Northern_San_dOria
	6744,	// Port_San_dOria
	0,		// Chateau_dOraguille
	10525,	// Bastok_Mines
	6923,	// Bastok_Markets
	6831,	// Port_Bastok
	0,		// Bastok_Metalworks
	6813,	// Windurst_Waters
	6824,	// Windurst_Walls
	11299,	// Port_Windurst
	6838,	// Windurst_Woods
	7292,	// Heavens_Tower
	0,		// RuLude_Gardens
	0,		// Upper_Jeuno
	6757,	// Lower_Jeuno
	6756,	// Port_Jeuno
	6584,	// Rabao
	6452,	// Selbina
	6613,	// Mhaura
	6584,	// Kazham
	0,		// Hall_of_the_Gods
	6584,	// Norg
	0,		// Abyssea-Uleguerand
	0,		// Abyssea-Grauberg
	0		// Abyssea-Empyreal_Paradox
};

/************************************************************************
*																		*
*  Получение смещения для сообщений рыбалки								*
*																		*
************************************************************************/

uint16 GetMessageOffset(uint8 ZoneID)
{
	return MessageOffset[ZoneID];
}

/************************************************************************
*																		*
*  Проверяем наличие удочки, наживки и возможности ловли				*
*																		*
************************************************************************/

void StartFishing(CCharEntity* PChar)
{
	if (PChar->animation != ANIMATION_NONE)
	{
		PChar->pushPacket(new CMessageSystemPacket(0,0,142));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	uint16 MessageOffset = GetMessageOffset(PChar->getZone());

	if (MessageOffset == 0)
	{
		ShowWarning(CL_YELLOW"Player wants to fish in %s\n"CL_RESET, zoneutils::GetZone(PChar->getZone())->GetName());
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}
	
	CItemWeapon* WeaponItem = NULL;

	WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);	
			
	if ((WeaponItem == NULL) ||
	   !(WeaponItem->getType() & ITEM_WEAPON) ||
		(WeaponItem->getSkillType() != SKILL_FSH)) 
	{													
		// сообщение: "You can't fish without a rod in your hands"

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x01));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);	
							
	if ((WeaponItem == NULL) ||
	   !(WeaponItem->getType() & ITEM_WEAPON) ||
		(WeaponItem->getSkillType() != SKILL_FSH))
	{
		// сообщение: "You can't fish without bait on the hook"	

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x02));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	PChar->status = STATUS_UPDATE;
	PChar->animation = ANIMATION_FISHING_START;

	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

/************************************************************************
*																		*
*  Персонаж ломает удочку												*
*																		*
************************************************************************/

bool CheckFisherLuck(CCharEntity* PChar)
{
	if (PChar->UContainer->GetType() != UCONTAINER_EMPTY)
	{
		ShowDebug(CL_CYAN"Player cannot fish! UContainer is not empty\n"CL_RESET);
		return false;
	}

	CItem* PFish = NULL;
	CItemWeapon* WeaponItem = NULL;

	WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);	

	//DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
	//DSP_DEBUG_BREAK_IF(!(WeaponItem->getType() & ITEM_WEAPON));
	//DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

	uint16 RodID = WeaponItem->getID();

	WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);	
							
	//DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
	//DSP_DEBUG_BREAK_IF(!(WeaponItem->getType() & ITEM_WEAPON));
	//DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

	uint16 LureID = WeaponItem->getID();

	int32 FishingChance = rand()%100;

	if (FishingChance <= 20)
	{
		const int8* fmtQuery = "SELECT fish.fishid, fish.max, fish.watertype, fish.size, fish.stamina, lure.luck, rod.flag \
								FROM fishing_zone AS zone \
								INNER JOIN fishing_rod  AS rod  USING (fishid) \
								INNER JOIN fishing_lure AS lure USING (fishid) \
								INNER JOIN fishing_fish AS fish USING (fishid) \
								WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck = 0";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->getZone(), RodID, LureID);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			// результат ловли предмета
		}						
	}
	else
	{
		const int8* fmtQuery = "SELECT fish.fishid, lure.luck, rod.flag \
								FROM fishing_zone AS zone \
								INNER JOIN fishing_rod  AS rod  USING (fishid) \
								INNER JOIN fishing_lure AS lure USING (fishid) \
								INNER JOIN fishing_fish AS fish USING (fishid) \
								WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck != 0 \
								ORDER BY luck"; 
		
		int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->getZone(), RodID, LureID);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			int32 FisherLuck = 0;
			int32 FishingChance = rand()%1000;

			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
			{
				FisherLuck += Sql_GetIntData(SqlHandle,1);

				if (FishingChance <= FisherLuck)
				{
					PFish = itemutils::GetItemPointer(Sql_GetIntData(SqlHandle,0));

					PChar->UContainer->SetType(UCONTAINER_FISHING);
					PChar->UContainer->SetItem(0, PFish);
					break;
				}	
			}
		}
	}

	return (PFish != NULL);
}

/************************************************************************
*																		*
*  Персонаж теряет наживку (теряет блесну лишь при условии RemoveFly)	*
*																		*
************************************************************************/

bool LureLoss(CCharEntity* PChar, bool RemoveFly)
{	
	CItemWeapon* PLure = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

	//DSP_DEBUG_BREAK_IF(PLure == NULL);
	//DSP_DEBUG_BREAK_IF(!(PLure->getType() & ITEM_WEAPON));
	//DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FSH);

	if (!RemoveFly &&
	   ( PLure->getStackSize() == 1))
	{
		return false;
	}
	if (PLure->getQuantity() == 1)
	{
		charutils::UnequipItem(PChar, PChar->equip[SLOT_AMMO]);
	}

	charutils::UpdateItem(PChar, PLure->getLocationID(), PLure->getSlotID(), -1);
	PChar->pushPacket(new CInventoryFinishPacket());
	return true;
}

/************************************************************************
*																		*
*  Персонаж ломает удочку												*
*																		*
************************************************************************/

void RodBreaks(CCharEntity* PChar)
{
	uint8  SlotID = PChar->equip[SLOT_RANGED];
	CItem* PRod   = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

	//DSP_DEBUG_BREAK_IF(PRod == NULL);

	uint16 BrokenRodID = 0;

	switch (PRod->getID())
	{
		case 0x4276:  BrokenRodID = 0x0728; break;
		case 0x4277:  BrokenRodID = 0x0729; break;
		case 0x43E4:  BrokenRodID = 0x01E3; break;
		case 0x43E5:  BrokenRodID = 0x01D9; break;
		case 0x43E6:  BrokenRodID = 0x01D8; break;
		case 0x43E7:  BrokenRodID = 0x01E2; break;
		case 0x43E8:  BrokenRodID = 0x01EA; break;
		case 0x43E9:  BrokenRodID = 0x01EB; break;
		case 0x43EA:  BrokenRodID = 0x01E9; break;
		case 0x43EB:  BrokenRodID = 0x01E4; break;
		case 0x43EC:  BrokenRodID = 0x01E8; break;
		case 0x43ED:  BrokenRodID = 0x01E7; break;
		case 0x43EE:  BrokenRodID = 0x01E6; break;
		case 0x43EF:  BrokenRodID = 0x01E5; break;
	}

	//DSP_DEBUG_BREAK_IF(BrokenRodID == 0);

	charutils::EquipItem(PChar, 0, SLOT_RANGED);
	charutils::UpdateItem(PChar, LOC_INVENTORY, SlotID, -1); 
	charutils::AddItem(PChar, LOC_INVENTORY, BrokenRodID, 1);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 stamina)
{
	uint16 MessageOffset = GetMessageOffset(PChar->getZone());

	switch (action) 
	{
		case FISHACTION_CHECK:
		{
			if (CheckFisherLuck(PChar))
			{
				// сообщение: "Something caught the hook!"
			
				PChar->animation = ANIMATION_FISHING_FISH;
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x08));
				PChar->pushPacket(new CFishingPacket());
			}
			else
			{
				// сообщение: "You didn't catch anything."

				PChar->animation = ANIMATION_FISHING_STOP;
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));
			}
		}
		break;
		case FISHACTION_FINISH:
		{
			if (stamina == 0)
			{
				// сообщение: "You caught fish!"

				//DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
				//DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == NULL);

				PChar->animation = ANIMATION_FISHING_CAUGHT;

				CItem* PFish = PChar->UContainer->GetItem(0);

				charutils::AddItem(PChar, LOC_INVENTORY, PFish->getID(), 1);
				zoneutils::GetZone(PChar->getZone())->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, PFish->getID(), MessageOffset + 0x27));

				if (PFish->getType() & ITEM_USABLE)
				{
					LureLoss(PChar, false);
				}
			}
			else if (stamina <= 0x64)
			{
				// сообщение: "Your line breaks!"
	
				PChar->animation = ANIMATION_FISHING_LINE_BREAK;
				LureLoss(PChar, true);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
			}
			else if (stamina <= 0x100)
			{
				// сообщение: "You give up!"

				PChar->animation = ANIMATION_FISHING_STOP;

				if (PChar->UContainer->GetType() == UCONTAINER_FISHING &&
					LureLoss(PChar, false))
				{
					PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x24));
				} else {
					PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x25));
				}
			}
			else
			{
				// сообщение: "You lost your catch!"

				PChar->animation = ANIMATION_FISHING_STOP;
				LureLoss(PChar, false);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
			}
			PChar->UContainer->Clean();
		}
		break;
		case FISHACTION_WARNING:
		{
			// сообщение: "You don't know how much longer you can keep this one on the line..."

			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x28));
			return;
		}
		break;
		case FISHACTION_END:
		{
			// skillup

			PChar->animation = ANIMATION_NONE;
		}
		break;
	}

	PChar->status = STATUS_UPDATE;
			
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

} // namespace fishingutils
