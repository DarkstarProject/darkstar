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

#include "mob_spell_container.h"
#include "utils/battleutils.h"
#include "status_effect_container.h"
#include "mob_modifier.h"

CMobSpellContainer::CMobSpellContainer(CMobEntity* PMob)
{
  m_PMob = PMob;
  m_hasSpells = false;
}

void CMobSpellContainer::ClearSpells()
{
  m_gaList.clear();
  m_damageList.clear();
  m_buffList.clear();
  m_healList.clear();
  m_naList.clear();
  m_hasSpells = false;
}

void CMobSpellContainer::AddSpell(int16 spellId)
{
  // get spell
  CSpell* spell = spell::GetSpell(spellId);

  if(spell == nullptr){
    ShowDebug("Missing spellID = %d, given to mob. Check spell_list.sql\n", spellId);
    return;
  }

  m_hasSpells = true;

  // add spell to correct vector
  // try to add it to ga list first
  uint8 aoe = battleutils::GetSpellAoEType(m_PMob, spell);
  if(aoe > 0 && spell->canTargetEnemy()){

    m_gaList.push_back(spellId);

  } else if(spell->canTargetEnemy()){
    // add to damage list
    m_damageList.push_back(spellId);

  } else if(spell->isNa() || spellId == 143){
    // na spell and erase
    m_naList.push_back(spellId);

  } else if(spell->isHeal()){ // includes blue mage healing spells, wild carrot etc
    // add to healing
    m_healList.push_back(spellId);

  } else if(spell->isBuff()){
    // buff
    m_buffList.push_back(spellId);

  } else {
    ShowDebug("Where does this spell go? %d\n", spellId);
  }
}

bool CMobSpellContainer::HasSpells()
{
  return m_hasSpells;
}

bool CMobSpellContainer::HasMPSpells()
{

  for (std::vector<int16>::iterator it = m_damageList.begin() ; it != m_damageList.end(); ++it)
  {
    if(spell::GetSpell((*it))->hasMPCost()){
      return true;
    }
  }

  for (std::vector<int16>::iterator it = m_buffList.begin() ; it != m_buffList.end(); ++it)
  {
    if(spell::GetSpell((*it))->hasMPCost()){
      return true;
    }
  }

  return false;
}

int16 CMobSpellContainer::GetAggroSpell()
{
  // high chance to return ga spell
    if (HasGaSpells() && dsprand::GetRandomNumber(100) <= m_PMob->getMobMod(MOBMOD_GA_CHANCE)){
    return GetGaSpell();
  }

  // else to return damage spell
  return GetDamageSpell();
}

int16 CMobSpellContainer::GetSpell()
{
  int16 spellId = -1;
  // prioritize curing if health low enough
  if (HasHealSpells() && m_PMob->GetHPP() <= m_PMob->getMobMod(MOBMOD_HP_HEAL_CHANCE) && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_HEAL_CHANCE)){
    return GetHealSpell();
  }

  // almost always use na if I can
  if (HasNaSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_NA_CHANCE)){
    // will return -1 if no proper na spell exists
    spellId = GetNaSpell();
    if(spellId > -1){
      return spellId;
    }
  }

  // try ga spell
  if (HasGaSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_GA_CHANCE)){
    return GetGaSpell();
  }

  if (HasBuffSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_BUFF_CHANCE)){
    return GetBuffSpell();
  }

  // Grab whatever spell can be found
  // starting from damage spell
  if(HasDamageSpells())
  {
      // try damage spell
      return GetDamageSpell();
  }

  if(HasBuffSpells())
  {
      return GetBuffSpell();
  }

  if(HasGaSpells())
  {
      return GetGaSpell();
  }

  if(HasHealSpells())
  {
      return GetHealSpell();
  }

  // Got no spells to use
  return -1;
}

int16 CMobSpellContainer::GetGaSpell()
{
  if(m_gaList.empty()) return -1;

  return m_gaList[dsprand::GetRandomNumber(m_gaList.size())];
}

int16 CMobSpellContainer::GetDamageSpell()
{
  if(m_damageList.empty()) return -1;

  return m_damageList[dsprand::GetRandomNumber(m_damageList.size())];
}

int16 CMobSpellContainer::GetBuffSpell()
{
  if(m_buffList.empty()) return -1;

  return m_buffList[dsprand::GetRandomNumber(m_buffList.size())];
}

int16 CMobSpellContainer::GetHealSpell()
{
  if(m_PMob->m_EcoSystem == SYSTEM_UNDEAD || m_healList.empty()) return -1;

  return m_healList[dsprand::GetRandomNumber(m_healList.size())];
}

int16 CMobSpellContainer::GetNaSpell()
{
  if(m_naList.empty()) return -1;

  // paralyna
  if(HasNaSpell(15) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_PARALYSIS)){
    return 15;
  }

  // cursna
  if(HasNaSpell(20) && (m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CURSE) || m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CURSE_II))){
    return 20;
  }

  // erase
  if(HasNaSpell(143) && m_PMob->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE)){
    return 143;
  }

  // blindna
  if(HasNaSpell(16) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS)){
    return 16;
  }

  // poisona
  if(HasNaSpell(14) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_POISON)){
    return 14;
  }

  // viruna? whatever ignore
  // silena ignore
  // stona ignore

  return -1;
}

bool CMobSpellContainer::HasGaSpells()
{
  return !m_gaList.empty();
}

bool CMobSpellContainer::HasDamageSpells()
{
  return !m_damageList.empty();
}

bool CMobSpellContainer::HasBuffSpells()
{
  return !m_buffList.empty();
}

bool CMobSpellContainer::HasHealSpells()
{
  return !m_healList.empty();
}

bool CMobSpellContainer::HasNaSpells()
{
  return !m_naList.empty();
}

bool CMobSpellContainer::HasNaSpell(int16 spellId)
{

  for(std::vector<int16>::iterator iter = m_naList.begin(); iter != m_naList.end(); iter++)
  {
    if(*iter == spellId)
    {
      return true;
    }
  }
  return false;
}
