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

#include "trust_spell_container.h"
#include "utils/battleutils.h"
#include "status_effect_container.h"
#include "mob_modifier.h"

CTrustSpellContainer::CTrustSpellContainer(CTrustEntity* PTrust)
{
    m_PTrust = PTrust;
    m_hasSpells = false;
    m_canCastSpells = false;
    m_hasWeaponskills = false;
    m_canUseWeaponskills = false;
}

void CTrustSpellContainer::ClearSpells()
{
    m_gaList.clear();
    m_damageList.clear();
    m_buffList.clear();
    m_debuffList.clear();
    m_healList.clear();
    m_naList.clear();
    m_hasSpells = false;
    m_canCastSpells = false;
}

void CTrustSpellContainer::ClearWeaponskills()
{
    m_wsList.clear();
    m_hasWeaponskills = false;
    m_canUseWeaponskills = false;
}

void CTrustSpellContainer::AddSpell(SpellID spellId)
{
    // get spell
    CSpell* spell = spell::GetSpell(spellId);

    if(spell == nullptr){
        ShowDebug("Missing spellID = %d, given to mob. Check spell_list.sql\n", static_cast<uint16>(spellId));
        return;
    }

    m_hasSpells = true;
    m_canCastSpells = true;

    // add spell to correct vector
    // try to add it to ga list first
    uint8 aoe = battleutils::GetSpellAoEType(m_PTrust, spell);
    if(aoe > 0 && spell->canTargetEnemy()){

        m_gaList.push_back(spellId);

    }
    else if(spell->canTargetEnemy() && !spell->isDebuff()){
        // add to damage list
        m_damageList.push_back(spellId);
    }
    else if (spell->isDebuff()) {
        // add to damage list
        m_debuffList.push_back(spellId);
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

void CTrustSpellContainer::AddWeaponskills(uint16 wsId)
{
    CMobSkill* mobWS = battleutils::GetMobSkill(wsId);

    if (mobWS == nullptr) {
        ShowDebug("Missing wsID = %d, given to mob. Check spell_list.sql\n", static_cast<uint16>(wsId));
        return;
    }

    m_hasWeaponskills = true;
    m_canUseWeaponskills = true;

    // add spell to correct vector
    m_wsList.push_back(wsId);
}

bool CTrustSpellContainer::HasSpells() const
{
    return m_hasSpells;
}

bool CTrustSpellContainer::HasWeaponSkills() const
{
    return m_hasWeaponskills;
}

bool CTrustSpellContainer::HasMPSpells() const
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

std::optional<SpellID> CTrustSpellContainer::GetAggroSpell()
{
    // high chance to return ga spell
    if(HasGaSpells() && dsprand::GetRandomNumber(100) < m_PTrust->getMobMod(MOBMOD_GA_CHANCE)){
        return GetGaSpell();
    }

    // else to return damage spell
    return GetDamageSpell();
}

std::optional<SpellID> CTrustSpellContainer::GetSpell()
{
    // prioritize curing if health low enough
    if (HasHealSpells())
    {
        CCharEntity* player = (CCharEntity*)m_PTrust->PMaster;
        int randomNumber = dsprand::GetRandomNumber(100);
        int healChance = m_PTrust->getMobMod(MOBMOD_HEAL_CHANCE);
        int healthPercent = m_PTrust->getMobMod(MOBMOD_HP_HEAL_CHANCE);

        if (randomNumber < healChance)
        {
            if (m_PTrust->PMaster->GetHPP() <= healthPercent)
            {
                return GetHealSpell();
            }

            if (m_PTrust->GetHPP() <= healthPercent)
            {
                return GetHealSpell();
            }

            for (auto member : m_PTrust->PMaster->PParty->members)
            {
                if (member->GetHPP() <= healthPercent)
                {
                    return GetHealSpell();
                }
            }

            for (auto trust : player->PTrusts)
            {
                if (trust->id != m_PTrust->id)
                {
                    if (trust->GetHPP() <= healthPercent)
                    {
                        return GetHealSpell();
                    }
                }
            }
        }
    }

    // almost always use na if I can
    if(HasNaSpells())
    {
        // will return -1 if no proper na spell exists
        if (GetNaSpell(m_PTrust->PMaster))
        {
            return GetNaSpell(m_PTrust->PMaster).value();
        }

        if (GetNaSpell(m_PTrust))
        {
            return GetNaSpell(m_PTrust).value();
        }

        for (auto member : m_PTrust->PMaster->PParty->members)
        {
            if (GetNaSpell(member))
            {
                return GetNaSpell(member).value();
            }
        }
    }

    // try ga spell
    if(HasGaSpells() && dsprand::GetRandomNumber(100) < m_PTrust->getMobMod(MOBMOD_GA_CHANCE)){
        return GetGaSpell();
    }

    if(HasBuffSpells() && dsprand::GetRandomNumber(100) < m_PTrust->getMobMod(MOBMOD_BUFF_CHANCE)){
        return GetBuffSpell();
    }

    // Grab whatever spell can be found
    // starting from debuff spell
    if (HasDebuffSpells()) {
        return GetDebuffSpell();
    }

    if(HasDamageSpells())
    {
        return GetDamageSpell();
    }

    return {};
}

std::optional<SpellID> CTrustSpellContainer::GetGaSpell()
{
    if(m_gaList.empty()) return {};

    return m_gaList[dsprand::GetRandomNumber(m_gaList.size())];
}

std::optional<SpellID> CTrustSpellContainer::GetDamageSpell()
{
    if(m_damageList.empty()) return {};

    return m_damageList[dsprand::GetRandomNumber(m_damageList.size())];
}

std::optional<SpellID> CTrustSpellContainer::GetDebuffSpell()
{
    if (m_debuffList.empty()) return {};

    return m_debuffList[dsprand::GetRandomNumber(m_debuffList.size())];
}

std::optional<SpellID> CTrustSpellContainer::GetBuffSpell()
{
    if(m_buffList.empty()) return {};

    return m_buffList[dsprand::GetRandomNumber(m_buffList.size())];
}

std::optional<SpellID> CTrustSpellContainer::GetHealSpell()
{
    if(m_healList.empty()) return {};

    return m_healList[dsprand::GetRandomNumber(m_healList.size())];
}

std::optional<SpellID> CTrustSpellContainer::GetNaSpell(CBattleEntity* target)
{
    if(m_naList.empty()) return {};

    // paralyna
    if(HasNaSpell(SpellID::Paralyna) && target->StatusEffectContainer->HasStatusEffect(EFFECT_PARALYSIS)) {
        return SpellID::Paralyna;
    }

    // cursna
    if(HasNaSpell(SpellID::Cursna) && target->StatusEffectContainer->HasStatusEffect({EFFECT_CURSE, EFFECT_CURSE_II})){
        return SpellID::Cursna;
    }

    // erase
    if(HasNaSpell(SpellID::Erase) && target->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_ERASABLE)){
        return SpellID::Erase;
    }

    // blindna
    if(HasNaSpell(SpellID::Blindna) && target->StatusEffectContainer->HasStatusEffect(EFFECT_BLINDNESS)){
        return SpellID::Blindna;
    }

    // poisona
    if(HasNaSpell(SpellID::Poisona) && target->StatusEffectContainer->HasStatusEffect(EFFECT_POISON)){
        return SpellID::Poisona;
    }

    // viruna? whatever ignore
    // silena ignore
    // stona ignore

    return {};
}

bool CTrustSpellContainer::HasGaSpells() const
{
    return !m_gaList.empty();
}

bool CTrustSpellContainer::HasDamageSpells() const
{
    return !m_damageList.empty();
}

bool CTrustSpellContainer::HasDebuffSpells() const
{
    return !m_debuffList.empty();
}

bool CTrustSpellContainer::HasBuffSpells() const
{
    return !m_buffList.empty();
}

bool CTrustSpellContainer::HasHealSpells() const
{
    return !m_healList.empty();
}

bool CTrustSpellContainer::HasNaSpells() const
{
    return !m_naList.empty();
}

bool CTrustSpellContainer::HasNaSpell(SpellID spellId) const
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

bool CTrustSpellContainer::getCanCastSpells()
{
    return m_canCastSpells;
}

bool CTrustSpellContainer::getCanUseWeaponSkill()
{
    return m_canUseWeaponskills;
}

void CTrustSpellContainer::setCanCastSpells(bool spellBool)
{
    m_canCastSpells = spellBool;
}

void CTrustSpellContainer::setCanUseWeaponSkill(bool wsBool)
{
    m_canUseWeaponskills = wsBool;
}

std::optional<uint16> CTrustSpellContainer::GetWeaponSkill()
{
    if (m_wsList.empty()) return {};

    return m_wsList[dsprand::GetRandomNumber(m_wsList.size())];
}