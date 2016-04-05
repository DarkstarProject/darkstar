﻿/*
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

#include "../../common/showmsg.h"
#include "../../common/utils.h"

#include "battleentity.h"

#include "../lua/luautils.h"
#include "../alliance.h"
#include "../utils/battleutils.h"
#include "../items/item_weapon.h"
#include "../status_effect_container.h"
#include "../ai/ai_container.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/death_state.h"
#include "../ai/states/raise_state.h"
#include "../ai/states/inactive_state.h"
#include "../ai/states/weaponskill_state.h"
#include "../attackround.h"
#include "../weapon_skill.h"
#include "../packets/action.h"

CBattleEntity::CBattleEntity()
{
    m_OwnerID.clean();
    m_ModelSize = 3; // неправильная инициализация, она приведет к тому, что заклинания станут читаться на 3 дальше
    m_mlvl = 0;
    m_slvl = 0;

    m_mjob = JOB_WAR;
    m_sjob = JOB_WAR;
    m_enmityRange = 25;

    m_magicEvasion = 0;

    m_Weapons[SLOT_MAIN] = new CItemWeapon(0);
    m_Weapons[SLOT_SUB] = new CItemWeapon(0);
    m_Weapons[SLOT_RANGED] = new CItemWeapon(0);
    m_Weapons[SLOT_AMMO] = new CItemWeapon(0);

    memset(&stats, 0, sizeof(stats));
    memset(&health, 0, sizeof(health));

    memset(&WorkingSkills, 0, sizeof(WorkingSkills));

    PPet = nullptr;
    PParty = nullptr;
    PMaster = nullptr;

    StatusEffectContainer = new CStatusEffectContainer(this);

    m_modStat[MOD_SLASHRES] = 1000;
    m_modStat[MOD_PIERCERES] = 1000;
    m_modStat[MOD_HTHRES] = 1000;
    m_modStat[MOD_IMPACTRES] = 1000;

    m_Immunity = 0;
    isCharmed = false;
    m_unkillable = false;
}

CBattleEntity::~CBattleEntity()
{
    delete StatusEffectContainer;
}

bool CBattleEntity::isDead()
{
    return (health.hp <= 0 || status == STATUS_DISAPPEAR || PAI->IsCurrentState<CDeathState>());
}

bool CBattleEntity::isAlive()
{
    return !isDead();
}

bool CBattleEntity::isInDynamis()
{
    if (loc.zone != nullptr) {
        return loc.zone->GetType() == ZONETYPE_DYNAMIS;
    }
    return false;
}

// return true if the mob has immunity
bool CBattleEntity::hasImmunity(uint32 imID)
{
    if (objtype == TYPE_MOB || objtype == TYPE_PET) {
        IMMUNITY mobImmunity = (IMMUNITY)imID;
        return (m_Immunity & mobImmunity);
    }
    return false;
}

bool CBattleEntity::isAsleep()
{
    return PAI->IsCurrentState<CInactiveState>();
}

/************************************************************************
*                                                                       *
*  Пересчитываем максимальные значения hp и mp с учетом модификаторов   *
*                                                                       *
************************************************************************/

void CBattleEntity::UpdateHealth()
{
    int32 dif = (getMod(MOD_CONVMPTOHP) - getMod(MOD_CONVHPTOMP));

    health.modmp = ((health.maxmp) * (100 + getMod(MOD_MPP)) / 100) + dsp_min((health.maxmp * m_modStat[MOD_FOOD_MPP] / 100), m_modStat[MOD_FOOD_MP_CAP]) + getMod(MOD_MP);
    health.modhp = ((health.maxhp) * (100 + getMod(MOD_HPP)) / 100) + dsp_min((health.maxhp * m_modStat[MOD_FOOD_HPP] / 100), m_modStat[MOD_FOOD_HP_CAP]) + getMod(MOD_HP);

    dif = (health.modmp - 0) < dif ? (health.modmp - 0) : dif;
    dif = (health.modhp - 1) < -dif ? -(health.modhp - 1) : dif;

    health.modhp += dif;
    health.modmp -= dif;

    if (objtype == TYPE_PC)
    {
        health.modhp = dsp_cap(health.modhp, 0, 9999);
        health.modmp = dsp_cap(health.modmp, 0, 9999);
    }

    health.hp = dsp_cap(health.hp, 0, health.modhp);
    health.mp = dsp_cap(health.mp, 0, health.modmp);

    updatemask |= UPDATE_HP;
}

/************************************************************************
*                                                                       *
*  Получаем текущее количество очков жизней                             *
*                                                                       *
************************************************************************/

uint8 CBattleEntity::GetHPP()
{
    return (uint8)ceil(((float)health.hp / (float)GetMaxHP()) * 100);
}

int32 CBattleEntity::GetMaxHP()
{
    return health.modhp;
}

/************************************************************************
*                                                                       *
*  Получаем текущее количество очков маны                               *
*                                                                       *
************************************************************************/

uint8 CBattleEntity::GetMPP()
{
    return (uint8)ceil(((float)health.mp / (float)GetMaxMP()) * 100);
}

int32 CBattleEntity::GetMaxMP()
{
    return health.modmp;
}

/************************************************************************
*                                                                       *
*  Скорость перемещения с учетом модификаторов                          *
*                                                                       *
************************************************************************/

uint8 CBattleEntity::GetSpeed()
{
    return (animation == ANIMATION_CHOCOBO ? 40 + map_config.speed_mod : dsp_cap(speed * (100 + getMod(MOD_MOVE)) / 100, UINT8_MIN, UINT8_MAX));
}

bool CBattleEntity::CanRest()
{
    return !getMod(MOD_REGEN_DOWN) && !StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_NO_REST);
}

bool CBattleEntity::Rest(float rate)
{
    if (health.hp != health.maxhp || health.mp != health.maxmp) {
        // recover 20% HP
        uint32 recoverHP = (float)health.maxhp*rate;
        uint32 recoverMP = (float)health.maxmp*rate;
        addHP(recoverHP);
        addMP(recoverMP);

        // lower TP
        addTP(rate*-500);
        return true;
    }

    return false;
}

