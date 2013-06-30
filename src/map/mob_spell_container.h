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

#ifndef _CMOBSPELLCONTAINER_H
#define _CMOBSPELLCONTAINER_H

#include <vector>

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "spell.h"
#include "mobentity.h"

class CMobSpellContainer
{
public:

  CMobSpellContainer(CMobEntity* PMob);


  // These methods return a random spell
  int16 GetAggroSpell(); // -ga spell, dia, bio, paralyze, silence, blind
  int16 GetGaSpell(); // AoE damage spells, stonega, diaga
  int16 GetDamageSpell(); // Single target damage spells, stone
  int16 GetBuffSpell(); // stoneskin, utsusemi, blink
  int16 GetHealSpell(); // cures, regen, armys paeon
  int16 GetNaSpell(); // silena, blindna etc
  int16 GetSpell(); // return a random spell

  bool HasSpells();
  bool HasNaSpell(int16 spellId);
  bool HasGaSpells();
  bool HasDamageSpells();
  bool HasBuffSpells();
  bool HasHealSpells();
  bool HasNaSpells();

  void ClearSpells();
  void AddSpell(int16 spellId);
  // TODO:
  void RemoveSpell(int16 spellId);

  std::vector<int16> m_gaList;
  std::vector<int16> m_damageList;
  std::vector<int16> m_buffList;
  std::vector<int16> m_healList;
  std::vector<int16> m_naList;

  int16 m_gaChance;
  int16 m_buffChance;
  int16 m_healChance;
  int16 m_maxHPHealChance;

private:
  CMobEntity* m_PMob;
  bool m_hasSpells;

};

#endif