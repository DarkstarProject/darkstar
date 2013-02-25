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


namespace mobutils
{
	void	CalculateStats(CMobEntity* PMob);
  void  AddTraits(CMobEntity* PMob, JOBTYPE jobID, uint8 lvl);
	uint16	GetWeaponDamage(CMobEntity* PMob);
	uint8   checkMultiHits(CMobEntity * PMob,uint32 mobid);
	void    GetAvailableSpells(CMobEntity* PMob);
	void	AddHighestAvailableSpell(CMobEntity* PMob, uint16 highestId, uint16 lowestId, bool ignoreJob);

  // spells for beastmen jobs
  void AddNinSpells(CMobEntity* PMob);
  void AddBrdSpells(CMobEntity* PMob);
  void AddPldSpells(CMobEntity* PMob);
  void AddDrkSpells(CMobEntity* PMob);
  void AddWhmSpells(CMobEntity* PMob);
  void AddBlmSpells(CMobEntity* PMob);
  void AddRdmSpells(CMobEntity* PMob);
  void AddBluSpells(CMobEntity* PMob);

  // spells for families
  void AddWormSpells(CMobEntity* PMob);
  void AddAhrimanSpells(CMobEntity* PMob);
  void AddHecteyesSpells(CMobEntity* PMob);
  void AddUndeadSpells(CMobEntity* PMob);
  void AddFlanSpells(CMobEntity* PMob);
};

#endif