int16 CBattleEntity::GetWeaponDelay(bool tp)
{
    if (StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS) && !tp)
    {
        return 1700;
    }
    uint16 MinimumDelay = m_Weapons[SLOT_MAIN]->getDelay(); // Track base delay.  We will need this later.  MOD_DELAY is ignored for now.
    uint16 WeaponDelay = m_Weapons[SLOT_MAIN]->getDelay() - getMod(MOD_DELAY);
    if (m_Weapons[SLOT_MAIN]->getSkillType() == SKILL_H2H)
    {
        if (!StatusEffectContainer->HasStatusEffect(EFFECT_FOOTWORK))
        {
            WeaponDelay -= getMod(MOD_MARTIAL_ARTS) * 1000 / 60;
        }
    }
    else if (m_Weapons[SLOT_SUB]->getDmgType() > 0 &&
             m_Weapons[SLOT_SUB]->getDmgType() < 4)
    {
        MinimumDelay += m_Weapons[SLOT_SUB]->getDelay();
        WeaponDelay += m_Weapons[SLOT_SUB]->getDelay();
        //apply dual wield delay reduction
        WeaponDelay = WeaponDelay * ((100.0f - (float)getMod(MOD_DUAL_WIELD)) / 100.0f);
    }

    //apply haste and delay reductions that don't affect tp
    if (!tp)
    {
        // Cap haste at appropriate levels.
        int16 hasteMagic = (getMod(MOD_HASTE_MAGIC) > 448) ? 448 : getMod(MOD_HASTE_MAGIC);
        int16 hasteAbility = (getMod(MOD_HASTE_ABILITY) > 256) ? 256 : getMod(MOD_HASTE_ABILITY);
        int16 hasteGear = (getMod(MOD_HASTE_GEAR) > 256) ? 256 : getMod(MOD_HASTE_GEAR);
        WeaponDelay = WeaponDelay * ((float)(1024 - hasteMagic - hasteAbility - hasteGear) / 1024);
    }
    WeaponDelay = WeaponDelay * ((float)(100 + getMod(MOD_DELAYP)) / 100);

    // Global delay reduction cap of "about 80%" being enforced.
    // This should be enforced on -delay equipment, martial arts, dual wield, and haste, hence MinimumDelay * 0.2.
    // TODO: Could be converted to value/1024 if the exact cap is ever determined.
    MinimumDelay -= (MinimumDelay * 0.8);
    WeaponDelay = (WeaponDelay < MinimumDelay) ? MinimumDelay : WeaponDelay;
    return WeaponDelay;
}

int16 CBattleEntity::GetRangedWeaponDelay(bool tp)
{
    CItemWeapon* PRange = (CItemWeapon*)m_Weapons[SLOT_RANGED];
    CItemWeapon* PAmmo = (CItemWeapon*)m_Weapons[SLOT_AMMO];

    // base delay
    int delay = 240;

    if (PRange != nullptr && PRange->getDamage() != 0) {
        delay += ((PRange->getDelay() * 60) / 1000);
    }

    delay = (((delay - getMod(MOD_RANGED_DELAY)) * 1000) / 120);

    //apply haste and delay reductions that don't affect tp
    if (!tp)
    {
        delay = delay * ((float)(100 + getMod(MOD_RANGED_DELAYP)) / 100);
    }
    else if (PAmmo)
    {
        delay += ((PAmmo->getDelay() * 60) / 1000);
    }
    return delay;
}

int16 CBattleEntity::GetAmmoDelay()
{
    CItemWeapon* PAmmo = (CItemWeapon*)m_Weapons[SLOT_AMMO];

    int delay = 240;
    if (PAmmo != nullptr && PAmmo->getDamage() != 0) {
        delay += ((PAmmo->getDelay() * 60) / 1000);
    }

    delay = ((delay * 1000) / 120);
    return delay;
}

