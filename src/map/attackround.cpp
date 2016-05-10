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

#include "attackround.h"
#include "packets/inventory_finish.h"
#include "items/item_weapon.h"
#include "status_effect_container.h"
#include "ai/ai_container.h"
#include "mob_modifier.h"

/************************************************************************
*																		*
*  Constructor.															*
*																		*
************************************************************************/
CAttackRound::CAttackRound(CBattleEntity* attacker, CBattleEntity* defender)
{
    m_attacker = attacker;
    m_defender = defender;
    m_kickAttackOccured = false;
    m_sataOccured = false;
    m_subWeaponType = 0;

    if (attacker->m_Weapons[SLOT_SUB]->isType(ITEM_WEAPON))
    {
        m_subWeaponType = attacker->m_Weapons[SLOT_SUB]->getDmgType();
    }

    // Grab a trick attack assistant.
    m_taEntity = battleutils::getAvailableTrickAttackChar(attacker, attacker->GetBattleTarget());

    // Build main weapon attacks.
    CreateAttacks(attacker->m_Weapons[SLOT_MAIN], RIGHTATTACK);

    // Build dual wield off hand weapon attacks.


    if (IsH2H())
    {
        // Build left hand H2H attacks.
        CreateAttacks(attacker->m_Weapons[SLOT_MAIN], LEFTATTACK);

        // Build kick attacks.
        CreateKickAttacks();
    }
    else if ((m_subWeaponType > 0 && m_subWeaponType < 4) ||
        attacker->objtype == TYPE_MOB && static_cast<CMobEntity*>(attacker)->getMobMod(MOBMOD_DUAL_WIELD))
    {
        CreateAttacks(attacker->m_Weapons[SLOT_SUB], LEFTATTACK);
    }

    // Set the first attack flag
    m_attackSwings[0].SetAsFirstSwing();

    // Delete the haste samba effect.
    attacker->StatusEffectContainer->DelStatusEffect(EFFECT_HASTE_SAMBA_HASTE);

    // Clear the action list.
    attacker->m_ActionList.clear();
}

/************************************************************************
*																		*
*  Destructor.															*
*																		*
************************************************************************/
CAttackRound::~CAttackRound()
{

}

/************************************************************************
*																		*
*  Returns the attack swing count.										*
*																		*
************************************************************************/
uint8 CAttackRound::GetAttackSwingCount()
{
    return m_attackSwings.size();
}

/************************************************************************
*																		*
*  Returns an attack via index.											*
*																		*
************************************************************************/
CAttack& CAttackRound::GetAttack(uint8 index)
{
    return m_attackSwings[index];
}

/************************************************************************
*																		*
*  Returns the current attack.											*
*																		*
************************************************************************/
CAttack& CAttackRound::GetCurrentAttack()
{
    return m_attackSwings[0];
}

/************************************************************************
*																		*
*  Sets the SATA flag.													*
*																		*
************************************************************************/
void CAttackRound::SetSATA(bool value)
{
    m_sataOccured = value;
}

/************************************************************************
*																		*
*  Returns the SATA flag.												*
*																		*
************************************************************************/
bool CAttackRound::GetSATAOccured()
{
    return m_sataOccured;
}

/************************************************************************
*																		*
*  Returns the TA entity.												*
*																		*
************************************************************************/
CBattleEntity*	CAttackRound::GetTAEntity()
{
    return m_taEntity;
}

/************************************************************************
*																		*
*  Returns the H2H flag.												*
*																		*
************************************************************************/
bool CAttackRound::IsH2H()
{
    return m_attacker->m_Weapons[SLOT_MAIN]->getSkillType() == SKILL_H2H ? true : false;
}

/************************************************************************
*																		*
*  Adds an attack swing.												*
*																		*
************************************************************************/
void CAttackRound::AddAttackSwing(PHYSICAL_ATTACK_TYPE type, PHYSICAL_ATTACK_DIRECTION direction, uint8 count)
{
    if (m_attackSwings.size() < MAX_ATTACKS)
    {
        for (uint8 i = 0; i < count; ++i)
        {
            CAttack attack(m_attacker, m_defender, type, direction, this);
            m_attackSwings.push_back(attack);

            if (m_attackSwings.size() == MAX_ATTACKS)
            {
                return;
            }
        }
    }
}

/************************************************************************
*																		*
*  Deletes the first attack in the list.								*
*																		*
************************************************************************/
void CAttackRound::DeleteAttackSwing()
{
    m_attackSwings.erase(m_attackSwings.begin());
}

