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


#include "entities/battleentity.h"
#include "attackround.h"
#include "attack.h"
#include "status_effect_container.h"
#include "items/item_weapon.h"

#include <math.h>

/************************************************************************
*																		*
*  Constructor.															*
*																		*
************************************************************************/
CAttack::CAttack(CBattleEntity* attacker, CBattleEntity* defender, PHYSICAL_ATTACK_TYPE type,
    PHYSICAL_ATTACK_DIRECTION direction, CAttackRound* attackRound) :
    m_attacker(attacker),
    m_victim(defender),
    m_attackRound(attackRound),
    m_attackType(type),
    m_attackDirection(direction)
{
}

/************************************************************************
*																		*
*  Returns the attack direction.										*
*																		*
************************************************************************/
PHYSICAL_ATTACK_DIRECTION CAttack::GetAttackDirection()
{
    return m_attackDirection;
}

/************************************************************************
*																		*
*  Returns the attack type.												*
*																		*
************************************************************************/
PHYSICAL_ATTACK_TYPE CAttack::GetAttackType()
{
    return m_attackType;
}

/************************************************************************
*																		*
*  Sets the attack type.												*
*																		*
************************************************************************/
void CAttack::SetAttackType(PHYSICAL_ATTACK_TYPE type)
{
    m_attackType = type;
}

/************************************************************************
*																		*
*  Returns the isCritical flag.											*
*																		*
************************************************************************/
bool CAttack::IsCritical()
{
    return m_isCritical;
}

/************************************************************************
*																		*
*  Sets the critical flag.												*
*																		*
************************************************************************/
void CAttack::SetCritical(bool value)
{
    m_isCritical = value;
    m_damageRatio = battleutils::GetDamageRatio(m_attacker, m_victim, m_isCritical, 0);
}

/************************************************************************
*																		*
*  Sets the guarded flag.												*
*																		*
************************************************************************/
bool CAttack::IsGuarded()
{
    m_isGuarded = attackutils::IsGuarded(m_attacker, m_victim);
    if (m_isGuarded)
    {
        if (m_damageRatio > 1.0f)
        {
            m_damageRatio -= 1.0f;
        }
        else
        {
            m_damageRatio = 0;
        }
    }
    return m_isGuarded;
}

/************************************************************************
*																		*
*  Gets the evaded flag.												*
*																		*
************************************************************************/
bool CAttack::IsEvaded()
{
    return m_isEvaded;
}

/************************************************************************
*																		*
*  Sets the evaded flag.												*
*																		*
************************************************************************/
void CAttack::SetEvaded(bool value)
{
    m_isEvaded = value;
}

/************************************************************************
*																		*
*  Gets the blocked flag.												*
*																		*
************************************************************************/
bool CAttack::IsBlocked()
{
    return m_isBlocked;
}

bool CAttack::IsParried()
{
    return attackutils::IsParried(m_attacker, m_victim);
}

bool CAttack::IsAnticipated()
{
    return m_anticipated;
}

/************************************************************************
*																		*
*  Returns the isFirstSwing flag.										*
*																		*
************************************************************************/
bool CAttack::IsFirstSwing()
{
    return m_isFirstSwing;
}

/************************************************************************
*																		*
*  Sets this swing as the first.										*
*																		*
************************************************************************/
void CAttack::SetAsFirstSwing(bool isFirst)
{
    m_isFirstSwing = isFirst;
}

/************************************************************************
*																		*
*  Gets the damage ratio.												*
*																		*
************************************************************************/
float CAttack::GetDamageRatio()
{
    return m_damageRatio;
}

/************************************************************************
*																		*
*  Sets the attack type.												*
*																		*
************************************************************************/
uint8 CAttack::GetWeaponSlot()
{
    if (m_attackRound->IsH2H())
    {
        return SLOT_MAIN;
    }
    return m_attackDirection == RIGHTATTACK ? SLOT_MAIN : SLOT_SUB;
}

/************************************************************************
*																		*
*  Returns the animation ID.											*
*																		*
************************************************************************/
uint8 CAttack::GetAnimationID()
{
    // Try normal kick attacks (without footwork)
    if (this->m_attackType == PHYSICAL_ATTACK_TYPE::KICK)
    {
        return this->m_attackDirection == RIGHTATTACK ? 2 : 3;
    }

    // Normal attack
    return this->m_attackDirection == RIGHTATTACK ? 0 : 1;
}