uint16 CBattleEntity::GetMainWeaponDmg()
{
    if (m_Weapons[SLOT_MAIN])
    {
        if ((m_Weapons[SLOT_MAIN]->getReqLvl() > GetMLevel()) && objtype == TYPE_PC)
        {
            uint16 dmg = m_Weapons[SLOT_MAIN]->getDamage();
            dmg *= GetMLevel() * 3;
            dmg /= 4;
            dmg /= m_Weapons[SLOT_MAIN]->getReqLvl();
            return dmg + getMod(MOD_MAIN_DMG_RATING);
        }
        else
            return m_Weapons[SLOT_MAIN]->getDamage() + getMod(MOD_MAIN_DMG_RATING);
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return 0;
}

uint16 CBattleEntity::GetSubWeaponDmg()
{
    if (m_Weapons[SLOT_SUB])
    {
        if ((m_Weapons[SLOT_SUB]->getReqLvl() > GetMLevel()) && objtype == TYPE_PC)
        {
            uint16 dmg = m_Weapons[SLOT_SUB]->getDamage();
            dmg *= GetMLevel() * 3;
            dmg /= 4;
            dmg /= m_Weapons[SLOT_SUB]->getReqLvl();
            return dmg + getMod(MOD_SUB_DMG_RATING);
        }
        else
            return m_Weapons[SLOT_SUB]->getDamage() + getMod(MOD_SUB_DMG_RATING);
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return 0;
}

uint16 CBattleEntity::GetRangedWeaponDmg()
{
    uint16 dmg = 0;
    if (m_Weapons[SLOT_RANGED])
    {
        if ((m_Weapons[SLOT_RANGED]->getReqLvl() > GetMLevel()) && objtype == TYPE_PC)
        {
            uint16 scaleddmg = m_Weapons[SLOT_RANGED]->getDamage();
            scaleddmg *= GetMLevel() * 3;
            scaleddmg /= 4;
            scaleddmg /= m_Weapons[SLOT_RANGED]->getReqLvl();
            dmg += scaleddmg;
        }
        else
            dmg += m_Weapons[SLOT_RANGED]->getDamage();
    }
    if (m_Weapons[SLOT_AMMO])
    {
        if ((m_Weapons[SLOT_AMMO]->getReqLvl() > GetMLevel()) && objtype == TYPE_PC)
        {
            uint16 scaleddmg = m_Weapons[SLOT_AMMO]->getDamage();
            scaleddmg *= GetMLevel() * 3;
            scaleddmg /= 4;
            scaleddmg /= m_Weapons[SLOT_AMMO]->getReqLvl();
            dmg += scaleddmg;
        }
        else
            dmg += m_Weapons[SLOT_AMMO]->getDamage();
    }
    return dmg + getMod(MOD_RANGED_DMG_RATING);
}

uint16 CBattleEntity::GetMainWeaponRank()
{
    if (m_Weapons[SLOT_MAIN])
    {
        return (m_Weapons[SLOT_MAIN]->getDamage() + getMod(MOD_MAIN_DMG_RANK)) / 9;
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return 0;
}

uint16 CBattleEntity::GetSubWeaponRank()
{
    if (m_Weapons[SLOT_SUB])
    {
        return (m_Weapons[SLOT_SUB]->getDamage() + getMod(MOD_SUB_DMG_RANK)) / 9;
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return 0;
}

uint16 CBattleEntity::GetRangedWeaponRank()
{
    if (m_Weapons[SLOT_RANGED])
    {
        return (m_Weapons[SLOT_RANGED]->getDamage() + getMod(MOD_RANGED_DMG_RANK)) / 9;
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return 0;
}

/************************************************************************
*                                                                       *
*  Изменяем количество TP сущности	                                    *
*                                                                       *
************************************************************************/

int16 CBattleEntity::addTP(int16 tp)
{
    // When adding TP, we must adjust for Inhibit TP effect, which reduces TP gain.
    if (tp > 0)
    {
        float tpReducePercent = this->getMod(MOD_INHIBIT_TP) / 100;
        tp = tp - (tp * tpReducePercent);

        float TPMulti = 1.0;

        if (objtype == TYPE_PC)
        {
            TPMulti = map_config.player_tp_multiplier;
        }
        else if (objtype == TYPE_MOB)
        {
            TPMulti = map_config.mob_tp_multiplier;
        }
        else if (objtype == TYPE_PET)
        {
            TPMulti = map_config.mob_tp_multiplier * 3;
        }

        tp = tp * TPMulti;
    }
    if (tp != 0)
    {
        updatemask |= UPDATE_HP;
    }
    int16 cap = dsp_cap(health.tp + tp, 0, 3000);
    tp = health.tp - cap;
    health.tp = cap;
    return abs(tp);
}

/************************************************************************
*																		*
*  Изменяем количество жизней сущности									*
*																		*
************************************************************************/

int32 CBattleEntity::addHP(int32 hp)
{
    if (health.hp == 0 && hp < 0) {
        return 0; //if the entity is already dead, skip the rest to prevent killing it again
    }

    int32 cap = dsp_cap(health.hp + hp, 0, GetMaxHP());
    hp = health.hp - cap;
    health.hp = cap;

    // если количество жизней достигает нуля, то сущность умирает

    if (hp > 0)
    {
        battleutils::MakeEntityStandUp(this);
    }

    if (hp != 0)
    {
        updatemask |= UPDATE_HP;
    }

    if (health.hp == 0 && m_unkillable)
    {
        health.hp = 1;
    }

    return abs(hp);
}

int32 CBattleEntity::addMP(int32 mp)
{
    int32 cap = dsp_cap(health.mp + mp, 0, GetMaxMP());
    mp = health.mp - cap;
    health.mp = cap;
    if (mp != 0)
    {
        updatemask |= UPDATE_HP;
    }
    return abs(mp);
}

/************************************************************************
*                                                                       *
*  Полные значения характеристик боевой сущности                        *
*                                                                       *
************************************************************************/

uint16 CBattleEntity::STR()
{
    return dsp_cap(stats.STR + m_modStat[MOD_STR], 0, 999);
}

uint16 CBattleEntity::DEX()
{
    return dsp_cap(stats.DEX + m_modStat[MOD_DEX], 0, 999);
}

uint16 CBattleEntity::VIT()
{
    return dsp_cap(stats.VIT + m_modStat[MOD_VIT], 0, 999);
}

uint16 CBattleEntity::AGI()
{
    return dsp_cap(stats.AGI + m_modStat[MOD_AGI], 0, 999);
}

uint16 CBattleEntity::INT()
{
    return dsp_cap(stats.INT + m_modStat[MOD_INT], 0, 999);
}

uint16 CBattleEntity::MND()
{
    return dsp_cap(stats.MND + m_modStat[MOD_MND], 0, 999);
}

uint16 CBattleEntity::CHR()
{
    return dsp_cap(stats.CHR + m_modStat[MOD_CHR], 0, 999);
}

uint16 CBattleEntity::ATT()
{
    //TODO: consider which weapon!
    int32 ATT = 8 + m_modStat[MOD_ATT];
    if (m_Weapons[SLOT_MAIN]->isTwoHanded())
    {
        ATT += (STR() * 3) / 4;
    }
    else {
        ATT += (STR()) / 2;
    }

    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_ENDARK))
        ATT += this->getMod(MOD_ENSPELL_DMG);

    if (this->objtype & TYPE_PC) {
        ATT += GetSkill(m_Weapons[SLOT_MAIN]->getSkillType()) + m_Weapons[SLOT_MAIN]->getILvlSkill();
    }
    else if (this->objtype == TYPE_PET && ((CPetEntity*)this)->getPetType() == PETTYPE_AUTOMATON)
    {
        ATT += PMaster->GetSkill(SKILL_AME);
        return ATT + (ATT * (m_modStat[MOD_ATTP] + ((CCharEntity*)PMaster)->PMeritPoints->GetMeritValue(MERIT_OPTIMIZATION, (CCharEntity*)PMaster)) / 100) +
            dsp_min((ATT * m_modStat[MOD_FOOD_ATTP] / 100), m_modStat[MOD_FOOD_ATT_CAP]);
    }
    return ATT + (ATT * m_modStat[MOD_ATTP] / 100) +
        dsp_min((ATT * m_modStat[MOD_FOOD_ATTP] / 100), m_modStat[MOD_FOOD_ATT_CAP]);
}

uint16 CBattleEntity::RATT(uint8 skill, uint16 bonusSkill)
{
    auto PWeakness = StatusEffectContainer->GetStatusEffect(EFFECT_WEAKNESS);
    if (PWeakness && PWeakness->GetPower() >= 2)
    {
        return 0;
    }
    int32 ATT = 8 + GetSkill(skill) + bonusSkill + m_modStat[MOD_RATT] + battleutils::GetRangedAttackBonuses(this) + STR() / 2;

    if (this->objtype == TYPE_PET && ((CPetEntity*)this)->getPetType() == PETTYPE_AUTOMATON)
    {
        return ATT + (ATT * (m_modStat[MOD_ATTP] + ((CCharEntity*)PMaster)->PMeritPoints->GetMeritValue(MERIT_OPTIMIZATION, (CCharEntity*)PMaster)) / 100) +
            dsp_min((ATT * m_modStat[MOD_FOOD_ATTP] / 100), m_modStat[MOD_FOOD_ATT_CAP]);
    }

    return ATT + (ATT * m_modStat[MOD_RATTP] / 100) +
        dsp_min((ATT * m_modStat[MOD_FOOD_RATTP] / 100), m_modStat[MOD_FOOD_RATT_CAP]);
}

uint16 CBattleEntity::RACC(uint8 skill, uint16 bonusSkill)
{
    auto PWeakness = StatusEffectContainer->GetStatusEffect(EFFECT_WEAKNESS);
    if (PWeakness && PWeakness->GetPower() >= 2)
    {
        return 0;
    }
    int skill_level = GetSkill(skill) + bonusSkill;
    uint16 acc = skill_level;
    if (skill_level > 200)
    {
        acc = 200 + (skill_level - 200)*0.9;
    }
    acc += getMod(MOD_RACC);
    acc += battleutils::GetRangedAccuracyBonuses(this);
    acc += AGI() / 2;
    if (this->objtype == TYPE_PET && ((CPetEntity*)this)->getPetType() == PETTYPE_AUTOMATON)
    {
        acc += ((CCharEntity*)PMaster)->PMeritPoints->GetMeritValue(MERIT_FINE_TUNING, (CCharEntity*)PMaster);
    }

    return acc + dsp_min(((100 + getMod(MOD_FOOD_RACCP)) * acc) / 100, getMod(MOD_FOOD_RACC_CAP));
}

uint16 CBattleEntity::ACC(uint8 attackNumber, uint8 offsetAccuracy)
{
    if (this->objtype & TYPE_PC) {
        uint8 skill = 0;
        uint16 iLvlSkill = 0;
        if (attackNumber == 0)
        {
            skill = m_Weapons[SLOT_MAIN]->getSkillType();
            iLvlSkill = m_Weapons[SLOT_MAIN]->getILvlSkill();
            if (skill == SKILL_NON && GetSkill(SKILL_H2H) > 0)
                skill = SKILL_H2H;
        }
        else if (attackNumber == 1)
        {
            skill = m_Weapons[SLOT_SUB]->getSkillType();
            iLvlSkill = m_Weapons[SLOT_SUB]->getILvlSkill();
            if (skill == SKILL_NON && GetSkill(SKILL_H2H) > 0 &&
                (m_Weapons[SLOT_MAIN]->getSkillType() == SKILL_NON || m_Weapons[SLOT_MAIN]->getSkillType() == SKILL_H2H))
                skill = SKILL_H2H;
        }
        else if (attackNumber == 2)
        {
            iLvlSkill = m_Weapons[SLOT_MAIN]->getILvlSkill();
            skill = SKILL_H2H;
        }
        int16 ACC = GetSkill(skill) + iLvlSkill;
        ACC = (ACC > 200 ? (((ACC - 200)*0.9) + 200) : ACC);
        if (m_Weapons[SLOT_MAIN]->isTwoHanded() == true)
        {
            ACC += DEX() * 0.75;
        }
        else
        {
            ACC += DEX() * 0.5;
        }
        ACC = (ACC + m_modStat[MOD_ACC] + offsetAccuracy);
        ACC = ACC + dsp_min((ACC * m_modStat[MOD_FOOD_ACCP] / 100), m_modStat[MOD_FOOD_ACC_CAP]);
        return dsp_max(0, ACC);
    }
    else if (this->objtype == TYPE_PET && ((CPetEntity*)this)->getPetType() == PETTYPE_AUTOMATON)
    {
        int16 ACC = PMaster->GetSkill(SKILL_AME);
        ACC = (ACC > 200 ? (((ACC - 200)*0.9) + 200) : ACC);
        ACC += DEX() * 0.5;
        ACC += m_modStat[MOD_ACC] + offsetAccuracy + ((CCharEntity*)PMaster)->PMeritPoints->GetMeritValue(MERIT_FINE_TUNING, (CCharEntity*)PMaster);
        ACC = ACC + dsp_min((ACC * m_modStat[MOD_FOOD_ACCP] / 100), m_modStat[MOD_FOOD_ACC_CAP]);
        return dsp_max(0, ACC);
    }
    else
    {
        int16 ACC = m_modStat[MOD_ACC];
        ACC = ACC + dsp_min((ACC * m_modStat[MOD_FOOD_ACCP] / 100), m_modStat[MOD_FOOD_ACC_CAP]) + DEX() / 2; //food mods here for Snatch Morsel
        return dsp_max(0, ACC);
    }
}

uint16 CBattleEntity::DEF()
{
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_COUNTERSTANCE, 0)) {
        return VIT() / 2 + 1;
    }
    int32 DEF = 8 + m_modStat[MOD_DEF] + VIT() / 2;

    return DEF + (DEF * m_modStat[MOD_DEFP] / 100) +
        dsp_min((DEF * m_modStat[MOD_FOOD_DEFP] / 100), m_modStat[MOD_FOOD_DEF_CAP]);
}

uint16 CBattleEntity::EVA()
{
    int16 evasion = GetSkill(SKILL_EVA);

    if (evasion > 200) { //Evasion skill is 0.9 evasion post-200
        evasion = 200 + (evasion - 200)*0.9;
    }
    return dsp_max(0, (m_modStat[MOD_EVA] + evasion + AGI() / 2));
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

JOBTYPE CBattleEntity::GetMJob()
{
    return m_mjob;
}

uint8 CBattleEntity::GetMLevel()
{
    return m_mlvl;
}

JOBTYPE CBattleEntity::GetSJob()
{
    return m_sjob;
}

uint8 CBattleEntity::GetSLevel()
{
    if (StatusEffectContainer->HasStatusEffect(EFFECT_OBLIVISCENCE)) { return 0; }
    return m_slvl;
}

void CBattleEntity::SetMJob(uint8 mjob)
{
    DSP_DEBUG_BREAK_IF(mjob == 0 || mjob >= MAX_JOBTYPE);	// выход за пределы доступных профессий

    m_mjob = (JOBTYPE)mjob;
}

void CBattleEntity::SetSJob(uint8 sjob)
{
    DSP_DEBUG_BREAK_IF(sjob >= MAX_JOBTYPE);				// выход за пределы доступных профессий

    m_sjob = (JOBTYPE)sjob;
}

void CBattleEntity::SetMLevel(uint8 mlvl)
{
    m_modStat[MOD_DEF] -= m_mlvl + dsp_cap(m_mlvl - 50, 0, 10);
    m_mlvl = (mlvl == 0 ? 1 : mlvl);
    m_modStat[MOD_DEF] += m_mlvl + dsp_cap(m_mlvl - 50, 0, 10);

    if (this->objtype & TYPE_PC)
        Sql_Query(SqlHandle, "UPDATE char_stats SET mlvl = %u WHERE charid = %u LIMIT 1;", m_mlvl, this->id);
}

void CBattleEntity::SetSLevel(uint8 slvl)
{
    m_slvl = (slvl > (m_mlvl >> 1) ? (m_mlvl == 1 ? 1 : (m_mlvl >> 1)) : slvl);

    if (this->objtype & TYPE_PC)
        Sql_Query(SqlHandle, "UPDATE char_stats SET slvl = %u WHERE charid = %u LIMIT 1;", m_slvl, this->id);
}

/************************************************************************
*																		*
*  Добавляем модификатор												*
*																		*
************************************************************************/

void CBattleEntity::addModifier(uint16 type, int16 amount)
{
    m_modStat[type] += amount;
}

/************************************************************************
*																		*
*  Добавляем модификаторы												*
*																		*
************************************************************************/

void CBattleEntity::addModifiers(std::vector<CModifier*> *modList)
{
    for (auto modifier : *modList)
    {
        m_modStat[modifier->getModID()] += modifier->getModAmount();
    }
}

void CBattleEntity::addEquipModifiers(std::vector<CModifier*> *modList, uint8 itemLevel, uint8 slotid)
{
    if (GetMLevel() >= itemLevel)
    {
        for (uint16 i = 0; i < modList->size(); ++i)
        {
            if (slotid == SLOT_SUB)
            {
                if (modList->at(i)->getModID() == MOD_MAIN_DMG_RANK)
                {
                    m_modStat[MOD_SUB_DMG_RANK] += modList->at(i)->getModAmount();
                }
                else
                {
                    m_modStat[modList->at(i)->getModID()] += modList->at(i)->getModAmount();
                }
            }
            else
            {
                m_modStat[modList->at(i)->getModID()] += modList->at(i)->getModAmount();
            }
        }
    }
    else
    {
        for (uint16 i = 0; i < modList->size(); ++i)
        {
            int16 modAmount = GetMLevel() * modList->at(i)->getModAmount();
            switch (modList->at(i)->getModID())
            {
                case MOD_DEF:
                case MOD_MAIN_DMG_RATING:
                case MOD_SUB_DMG_RATING:
                case MOD_RANGED_DMG_RATING:
                    modAmount *= 3;
                    modAmount /= 4;
                    break;
                case MOD_HP:
                case MOD_MP:
                    modAmount /= 2;
                    break;
                case MOD_STR:
                case MOD_DEX:
                case MOD_VIT:
                case MOD_AGI:
                case MOD_INT:
                case MOD_MND:
                case MOD_CHR:
                case MOD_ATT:
                case MOD_RATT:
                case MOD_ACC:
                case MOD_RACC:
                case MOD_MATT:
                case MOD_MACC:
                    modAmount /= 3;
                    break;
                default:
                    modAmount = 0;
                    break;
            }
            modAmount /= itemLevel;
            if (slotid == SLOT_SUB)
            {
                if (modList->at(i)->getModID() == MOD_MAIN_DMG_RANK)
                {
                    m_modStat[MOD_SUB_DMG_RANK] += modAmount;
                }
                else
                {
                    m_modStat[modList->at(i)->getModID()] += modAmount;
                }
            }
            else
            {
                m_modStat[modList->at(i)->getModID()] += modAmount;
            }
        }
    }
}

/************************************************************************
*																		*
*  Устанавливаем модификатор											*
*																		*
************************************************************************/

void CBattleEntity::setModifier(uint16 type, int16 amount)
{
    m_modStat[type] = amount;
}

/************************************************************************
*																		*
*  Устанавливаем модификаторы											*
*																		*
************************************************************************/

void CBattleEntity::setModifiers(std::vector<CModifier*> *modList)
{
    for (uint16 i = 0; i < modList->size(); ++i)
    {
        m_modStat[modList->at(i)->getModID()] = modList->at(i)->getModAmount();
    }
}

/************************************************************************
*																		*
*  Удаляем модификатор													*
*																		*
************************************************************************/

void CBattleEntity::delModifier(uint16 type, int16 amount)
{
    m_modStat[type] -= amount;
}

void CBattleEntity::saveModifiers()
{
    m_modStatSave = m_modStat;
}

void CBattleEntity::restoreModifiers()
{
    m_modStat = m_modStatSave;
}

/************************************************************************
*																		*
*  Удаляем модификаторы													*
*																		*
************************************************************************/

void CBattleEntity::delModifiers(std::vector<CModifier*> *modList)
{
    for (uint16 i = 0; i < modList->size(); ++i)
    {
        m_modStat[modList->at(i)->getModID()] -= modList->at(i)->getModAmount();
    }
}

void CBattleEntity::delEquipModifiers(std::vector<CModifier*> *modList, uint8 itemLevel, uint8 slotid)
{
    if (GetMLevel() >= itemLevel)
    {
        for (uint16 i = 0; i < modList->size(); ++i)
        {
            if (slotid == SLOT_SUB)
            {
                if (modList->at(i)->getModID() == MOD_MAIN_DMG_RANK)
                {
                    m_modStat[MOD_SUB_DMG_RANK] -= modList->at(i)->getModAmount();
                }
                else
                {
                    m_modStat[modList->at(i)->getModID()] -= modList->at(i)->getModAmount();
                }
            }
            else
            {
                m_modStat[modList->at(i)->getModID()] -= modList->at(i)->getModAmount();
            }
        }
    }
    else
    {
        for (uint16 i = 0; i < modList->size(); ++i)
        {
            int16 modAmount = GetMLevel() * modList->at(i)->getModAmount();
            switch (modList->at(i)->getModID())
            {
                case MOD_DEF:
                case MOD_MAIN_DMG_RATING:
                case MOD_SUB_DMG_RATING:
                case MOD_RANGED_DMG_RATING:
                    modAmount *= 3;
                    modAmount /= 4;
                    break;
                case MOD_HP:
                case MOD_MP:
                    modAmount /= 2;
                    break;
                case MOD_STR:
                case MOD_DEX:
                case MOD_VIT:
                case MOD_AGI:
                case MOD_INT:
                case MOD_MND:
                case MOD_CHR:
                case MOD_ATT:
                case MOD_RATT:
                case MOD_ACC:
                case MOD_RACC:
                case MOD_MATT:
                case MOD_MACC:
                    modAmount /= 3;
                    break;
                default:
                    modAmount = 0;
                    break;
            }
            modAmount /= itemLevel;
            if (slotid == SLOT_SUB)
            {
                if (modList->at(i)->getModID() == MOD_MAIN_DMG_RANK)
                {
                    m_modStat[MOD_SUB_DMG_RANK] -= modAmount;
                }
                else
                {
                    m_modStat[modList->at(i)->getModID()] -= modAmount;
                }
            }
            else
            {
                m_modStat[modList->at(i)->getModID()] -= modAmount;
            }
        }
    }
}

/************************************************************************
*																		*
*  Получаем текущее значение указанного модификатора					*
*																		*
************************************************************************/

int16 CBattleEntity::getMod(uint16 modID)
{
    return m_modStat[modID];
}

void CBattleEntity::addPetModifier(uint16 type, int16 amount)
{
    m_petMod[type] += amount;

    if (PPet)
    {
        PPet->addModifier(type, amount);
    }
}

void CBattleEntity::setPetModifier(uint16 type, int16 amount)
{
    m_petMod[type] = amount;

    if (PPet)
    {
        PPet->setModifier(type, amount);
    }
}

void CBattleEntity::delPetModifier(uint16 type, int16 amount)
{
    m_petMod[type] -= amount;

    if (PPet)
    {
        PPet->delModifier(type, amount);
    }
}

void CBattleEntity::addPetModifiers(std::vector<CModifier*> *modList)
{
    for (auto modifier : *modList)
    {
        addPetModifier(modifier->getModID(), modifier->getModAmount());
    }
}

void CBattleEntity::delPetModifiers(std::vector<CModifier*> *modList)
{
    for (auto modifier : *modList)
    {
        delPetModifier(modifier->getModID(), modifier->getModAmount());
    }
}

void CBattleEntity::applyPetModifiers(CPetEntity* PPet)
{
    for (auto mod : m_petMod)
    {
        PPet->addModifier(mod.first, mod.second);
    }
}


void CBattleEntity::removePetModifiers(CPetEntity* PPet)
{
    for (auto mod : m_petMod)
    {
        PPet->delModifier(mod.first, mod.second);
    }
}

/************************************************************************
*																		*
*  Текущая величина умения (не максимальная, а ограниченная уровнем)	*
*																		*
************************************************************************/

uint16 CBattleEntity::GetSkill(uint16 SkillID)
{
    if (SkillID < MAX_SKILLTYPE)
    {
        return WorkingSkills.skill[SkillID] & 0x7FFF;
    }
    return 0;
}

void CBattleEntity::addTrait(CTrait* PTrait)
{
    TraitList.push_back(PTrait);
    addModifier(PTrait->getMod(), PTrait->getValue());
}

void CBattleEntity::delTrait(CTrait* PTrait)
{
    delModifier(PTrait->getMod(), PTrait->getValue());
    std::remove(TraitList.begin(), TraitList.end(), PTrait);
}

bool CBattleEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (targetFlags & TARGET_ENEMY)
    {
        if (!isDead())
        {
            if (allegiance == (PInitiator->allegiance % 2 == 0 ? PInitiator->allegiance + 1 : PInitiator->allegiance - 1))
            {
                return true;
            }
        }
    }
    if ((targetFlags & TARGET_SELF) &&
        this == PInitiator)
    {
        return true;
    }
    if ((targetFlags & TARGET_PLAYER) && allegiance == PInitiator->allegiance)
    {
        return true;
    }
    return false;
}

bool CBattleEntity::CanUseSpell(CSpell* PSpell)
{
    return spell::CanUseSpell(this, PSpell);
}

void CBattleEntity::Spawn()
{
    CBaseEntity::Spawn();
    animation = ANIMATION_NONE;
    m_OwnerID.clean();
    HideName(false);
}

void CBattleEntity::Die()
{
    //#TODO - get killer
    SetBattleTargetID(0);
    PAI->EventHandler.triggerListener("DEATH", this, nullptr);
}

void CBattleEntity::OnDeathTimer()
{}

void CBattleEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    auto PSpell = state.GetSpell();
    auto PActionTarget = static_cast<CBattleEntity*>(state.GetTarget());

    luautils::OnSpellPrecast(this, PSpell);

    state.SpendCost();

    // remove effects based on spell cast first
    int16 effectFlags = EFFECTFLAG_INVISIBLE | EFFECTFLAG_MAGIC_BEGIN;

    if (PSpell->canTargetEnemy())
    {
        effectFlags |= EFFECTFLAG_DETECTABLE;
    }

    StatusEffectContainer->DelStatusEffectsByFlag(effectFlags);

    PAI->TargetFind->reset();

    // setup special targeting flags
    // can this spell target the dead?

    uint8 flags = FINDFLAGS_NONE;
    if (PSpell->getValidTarget() & TARGET_PLAYER_DEAD)
    {
        flags |= FINDFLAGS_DEAD;
    }
    if (PSpell->getFlag() & SPELLFLAG_HIT_ALL)
    {
        flags |= FINDFLAGS_HIT_ALL;
    }
    uint8 aoeType = battleutils::GetSpellAoEType(this, PSpell);

    if (aoeType == SPELLAOE_RADIAL) {
        float distance = spell::GetSpellRadius(PSpell, this);

        PAI->TargetFind->findWithinArea(PActionTarget, AOERADIUS_TARGET, distance, flags);

    }
    else if (aoeType == SPELLAOE_CONAL)
    {
        //TODO: actual radius calculation
        float radius = spell::GetSpellRadius(PSpell, this);

        PAI->TargetFind->findWithinCone(PActionTarget, radius, 45, flags);
    }
    else
    {
        // only add target
        PAI->TargetFind->findSingleTarget(PActionTarget, flags);
    }

    uint16 totalTargets = PAI->TargetFind->m_targets.size();

    PSpell->setTotalTargets(totalTargets);

    action.id = id;
    action.actiontype = ACTION_MAGIC_FINISH;
    action.actionid = PSpell->getID();
    action.recast = state.GetRecast();
    action.spellgroup = PSpell->getSpellGroup();

    uint16 msg = 0;

    for (auto PTarget : PAI->TargetFind->m_targets)
    {
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();

        actionTarget.reaction = REACTION_NONE;
        actionTarget.speceffect = SPECEFFECT_NONE;
        actionTarget.animation = PSpell->getAnimationID();
        actionTarget.param = 0;
        actionTarget.messageID = 0;

        auto ce = PSpell->getCE();
        auto ve = PSpell->getVE();

        // take all shadows
        if (PSpell->canTargetEnemy() && aoeType > 0)
        {
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }

        // TODO: this is really hacky and should eventually be moved into lua
        if (PSpell->canHitShadow() && aoeType == SPELLAOE_NONE && battleutils::IsAbsorbByShadow(PTarget))
        {
            // take shadow
            msg = 31;
            actionTarget.param = 1;
            ve = 0;
            ce = 0;
        }
        else
        {
            actionTarget.param = luautils::OnSpellCast(this, PTarget, PSpell);

            // remove effects from damage
            if (PSpell->canTargetEnemy() && actionTarget.param > 0 && PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
                // Check for bind breaking
                battleutils::BindBreakCheck(this, PTarget);
            }

            if (msg == 0)
            {
                msg = PSpell->getMessage();
            }
            else
            {
                msg = PSpell->getAoEMessage();
            }
        }

        if (actionTarget.animation == 122 && msg == 283) // teleport spells don't target unqualified members
        {
            actionList.actionTargets.pop_back();
            continue;
        }

        actionTarget.messageID = msg;

        state.ApplyEnmity(PTarget, ce, ve);

        if (PTarget->objtype == TYPE_MOB && msg != 31) // If message isn't the shadow loss message, because I had to move this outside of the above check for it.
        {
            luautils::OnMagicHit(this, PTarget, PSpell);
        }
    }

    // TODO: Pixies will probably break here, once they're added.
    if (this->allegiance != PActionTarget->allegiance)
    {
        // Should not be removed by AoE effects that don't target the player or
        // buffs cast by other players or mobs.
        PActionTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
    }

    this->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END);
}

