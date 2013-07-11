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

#ifndef _MOBUTILS_H
#define _MOBUTILS_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "mobentity.h"
#include "modifier.h"

typedef struct
{
  uint32 id;
  std::vector<CModifier*> mods;
  std::vector<CModifier*> mobMods;
} ModsList_t;

namespace mobutils
{
	void	CalculateStats(CMobEntity* PMob);
  void  AddTraits(CMobEntity* PMob, JOBTYPE jobID, uint8 lvl);
  void   AddMods(CMobEntity* PMob);
	uint16	GetWeaponDamage(CMobEntity* PMob);
	void    GetAvailableSpells(CMobEntity* PMob);
  void  InitializeMob(CMobEntity* PMob);
  void  LoadCustomMods();

  // returns the families mod list
  ModsList_t* GetMobFamilyMods(uint16 familyId, bool create = false);

  // returns the pool mod list
  ModsList_t* GetMobPoolMods(uint32 poolId, bool create = false);
  void  AddCustomMods(CMobEntity* PMob);
};

#endif