/************************************************************************
*																		*
*  Returns the hitrate for this swing.									*
*																		*
************************************************************************/
uint8 CAttack::GetHitRate()
{
    // Right hand hitrate
    if (m_attackDirection == RIGHTATTACK && m_attackType != PHYSICAL_ATTACK_TYPE::KICK)
    {
        if (m_attackType == PHYSICAL_ATTACK_TYPE::ZANSHIN)
        {
            m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 0, (uint8)35);
        }
        else
        {
            m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 0);
        }

        // Deciding this here because SA/TA wears on attack, before the 2nd+ hits go off.
        if (m_hitRate == 100)
        {
            m_attackRound->SetSATA(true);
        }
    }
    // Left hand hitrate
    else if (m_attackDirection == LEFTATTACK && m_attackType != PHYSICAL_ATTACK_TYPE::KICK)
    {
        if (m_attackType == PHYSICAL_ATTACK_TYPE::ZANSHIN)
        {
            m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 1, (uint8)35);
        }
        else
        {
            m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 1);
        }
    }
    // Kick hit rate
    else if (m_attackType == PHYSICAL_ATTACK_TYPE::KICK)
    {
        m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 2);
    }
    return m_hitRate;
}

/************************************************************************
*																		*
*  Returns the damage for this swing.									*
*																		*
************************************************************************/
int32 CAttack::GetDamage()
{
    return m_damage;
}

/************************************************************************
*																		*
*  Sets the damage for this swing.										*
*																		*
************************************************************************/
void CAttack::SetDamage(int32 value)
{
    m_damage = value;
}

bool CAttack::CheckAnticipated()
{
    CStatusEffect* effect = m_victim->StatusEffectContainer->GetStatusEffect(EFFECT_THIRD_EYE, 0);
    if (effect == nullptr)
    {
        return false;
    }

    //power stores how many times this effect has anticipated
    uint8 pastAnticipations = effect->GetPower();

    if (pastAnticipations > 7)
    {
        //max 7 anticipates!
        m_victim->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
        return false;
    }

    bool hasSeigan = m_victim->StatusEffectContainer->HasStatusEffect(EFFECT_SEIGAN, 0);

    if (!hasSeigan && pastAnticipations == 0)
    {
        m_victim->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
        m_anticipated = true;
        return true;
    }
    else if (!hasSeigan)
    {
        m_victim->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
        return false;
    }
    else
    { //do have seigan, decay anticipations correctly (guesstimated)
        //5-6 anticipates is a 'lucky' streak, going to assume 15% decay per proc, with a 100% base w/ Seigan
        if (dsprand::GetRandomNumber(100) < (100 - (pastAnticipations * 15) + m_victim->getMod(Mod::THIRD_EYE_ANTICIPATE_RATE)))
        {
            //increment power and don't remove
            effect->SetPower(effect->GetPower() + 1);
            //chance to counter - 25% base
            if (dsprand::GetRandomNumber(100) < 25 + m_victim->getMod(Mod::THIRD_EYE_COUNTER_RATE))
            {
                m_isCountered = true;
                m_isCritical = (dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(m_victim, m_attacker, false));
            }
            m_anticipated = true;
            return true;
        }
        m_victim->StatusEffectContainer->DelStatusEffect(EFFECT_THIRD_EYE);
        return false;
    }

    return false;
}

bool CAttack::IsCountered()
{
    return m_isCountered;
}

bool CAttack::CheckCounter()
{
    uint8 meritCounter = 0;
    if (m_victim->objtype == TYPE_PC && charutils::hasTrait((CCharEntity*)m_victim, TRAIT_COUNTER))
    {
        if (m_victim->GetMJob() == JOB_MNK || m_victim->GetMJob() == JOB_PUP)
        {
            meritCounter = ((CCharEntity*)m_victim)->PMeritPoints->GetMeritValue(MERIT_COUNTER_RATE, (CCharEntity*)m_victim);
        }
    }

    //counter check (rate AND your hit rate makes it land, else its just a regular hit)
    //having seigan active gives chance to counter at 25% of the zanshin proc rate
    uint16 seiganChance = 0;
    if (m_victim->objtype == TYPE_PC && m_victim->StatusEffectContainer->HasStatusEffect(EFFECT_SEIGAN))
    {
        seiganChance = m_victim->getMod(Mod::ZANSHIN) + ((CCharEntity*)m_victim)->PMeritPoints->GetMeritValue(MERIT_ZASHIN_ATTACK_RATE, (CCharEntity*)m_victim);
        seiganChance = dsp_cap(seiganChance, 0, 100);
        seiganChance /= 4;
    }
    if ((dsprand::GetRandomNumber(100) < (m_victim->getMod(Mod::COUNTER) + meritCounter) || dsprand::GetRandomNumber(100) < seiganChance) &&
        isFaceing(m_victim->loc.p, m_attacker->loc.p, 40) && dsprand::GetRandomNumber(100) < battleutils::GetHitRate(m_victim, m_attacker))
    {
        m_isCountered = true;
        m_isCritical = (dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(m_victim, m_attacker, false));
    }
    else if (m_victim->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_COUNTER))
    { //Perfect Counter only counters hits that normal counter misses, always critical, can counter 1-3 times before wearing
        m_isCountered = true;
        m_isCritical = true;
        m_victim->StatusEffectContainer->DelStatusEffect(EFFECT_PERFECT_COUNTER);
    }
    return m_isCountered;
}

