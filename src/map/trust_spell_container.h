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

#ifndef _CTrustSpellContainer_H
#define _CTrustSpellContainer_H

#include <vector>

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "spell.h"
#include "entities/trustentity.h"
#include <optional>

class CTrustSpellContainer
{
public:

  CTrustSpellContainer(CTrustEntity* PTrust);

  //Spells
  // These methods return a random spell
  std::optional<SpellID> GetAggroSpell(); // -ga spell, dia, bio, paralyze, silence, blind
  std::optional<SpellID> GetGaSpell(); // AoE damage spells, stonega, diaga
  std::optional<SpellID> GetDamageSpell(); // Single target damage spells, stone
  std::optional<SpellID> GetBuffSpell(); // stoneskin, utsusemi, blink
  std::optional<SpellID> GetDebuffSpell(); // 
  std::optional<SpellID> GetHealSpell(); // cures, regen, armys paeon
  std::optional<SpellID> GetNaSpell(CBattleEntity* target); // silena, blindna etc
  std::optional<SpellID> GetSpell(); // return a random spell

  bool HasSpells() const;
  bool HasMPSpells() const;
  bool HasNaSpell(SpellID spellId) const;
  bool HasGaSpells() const;
  bool HasDebuffSpells() const;
  bool HasDamageSpells() const;
  bool HasBuffSpells() const;
  bool HasHealSpells() const;
  bool HasNaSpells() const;
  bool getCanCastSpells();
  void setCanCastSpells(bool spellBool);

  void ClearSpells();
  void AddSpell(SpellID spellId);
  void RemoveSpell(SpellID spellId);

  std::vector<SpellID> m_gaList;
  std::vector<SpellID> m_damageList;
  std::vector<SpellID> m_debuffList;
  std::vector<SpellID> m_buffList;
  std::vector<SpellID> m_healList;
  std::vector<SpellID> m_naList;

  //WeaponSkills

  std::optional<uint16> GetWeaponSkill();
  std::vector<uint16> m_wsList;

  bool HasWeaponSkills() const;
  void ClearWeaponskills();
  void AddWeaponskills(uint16 wsId);
  bool getCanUseWeaponSkill();
  void setCanUseWeaponSkill(bool wsBool);

  //Abilities

private:
  CTrustEntity* m_PTrust;
  bool m_hasSpells;
  bool m_canCastSpells;
  bool m_hasWeaponskills;
  bool m_canUseWeaponskills;

};

#endif