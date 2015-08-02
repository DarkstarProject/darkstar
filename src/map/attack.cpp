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

#include <math.h>

/************************************************************************
*																		*
*  Constructor.															*
*																		*
************************************************************************/
CAttack::CAttack(CBattleEntity* attacker, PHYSICAL_ATTACK_TYPE type, PHYSICAL_ATTACK_DIRECTION direction, CAttackRound* attackRound)
{
	m_attacker = attacker;
	m_victim = attacker->PBattleAI->GetBattleTarget();
	m_attackRound = attackRound;
	m_attackType = type;
	m_attackDirection = direction;
	m_hitRate = 0;
	m_isCritical = false;
	m_isGuarded = false;
	m_isBlocked = false;
	m_isEvaded = false;
	m_isFirstSwing = false;
	m_damageRatio = 0;
	m_damage = 0;
	m_trickAttackDamage = 0;
	m_naturalH2hDamage = 0;
	m_baseDamage = 0;
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
	m_isBlocked = attackutils::IsBlocked(m_attacker, m_victim);
	return m_isBlocked;
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
	// Footwork
	if (m_attacker->GetMJob() == JOB_MNK && m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_FOOTWORK))
	{
		return this->m_attackDirection == RIGHTATTACK ? 2 : 3;
	}

	// Try normal kick attacks (without footwork)
	if (this->m_attackType == KICK_ATTACK)
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
	if (m_attackDirection == RIGHTATTACK && m_attackType != KICK_ATTACK)
	{
		if (m_attackType == ZANSHIN_ATTACK)
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
	else if (m_attackDirection == LEFTATTACK && m_attackType != KICK_ATTACK)
	{
		if (m_attackType == ZANSHIN_ATTACK)
		{
			m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 1, (uint8)35);
		}
		else
		{
			m_hitRate = battleutils::GetHitRate(m_attacker, m_victim, 1);
		}
	}
	// Kick hit rate
	else if (m_attackType == KICK_ATTACK)
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
		m_trickAttackDamage += m_attacker->AGI() * (1 + m_attacker->getMod(MOD_TRICK_ATK_AGI)/100);
	}

	// H2H.
	if (m_attackRound->IsH2H())
	{
		// FFXIclopedia H2H: Remove 3 dmg from weapon, DB has an extra 3 for weapon rank. h2hSkill*0.11+3
		m_naturalH2hDamage = (float)(m_attacker->GetSkill(SKILL_H2H) * 0.11f)+3;
        m_baseDamage = m_attacker->GetMainWeaponDmg()-3;
        if (m_attackType == KICK_ATTACK)
		{
            m_baseDamage = m_attacker->getMod(MOD_KICK_DMG);
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
	if (m_attackType == ATTACK_NORMAL && m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_DRAIN_SAMBA))
	{
		SetAttackType(SAMBA_ATTACK);
	}

	// Get damage multipliers.
	m_damage = attackutils::CheckForDamageMultiplier((CCharEntity*)m_attacker, m_attacker->m_Weapons[GetWeaponSlot()], m_damage, m_attackType);

	// Get critical bonus mods.
	if (m_isCritical)
	{	
		m_damage += (m_damage * (float)m_attacker->getMod(MOD_CRIT_DMG_INCREASE) / 100);
	}

	// Try skill up.
	if (m_damage > 0)
	{
		charutils::TrySkillUP((CCharEntity*)m_attacker, (SKILLTYPE)m_attacker->m_Weapons[GetWeaponSlot()]->getSkillType(), m_victim->GetMLevel());
	}
}
