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

#ifndef _MOBUTILS_H
#define _MOBUTILS_H

#include <unordered_map>

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#include "../entities/mobentity.h"
#include "../modifier.h"

typedef struct
{
  std::uint32_t id;
  std::vector<CModifier*> mods;
  std::vector<CModifier*> mobMods;
} ModsList_t;

enum class WeaknessType {YELLOW, BLUE, RED, WHITE};

typedef std::unordered_map<std::uint32_t,ModsList_t*> ModsMap_t;

namespace mobutils
{
	void  CalculateStats(CMobEntity* PMob);
        void  SetupJob(CMobEntity* PMob);
        void  SetupRoaming(CMobEntity* PMob);
        void  SetupDynamisMob(CMobEntity* PMob);
        void  SetupBattlefieldMob(CMobEntity* PMob);
        void  SetupDungeonMob(CMobEntity* PMob);
        void  SetupEventMob(CMobEntity* PMob);
        void  SetupNMMob(CMobEntity* PMob);
	void  SetupMaat(CMobEntity* PMob);
	void  SetupPetSkills(CMobEntity* PMob);

	std::uint16_t	GetWeaponDamage(CMobEntity* PMob);
        std::uint16_t  GetMagicEvasion(CMobEntity* PMob);
        std::uint16_t  GetEvasion(CMobEntity* PMob);
        std::uint16_t  GetBase(CMobEntity* PMob, std::uint8_t rank);
        std::uint16_t  GetBaseToRank(std::uint8_t rank, std::uint16_t level);
	void    GetAvailableSpells(CMobEntity* PMob);
	void	InitializeMob(CMobEntity* PMob, CZone* PZone);
	void	LoadCustomMods();

	// get modifiers for pool / family / spawn
	ModsList_t* GetMobFamilyMods(std::uint16_t familyId, bool create = false);
	ModsList_t* GetMobPoolMods(std::uint32_t poolId, bool create = false);
	ModsList_t* GetMobSpawnMods(std::uint32_t mobId, bool create = false);

	void  AddCustomMods(CMobEntity* PMob);

        // Set job before spawn
	void  InitializeMaat(CMobEntity* PMob, JOBTYPE job);

	void  SetSpellList(CMobEntity*, std::uint16_t);
	CMobEntity* InstantiateAlly(std::uint32_t groupid, std::uint16_t zoneID, CInstance* = nullptr);
    void WeaknessTrigger(CBaseEntity* PTarget, WeaknessType level);
};

#endif
