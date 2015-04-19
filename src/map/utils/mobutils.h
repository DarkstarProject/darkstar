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
  uint32 id;
  std::vector<CModifier*> mods;
  std::vector<CModifier*> mobMods;
} ModsList_t;

enum class WeaknessType {YELLOW, BLUE, RED, WHITE};

typedef std::unordered_map<uint32,ModsList_t*> ModsMap_t;

namespace mobutils
{
	void	CalculateStats(CMobEntity* PMob);
	void	AddTraits(CMobEntity* PMob, JOBTYPE jobID, uint8 lvl);
	uint16	GetWeaponDamage(CMobEntity* PMob);
	void    GetAvailableSpells(CMobEntity* PMob);
	void	InitializeMob(CMobEntity* PMob, CZone* PZone);
	void	LoadCustomMods();

	// get modifiers for pool / family / spawn
	ModsList_t* GetMobFamilyMods(uint16 familyId, bool create = false);
	ModsList_t* GetMobPoolMods(uint32 poolId, bool create = false);
	ModsList_t* GetMobSpawnMods(uint32 mobId, bool create = false);

	void  AddCustomMods(CMobEntity* PMob);
	void  SetupMaat(CMobEntity* PMob, JOBTYPE job);
	void  SetSpellList(CMobEntity*, uint16);
	CMobEntity* InstantiateAlly(uint32 groupid, uint16 zoneID, CInstance* = nullptr);
    void WeaknessTrigger(CBaseEntity* PTarget, WeaknessType level);
};

#endif