/************************************************************************
*																		*
*  Processes the damage for this swing.									*
*																		*
************************************************************************/
void CAttack::ProcessDamage()
{
    // Sneak attack.
    if (m_attacker->GetMJob() == JOB_THF &&
        m_isFirstSwing &&
        m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK) &&
        ((abs(m_victim->loc.p.rotation - m_attacker->loc.p.rotation) < 23) ||
            m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_HIDE)))
    {
        m_trickAttackDamage = m_attacker->DEX();
    }

    // Trick attack.
    if (m_attacker->GetMJob() == JOB_THF &&
        m_isFirstSwing &&
        m_attackRound->GetTAEntity() != nullptr)
    {
        m_trickAttackDamage += m_attacker->AGI() * (1 + m_attacker->getMod(Mod::TRICK_ATK_AGI) / 100);
    }

    // H2H.
    if (m_attackRound->IsH2H())
    {
        // FFXIclopedia H2H: Remove 3 dmg from weapon, DB has an extra 3 for weapon rank. h2hSkill*0.11+3
        m_naturalH2hDamage = (float)(m_attacker->GetSkill(SKILL_H2H) * 0.11f);
        m_baseDamage = dsp_max(m_attacker->GetMainWeaponDmg(), 3);
        if (m_attackType == PHYSICAL_ATTACK_TYPE::KICK)
        {
            m_baseDamage = m_attacker->getMod(Mod::KICK_DMG) + 3;
        }
        m_damage = (uint32)(((m_baseDamage + m_naturalH2hDamage + m_trickAttackDamage +
            battleutils::GetFSTR(m_attacker, m_victim, GetWeaponSlot())) * m_damageRatio));
    }
    // Not H2H.
    else
    {
        if (GetWeaponSlot() == SLOT_MAIN)
        {
            m_damage = (uint32)(((m_attacker->GetMainWeaponDmg() + m_trickAttackDamage +
                battleutils::GetFSTR(m_attacker, m_victim, GetWeaponSlot())) * m_damageRatio));
        }
        else if (GetWeaponSlot() == SLOT_SUB)
        {
            m_damage = (uint32)(((m_attacker->GetSubWeaponDmg() + m_trickAttackDamage +
                battleutils::GetFSTR(m_attacker, m_victim, GetWeaponSlot())) * m_damageRatio));
        }
    }

    // Soul eater.
    if (m_attacker->objtype == TYPE_PC)
    {
        m_damage = battleutils::doSoulEaterEffect((CCharEntity*)m_attacker, m_damage);
    }

    // Set attack type to Samba if the attack type is normal.  Don't overwrite other types.  Used for Samba double damage.
    if (m_attackType == PHYSICAL_ATTACK_TYPE::NORMAL && m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_SAMBA))
    {
        SetAttackType(PHYSICAL_ATTACK_TYPE::SAMBA);
    }

    // Get damage multipliers.
    m_damage = attackutils::CheckForDamageMultiplier((CCharEntity*)m_attacker, m_attacker->m_Weapons[GetWeaponSlot()], m_damage, m_attackType);

    // Get critical bonus mods.
    if (m_isCritical)
    {
        m_damage += (m_damage * (float)m_attacker->getMod(Mod::CRIT_DMG_INCREASE) / 100);
    }

    // Apply Sneak Attack Augment Mod
    if (m_attacker->getMod(Mod::AUGMENTS_SA) > 0 && m_trickAttackDamage > 0 && m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK))
    {
        m_damage += (m_damage * ((100 + (m_attacker->getMod(Mod::AUGMENTS_SA))) / 100));
    }

    // Apply Trick Attack Augment Mod
    if (m_attacker->getMod(Mod::AUGMENTS_TA) > 0 && m_trickAttackDamage > 0 && m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
    {
        m_damage += (m_damage * ((100 + (m_attacker->getMod(Mod::AUGMENTS_TA))) / 100));
    }

    // Try skill up.
    if (m_damage > 0)
    {
        charutils::TrySkillUP((CCharEntity*)m_attacker, (SKILLTYPE)m_attacker->m_Weapons[GetWeaponSlot()]->getSkillType(), m_victim->GetMLevel());
    }
    m_isBlocked = attackutils::IsBlocked(m_attacker, m_victim);
}