void CBattleEntity::OnCastInterrupted(CMagicState& state, action_t& action, MSGBASIC_ID msg)
{
    CSpell* PSpell = state.GetSpell();
    if (PSpell)
    {
        action.id = id;
        action.actiontype = ACTION_MAGIC_INTERRUPT;
        action.actionid = PSpell->getID();
        action.spellgroup = PSpell->getSpellGroup();

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.messageID = 0;
        actionTarget.animation = PSpell->getAnimationID();

        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, this, 0, 0, msg));
    }
}

void CBattleEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    auto PWeaponskill = state.GetSkill();

    action.id = id;
    action.actiontype = ACTION_WEAPONSKILL_FINISH;
    action.actionid = PWeaponskill->getID();
}

bool CBattleEntity::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    if (distance(loc.p, PTarget->loc.p) > m_ModelSize || !PAI->GetController()->IsAutoAttackEnabled())
    {
        return false;
    }
    return true;
}

void CBattleEntity::OnDisengage(CAttackState& s)
{
    m_battleTarget = 0;
    if (animation == ANIMATION_ATTACK)
    {
        animation = ANIMATION_NONE;
    }
    updatemask |= UPDATE_HP;
    PAI->EventHandler.triggerListener("DISENGAGE", this);
}

void CBattleEntity::OnChangeTarget(CBattleEntity* PTarget)
{
}

