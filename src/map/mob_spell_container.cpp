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

void CMobSpellContainer::AddSpell(SpellID spellId)
{
    // get spell
    CSpell* spell = spell::GetSpell(spellId);

    if(spell == nullptr){
        ShowDebug("Missing spellID = %d, given to mob. Check spell_list.sql\n", static_cast<uint16>(spellId));
        return;
    }

    m_hasSpells = true;

    // add spell to correct vector
    // try to add it to ga list first
    uint8 aoe = battleutils::GetSpellAoEType(m_PMob, spell);
    if(aoe > 0 && spell->canTargetEnemy()){

        m_gaList.push_back(spellId);

    }
    else if(spell->canTargetEnemy()){
        // add to damage list
        m_damageList.push_back(spellId);

    }
    else if(spell->isNa()){
        // na spell and erase
        m_naList.push_back(spellId);

    }
    else if(spell->isHeal()){ // includes blue mage healing spells, wild carrot etc
   // add to healing
        m_healList.push_back(spellId);

    }
    else if(spell->isBuff()){
        // buff
        m_buffList.push_back(spellId);

    }
    else {
        ShowDebug("Where does this spell go? %d\n", static_cast<uint16>(spellId));
    }
}

bool CMobSpellContainer::HasSpells() const
{
    return m_hasSpells;
}

bool CMobSpellContainer::HasMPSpells() const
{
    for(auto spell : m_damageList)
    {
        if(spell::GetSpell(spell)->hasMPCost()){
            return true;
        }
    }

    for(auto spell : m_buffList)
    {
        if(spell::GetSpell(spell)->hasMPCost()){
            return true;
        }
    }

    return false;
}

std::optional<SpellID> CMobSpellContainer::GetAggroSpell()
{
    // high chance to return ga spell
    if(HasGaSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_GA_CHANCE)){
        return GetGaSpell();
    }

    // else to return damage spell
    return GetDamageSpell();
}

std::optional<SpellID> CMobSpellContainer::GetSpell()
{
    // prioritize curing if health low enough
    if(HasHealSpells() && m_PMob->GetHPP() <= m_PMob->getMobMod(MOBMOD_HP_HEAL_CHANCE) && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_HEAL_CHANCE)){
        return GetHealSpell();
    }

    // almost always use na if I can
    if(HasNaSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_NA_CHANCE)){
        // will return -1 if no proper na spell exists
        auto naSpell = GetNaSpell();
        if(naSpell){
            return naSpell.value();
        }
    }

    // try ga spell
    if(HasGaSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_GA_CHANCE)){
        return GetGaSpell();
    }

    if(HasBuffSpells() && dsprand::GetRandomNumber(100) < m_PMob->getMobMod(MOBMOD_BUFF_CHANCE)){
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
    return {};
}

std::optional<SpellID> CMobSpellContainer::GetGaSpell()
{
    if(m_gaList.empty()) return {};

    return m_gaList[dsprand::GetRandomNumber(m_gaList.size())];
}

std::optional<SpellID> CMobSpellContainer::GetDamageSpell()
{
    if(m_damageList.empty()) return {};

    return m_damageList[dsprand::GetRandomNumber(m_damageList.size())];
}

std::optional<SpellID> CMobSpellContainer::GetBuffSpell()
{
    if(m_buffList.empty()) return {};

    return m_buffList[dsprand::GetRandomNumber(m_buffList.size())];
}

std::optional<SpellID> CMobSpellContainer::GetHealSpell()
{
    if(m_PMob->m_EcoSystem == SYSTEM_UNDEAD || m_healList.empty()) return {};

    return m_healList[dsprand::GetRandomNumber(m_healList.size())];
}

std::optional<SpellID> CMobSpellContainer::GetNaSpell()
{
    if(m_naList.empty()) return {};

    // paralyna
    if(HasNaSpell(SpellID::Paralyna) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_PARALYSIS)) {
        return SpellID::Paralyna;
    }

    // cursna
    if(HasNaSpell(SpellID::Cursna) && m_PMob->StatusEffectContainer->HasStatusEffect({EFFECT_CURSE, EFFECT_CURSE_II})){
        return SpellID::Cursna;
    }

    // erase
    if(HasNaSpell(SpellID::Erase) && m_PMob->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE)){
        return SpellID::Erase;
    }

    // blindna
    if(HasNaSpell(SpellID::Blindna) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS)){
        return SpellID::Blindna;
    }

    // poisona
    if(HasNaSpell(SpellID::Poisona) && m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_POISON)){
        return SpellID::Poisona;
    }

    // viruna? whatever ignore
    // silena ignore
    // stona ignore

    return {};
}

bool CMobSpellContainer::HasGaSpells() const
{
    return !m_gaList.empty();
}

bool CMobSpellContainer::HasDamageSpells() const
{
    return !m_damageList.empty();
}

bool CMobSpellContainer::HasBuffSpells() const
{
    return !m_buffList.empty();
}

bool CMobSpellContainer::HasHealSpells() const
{
    return !m_healList.empty();
}

bool CMobSpellContainer::HasNaSpells() const
{
    return !m_naList.empty();
}

bool CMobSpellContainer::HasNaSpell(SpellID spellId) const
{

    for(auto spell : m_naList)
    {
        if(spell == spellId)
        {
            return true;
        }
    }
    return false;
}