/************************************************************************
*                                                                       *
*  Creates up to many attacks for a particular hand.			        *
*                                                                       *
************************************************************************/
void CAttackRound::CreateAttacks(CItemWeapon* PWeapon, PHYSICAL_ATTACK_DIRECTION direction)
{
    uint8 num = 1;

    // Checking the players weapon hit count
    if (PWeapon->getReqLvl() <= m_attacker->GetMLevel())
    {
        num = PWeapon->getHitCount();
    }

    AddAttackSwing(ATTACK_NORMAL, direction, num);

    // Checking the players triple, double and quadruple attack
    int16 tripleAttack = m_attacker->getMod(MOD_TRIPLE_ATTACK);
    int16 doubleAttack = m_attacker->getMod(MOD_DOUBLE_ATTACK);
    int16 quadAttack = m_attacker->getMod(MOD_QUAD_ATTACK);

    //check for merit upgrades
    if (m_attacker->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)m_attacker;

        //merit chance only applies if player has the job trait
        if (charutils::hasTrait(PChar, TRAIT_TRIPLE_ATTACK)) tripleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_TRIPLE_ATTACK_RATE, PChar);
        if (charutils::hasTrait(PChar, TRAIT_DOUBLE_ATTACK)) doubleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_DOUBLE_ATTACK_RATE, PChar);
        // TODO: Quadruple attack merits when SE release them.
    }

    quadAttack = dsp_cap(quadAttack, 0, 100);
    doubleAttack = dsp_cap(doubleAttack, 0, 100);
    tripleAttack = dsp_cap(tripleAttack, 0, 100);

    // Checking Mikage Effect - Hits Vary With Num of Utsusemi Shadows for Main Weapon
    if (m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIKAGE) && m_attacker->m_Weapons[SLOT_MAIN]->getID() == PWeapon->getID())
    {
        int16 shadows = m_attacker->getMod(MOD_UTSUSEMI);
        //ShowDebug(CL_CYAN"Create Attacks: Mikage Active, Rolling Attack Chance for %d Shadowss...\n" CL_RESET, shadows);
        AddAttackSwing(ATTACK_NORMAL, direction, shadows);
    }
    else if (num == 1 && dsprand::GetRandomNumber(100) < quadAttack)
        AddAttackSwing(QUAD_ATTACK, direction, 3);

    else if (num == 1 && dsprand::GetRandomNumber(100) < tripleAttack)
        AddAttackSwing(TRIPLE_ATTACK, direction, 2);

    else if (num == 1 && dsprand::GetRandomNumber(100) < doubleAttack)
        AddAttackSwing(DOUBLE_ATTACK, direction, 1);

    // Ammo extra swing - players only
    if (m_attacker->objtype == TYPE_PC && m_attacker->getMod(MOD_AMMO_SWING) > 0)
    {
        // Check for ammo
        CCharEntity* PChar = (CCharEntity*)m_attacker;
        CItemArmor* PAmmo = PChar->getEquip(SLOT_AMMO);
        CItemArmor* PMain = PChar->getEquip(SLOT_MAIN);
        CItemArmor* PSub = PChar->getEquip(SLOT_SUB);
        uint8 slot = PChar->equip[SLOT_AMMO];
        uint8 loc = PChar->equipLoc[SLOT_AMMO];
        uint8 ammoCount = 0;

        // Handedness check, checking mod of the weapon for the purposes of level scaling
        if (battleutils::GetScaledItemModifier(PChar, PMain, MOD_AMMO_SWING_TYPE) == 2 &&
            dsprand::GetRandomNumber(100) < m_attacker->getMod(MOD_AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
        {
            AddAttackSwing(ATTACK_NORMAL, direction, 1);
            ammoCount += 1;
        }
        else
        {
            if (direction == RIGHTATTACK && battleutils::GetScaledItemModifier(PChar, PMain, MOD_AMMO_SWING_TYPE) == 1 &&
                dsprand::GetRandomNumber(100) < m_attacker->getMod(MOD_AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
            {
                AddAttackSwing(ATTACK_NORMAL, RIGHTATTACK, 1);
                ammoCount += 1;
            }
            if (direction == LEFTATTACK && PSub != nullptr && battleutils::GetScaledItemModifier(PChar, PSub, MOD_AMMO_SWING_TYPE) == 1 &&
                dsprand::GetRandomNumber(100) < m_attacker->getMod(MOD_AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
            {
                AddAttackSwing(ATTACK_NORMAL, LEFTATTACK, 1);
                ammoCount += 1;
            }
        }

        if (PAmmo != nullptr)
        {
            if (PAmmo->getQuantity() == ammoCount)
            {
                charutils::UnequipItem(PChar, SLOT_AMMO);
                charutils::SaveCharEquip(PChar);
            }
            charutils::UpdateItem(PChar, loc, slot, -ammoCount);
            PChar->pushPacket(new CInventoryFinishPacket());
        }
    }


    // TODO: Possible Lua function for the nitty gritty stuff below.

    // Iga mod: Extra attack chance whilst dual wield is on.
    if (direction == LEFTATTACK && dsprand::GetRandomNumber(100) < m_attacker->getMod(MOD_EXTRA_DUAL_WIELD_ATTACK))
        AddAttackSwing(ATTACK_NORMAL, RIGHTATTACK, 1);

}

/************************************************************************
*                                                                       *
*  Creates kick attacks.										        *
*                                                                       *
************************************************************************/
void CAttackRound::CreateKickAttacks()
{
    if (m_attacker->objtype == TYPE_PC)
    {
        // kick attack mod (All jobs)
        uint16 kickAttack = m_attacker->getMod(MOD_KICK_ATTACK);

        if (m_attacker->GetMJob() == JOB_MNK) // MNK (Main job)
        {
            kickAttack += ((CCharEntity*)m_attacker)->PMeritPoints->GetMeritValue(MERIT_KICK_ATTACK_RATE, (CCharEntity*)m_attacker);
        }

        kickAttack = dsp_cap(kickAttack, 0, 100);

        if (dsprand::GetRandomNumber(100) < kickAttack)
        {
            AddAttackSwing(KICK_ATTACK, RIGHTATTACK, 1);
            m_kickAttackOccured = true;
        }

        // TODO: Possible Lua function for the nitty gritty stuff below.

        // Mantra set mod: Try an extra left kick attack.
        if (m_kickAttackOccured && dsprand::GetRandomNumber(100) < m_attacker->getMod(MOD_EXTRA_KICK_ATTACK))
        {
            AddAttackSwing(KICK_ATTACK, LEFTATTACK, 1);
        }
    }
}