CBattleEntity* CBattleEntity::GetBattleTarget()
{
    return static_cast<CBattleEntity*>(GetEntity(GetBattleTargetID()));
}

bool CBattleEntity::OnAttack(CAttackState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    if (PTarget->objtype == TYPE_PC)
    {
        // TODO: Should not be removed by AoE effects that don't target the player.
        PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
    }

    if (battleutils::IsParalyzed(this))
    {
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
        return false;
    }
    if (battleutils::IsIntimidated(this, PTarget))
    {
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_INTIMIDATED));
        return false;
    }

    // Create a new attack round.
    CAttackRound attackRound(this, PTarget);

    action.actiontype = ACTION_ATTACK;
    action.id = this->id;
    actionList_t& list = action.getNewActionList();

    list.ActionTargetID = PTarget->id;

    /////////////////////////////////////////////////////////////////////////
    //	Start of the attack loop.
    /////////////////////////////////////////////////////////////////////////
    while (attackRound.GetAttackSwingCount() && !(PTarget->isDead()))
    {
        actionTarget_t& actionTarget = list.getNewActionTarget();
        // Reference to the current swing.
        CAttack attack = attackRound.GetCurrentAttack();

        // Set the swing animation.
        actionTarget.animation = attack.GetAnimationID();

        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID = 32;
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
        }
        else if ((dsprand::GetRandomNumber(100) < attack.GetHitRate() || attackRound.GetSATAOccured()) &&
                 !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
        {
            // attack hit, try to be absorbed by shadow unless it is a SATA attack round
            if (!(attackRound.GetSATAOccured()) && battleutils::IsAbsorbByShadow(PTarget))
            {
                actionTarget.messageID = 0;
                actionTarget.reaction = REACTION_EVADE;
                attack.SetEvaded(true);
                PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, 1, 31));
            }
            else if (attack.IsParried())
            {
                actionTarget.messageID = 70;
                actionTarget.reaction = REACTION_PARRY;
                actionTarget.speceffect = SPECEFFECT_NONE;

                battleutils::HandleTacticalParry(PTarget);
                battleutils::HandleIssekiganEnmityBonus(PTarget, this);
            }
            else if (attack.CheckAnticipated() || attack.CheckCounter())
            {
                if (attack.IsAnticipated())
                {
                    actionTarget.messageID = 30;
                    actionTarget.reaction = REACTION_EVADE;
                    actionTarget.speceffect = SPECEFFECT_NONE;
                }
                if (attack.IsCountered())
                {
                    actionTarget.reaction = REACTION_EVADE;
                    actionTarget.speceffect = SPECEFFECT_NONE;
                    actionTarget.param = 0;
                    actionTarget.messageID = 0;
                    actionTarget.spikesEffect = SUBEFFECT_COUNTER;
                    if (battleutils::IsAbsorbByShadow(this))
                    {
                        actionTarget.spikesParam = 0;
                        actionTarget.spikesMessage = 14;
                    }
                    else
                    {
                        int16 naturalh2hDMG = 0;
                        if (PTarget->m_Weapons[SLOT_MAIN]->getSkillType() == SKILL_H2H || (PTarget->objtype == TYPE_MOB && PTarget->GetMJob() == JOB_MNK))
                        {
                            naturalh2hDMG = (float)(PTarget->GetSkill(SKILL_H2H) * 0.11f) + 3;
                        }

                        float DamageRatio = battleutils::GetDamageRatio(PTarget, this, attack.IsCritical(), 0);
                        auto damage = ((PTarget->GetMainWeaponDmg() + naturalh2hDMG + battleutils::GetFSTR(PTarget, this, SLOT_MAIN)) * DamageRatio);
                        actionTarget.spikesParam = battleutils::TakePhysicalDamage(PTarget, this, damage, false, SLOT_MAIN, 1, nullptr, true, false, true);
                        actionTarget.spikesMessage = 33;
                        if (PTarget->objtype == TYPE_PC)
                        {
                            uint8 skilltype = (PTarget->m_Weapons[SLOT_MAIN] == nullptr ? SKILL_H2H : PTarget->m_Weapons[SLOT_MAIN]->getSkillType());
                            charutils::TrySkillUP((CCharEntity*)PTarget, (SKILLTYPE)skilltype, GetMLevel());
                        }
                    }
                }
            }
            else
            {
                // Set this attack's critical flag.
                attack.SetCritical(dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(this, PTarget, !attack.IsFirstSwing()));

                // Critical hit.
                if (attack.IsCritical())
                {
                    actionTarget.reaction = REACTION_HIT;
                    actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
                    actionTarget.messageID = 67;

                    if (PTarget->objtype == TYPE_MOB)
                    {
                        luautils::OnCriticalHit(PTarget);
                    }
                }
                // Not critical hit.
                else
                {
                    actionTarget.reaction = REACTION_HIT;
                    actionTarget.speceffect = SPECEFFECT_HIT;
                    actionTarget.messageID = 1;
                }

                // Guarded. TODO: Stuff guards that shouldn't.
                if (attack.IsGuarded())
                {
                    actionTarget.reaction = REACTION_GUARD;
                }

                // Process damage.
                attack.ProcessDamage();

                // Try shield block
                if (attack.IsBlocked())
                {
                    actionTarget.reaction = REACTION_BLOCK;
                }

                actionTarget.param = battleutils::TakePhysicalDamage(this, PTarget, attack.GetDamage(), attack.IsBlocked(), attack.GetWeaponSlot(), 1, attackRound.GetTAEntity(), true, true);
                if (actionTarget.param < 0)
                {
                    actionTarget.param = -(actionTarget.param);
                    actionTarget.messageID = 373;
                }
            }

            if (PTarget->objtype == TYPE_PC)
            {
                if (attack.IsGuarded() || ((map_config.newstyle_skillups & NEWSTYLE_GUARD) > 0))
                {
                    if (battleutils::GetGuardRate(this, PTarget) > 0)
                    {
                        charutils::TrySkillUP((CCharEntity*)PTarget, SKILL_GRD, GetMLevel());
                    }
                }

                if (attack.IsBlocked() || ((map_config.newstyle_skillups & NEWSTYLE_BLOCK) > 0))
                {
                    if (battleutils::GetBlockRate(this, PTarget) > 0)
                    {
                        charutils::TrySkillUP((CCharEntity*)PTarget, SKILL_SHL, GetMLevel());
                    }
                }

                if (attack.IsParried() || ((map_config.newstyle_skillups & NEWSTYLE_PARRY) > 0))
                {
                    if (battleutils::GetParryRate(this, PTarget) > 0)
                    {
                        charutils::TrySkillUP((CCharEntity*)PTarget, SKILL_PAR, GetMLevel());
                    }
                }
                if (!attack.IsCountered() && !attack.IsParried())
                {
                    charutils::TrySkillUP((CCharEntity*)PTarget, SKILL_EVA, GetMLevel());
                }
            }
        }
        else
        {
            // misses the target
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.messageID = 15;
            attack.SetEvaded(true);

            // Check & Handle Afflatus Misery Accuracy Bonus
            battleutils::HandleAfflatusMiseryAccuracyBonus(this);
        }

        if (actionTarget.reaction != REACTION_HIT && actionTarget.reaction != REACTION_BLOCK && actionTarget.reaction != REACTION_GUARD)
        {
            actionTarget.param = 0;
            battleutils::ClaimMob(PTarget, this);
        }

        if (actionTarget.reaction != REACTION_EVADE && actionTarget.reaction != REACTION_PARRY)
        {
            battleutils::HandleEnspell(this, PTarget, &actionTarget, attack.IsFirstSwing(), (CItemWeapon*)this->m_Weapons[attack.GetWeaponSlot()], attack.GetDamage());
            battleutils::HandleSpikesDamage(this, PTarget, &actionTarget, attack.GetDamage());
        }

        if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
        {
            actionTarget.speceffect = SPECEFFECT_RECOIL;
        }

        //try zanshin only on single swing attack rounds - it is last priority in the multi-hit order
        //if zanshin procs, the attack is repeated
        if (attack.IsFirstSwing() && attackRound.GetAttackSwingCount() == 1)
        {
            uint16 zanshinChance = this->getMod(MOD_ZANSHIN) + battleutils::GetMeritValue(this, MERIT_ZASHIN_ATTACK_RATE);
            zanshinChance = dsp_cap(zanshinChance, 0, 100);
            //zanshin may only proc on a missed/guarded/countered swing or as SAM main with hasso up (at 25% of the base zanshin rate)
            if (((actionTarget.reaction == REACTION_EVADE || actionTarget.reaction == REACTION_GUARD ||
                  actionTarget.spikesEffect == SUBEFFECT_COUNTER) && dsprand::GetRandomNumber(100) < zanshinChance) ||
                (GetMJob() == JOB_SAM && this->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO) && dsprand::GetRandomNumber(100) < (zanshinChance / 4)))
            {
                attack.SetAttackType(ZANSHIN_ATTACK);
                attack.SetAsFirstSwing(false);
            }
            else
                attackRound.DeleteAttackSwing();
        }
        else
            attackRound.DeleteAttackSwing();

        if (list.actionTargets.size() == 8)
        {
            break;
        }
    }
    PAI->EventHandler.triggerListener("ATTACK", this, PTarget, &action);
    PTarget->PAI->EventHandler.triggerListener("ATTACKED", PTarget, this, &action);
    /////////////////////////////////////////////////////////////////////////////////////////////
    // End of attack loop
    /////////////////////////////////////////////////////////////////////////////////////////////

    this->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK | EFFECTFLAG_DETECTABLE);

    return true;
}


CBattleEntity* CBattleEntity::IsValidTarget(uint16 targid, uint16 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PTarget = PAI->TargetFind->getValidTarget(targid, validTargetFlags);

    return PTarget;
}

void CBattleEntity::OnEngage(CAttackState& state)
{
    animation = ANIMATION_ATTACK;
    updatemask |= UPDATE_HP;
    PAI->EventHandler.triggerListener("ENGAGE", this, state.GetTarget());
}

void CBattleEntity::TryHitInterrupt(CBattleEntity* PAttacker)
{
    if (PAI->GetCurrentState())
        PAI->GetCurrentState()->TryInterrupt(PAttacker);
}

void CBattleEntity::SetBattleStartTime(time_point time)
{
    m_battleStartTime = time;
}

duration CBattleEntity::GetBattleTime()
{
    return server_clock::now() - m_battleStartTime;
}

void CBattleEntity::Tick(time_point)
{
}

void CBattleEntity::PostTick()
{
    if (health.hp == 0 && PAI->IsSpawned() && !PAI->IsCurrentState<CDeathState>() && !PAI->IsCurrentState<CRaiseState>())
    {
        Die();
    }
}

uint16 CBattleEntity::GetBattleTargetID()
{
    return m_battleTarget;
}
