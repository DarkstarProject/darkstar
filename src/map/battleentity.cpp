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

#include "../common/showmsg.h"
#include "../common/utils.h"

#include <math.h>
#include <string.h>

#include "battleentity.h"
#include "battleutils.h"

CBattleEntity::CBattleEntity() 
{
    m_OwnerID.clean();
	m_ModelSize	= 3; // неправильная инициализация, она приведет к тому, что заклинания станут читаться на 3 дальше
	m_mlvl = 0;
	m_slvl = 0;
	
	m_mjob = JOB_WAR;
	m_sjob = JOB_WAR;

	m_Weapons[SLOT_MAIN]   = new CItemWeapon(0);
	m_Weapons[SLOT_SUB]    = new CItemWeapon(0);
	m_Weapons[SLOT_RANGED] = new CItemWeapon(0);
	m_Weapons[SLOT_AMMO]   = new CItemWeapon(0);

	memset(& stats,  0, sizeof(stats));
	memset(& health, 0, sizeof(health));
	memset(m_modStat,0, sizeof(m_modStat));
	memset(& WorkingSkills, 0, sizeof(WorkingSkills));

	PPet      = NULL;
    PParty    = NULL;
	PMaster   = NULL;
	PBattleAI = NULL;

	StatusEffectContainer = new CStatusEffectContainer(this);

	m_modStat[MOD_SLASHRES]  = 1000;
	m_modStat[MOD_PIERCERES] = 1000;
	m_modStat[MOD_HTHRES]	 = 1000;
	m_modStat[MOD_IMPACTRES] = 1000;

    m_modStat[MOD_FIRERES]    = 0;
    m_modStat[MOD_ICERES]     = 0;
    m_modStat[MOD_WINDRES]    = 0;
    m_modStat[MOD_EARTHRES]   = 0;
    m_modStat[MOD_THUNDERRES] = 0;
    m_modStat[MOD_WATERRES]   = 0;
    m_modStat[MOD_LIGHTRES]   = 0;
    m_modStat[MOD_DARKRES]    = 0;

	charmTime = 0;
	isCharmed = false;
}

CBattleEntity::~CBattleEntity()
{
    delete PBattleAI;
	delete StatusEffectContainer;
}

bool CBattleEntity::isDead()
{
	return (health.hp <= 0 || status == STATUS_DISAPPEAR);
}

bool CBattleEntity::isInDynamis()
{
	uint8 Pzone = getZone();
	return (Pzone > 184 && Pzone < 189 ||  Pzone > 133 && Pzone < 136);
}

// return true if the mob has immunity
bool CBattleEntity::hasImmunity(uint32 imID)
{
	if(objtype == TYPE_MOB){
		IMMUNITY mobImmunity = (IMMUNITY)imID;
		return (m_Immunity == mobImmunity);
	}
	return false;
}

bool CBattleEntity::isAsleep()
{
	return (PBattleAI->GetCurrentAction() == ACTION_SLEEP);
}

/************************************************************************
*                                                                       *
*  Пересчитываем максимальные значения hp и mp с учетом модификаторов   *
*                                                                       *
************************************************************************/

void CBattleEntity::UpdateHealth()
{
    int32 dif = (getMod(MOD_CONVMPTOHP) - getMod(MOD_CONVHPTOMP));

    health.modmp = ((health.maxmp + getMod(MOD_MP)) * (100 + getMod(MOD_MPP)) / 100) + dsp_min((health.maxmp * m_modStat[MOD_FOOD_MPP] / 100), m_modStat[MOD_FOOD_MP_CAP]);
    health.modhp = ((health.maxhp + getMod(MOD_HP)) * (100 + getMod(MOD_HPP)) / 100) + dsp_min((health.maxhp * m_modStat[MOD_FOOD_HPP] / 100), m_modStat[MOD_FOOD_HP_CAP]);

    dif = (health.modmp - 0) <  dif ?  (health.modmp - 0) : dif;
    dif = (health.modhp - 1) < -dif ? -(health.modhp - 1) : dif;

    health.modhp += dif;
    health.modmp -= dif;

    health.hp = dsp_cap(health.hp, 0, health.modhp);
    health.mp = dsp_cap(health.mp, 0, health.modmp);
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

int16 CBattleEntity::GetWeaponDelay(bool haste)
{
	if (StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS))
	{
		return 1700;
	}
	uint16 WeaponDelay = m_Weapons[SLOT_MAIN]->getDelay() - getMod(MOD_DELAY);
	if (m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH)
	{
		WeaponDelay -= getMod(MOD_MARTIAL_ARTS) * 1000 / 60;
	} else if (m_Weapons[SLOT_SUB]->getDmgType() > 0 &&
		m_Weapons[SLOT_SUB]->getDmgType() < 4 )
	{
		WeaponDelay += m_Weapons[SLOT_SUB]->getDelay();
		//apply dual wield delay reduction
		WeaponDelay = WeaponDelay * ((100.0f - (float)getMod(MOD_DUAL_WIELD))/100.0f);
	}
	if( haste )
	{
		WeaponDelay = (WeaponDelay * (100 - getMod(MOD_HASTE))) / 100;
	}
	return WeaponDelay;
}

int16 CBattleEntity::GetRangedWeaponDelay()
{
	CItemWeapon* PRange = (CItemWeapon*)m_Weapons[SLOT_RANGED];
	CItemWeapon* PAmmo = (CItemWeapon*)m_Weapons[SLOT_AMMO];

	int delay = 0;
	if(PRange != NULL) { delay += (((PRange->getDelay()*60)/1000)+240); }
	if(PAmmo != NULL) { delay += (((PAmmo->getDelay()*60)/1000)+240); }
	return (((delay-getMod(MOD_RANGED_DELAY))*1000)/110);
}

uint16 CBattleEntity::GetMainWeaponDmg()
{
	return m_Weapons[SLOT_MAIN]->getDamage() + getMod(MOD_MAIN_DMG_RATING);
}

uint16 CBattleEntity::GetSubWeaponDmg()
{
	return m_Weapons[SLOT_SUB]->getDamage() + getMod(MOD_SUB_DMG_RATING);
}

uint16 CBattleEntity::GetRangedWeaponDmg()
{
	return m_Weapons[SLOT_RANGED]->getDamage() + getMod(MOD_RANGED_DMG_RATING) + m_Weapons[SLOT_AMMO]->getDamage();
}

uint16 CBattleEntity::GetMainWeaponRank()
{
	return (m_Weapons[SLOT_MAIN]->getDamage() + getMod(MOD_MAIN_DMG_RANK)) / 9;
}

uint16 CBattleEntity::GetSubWeaponRank()
{
	return (m_Weapons[SLOT_SUB]->getDamage() + getMod(MOD_SUB_DMG_RANK)) / 9;
}

uint16 CBattleEntity::GetRangedWeaponRank()
{
	return (m_Weapons[SLOT_RANGED]->getDamage() + getMod(MOD_RANGED_DMG_RANK)) / 9;
}

/************************************************************************
*                                                                       *
*  Изменяем количество TP сущности	                                    *
*                                                                       *
************************************************************************/

uint16 CBattleEntity::addTP(float tp)
{
	float TPMulti = 1.0;

	if(objtype == TYPE_PC)
	{
		TPMulti = map_config.player_tp_multiplier;
	}
	else if(objtype == TYPE_MOB)
	{
		TPMulti = map_config.mob_tp_multiplier;
	}
	else if(objtype == TYPE_PET)
	{
		TPMulti = map_config.mob_tp_multiplier * 3;
	}
	
	float cap = dsp_cap(health.tp + (tp * TPMulti), 0, 300);
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
	if (status == STATUS_NORMAL) status = STATUS_UPDATE;

    int32 cap = dsp_cap(health.hp + hp, 0, GetMaxHP());
	hp = health.hp - cap;
	health.hp = cap;

	// если количество жизней достигает нуля, то сущность умирает

    if(hp > 0)
    {
        battleutils::MakeEntityStandUp(this);
    }

	if (health.hp == 0)
	{
		if (animation == ANIMATION_CHOCOBO)
		{
			StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
		}
		PBattleAI->SetCurrentAction(ACTION_FALL);
	}
	return abs(hp);
}

int32 CBattleEntity::addMP(int32 mp)
{
	int32 cap = dsp_cap(health.mp + mp, 0, GetMaxMP());
	mp = health.mp - cap;
	health.mp = cap;
	return abs(mp);
}

/************************************************************************
*                                                                       *
*  Полные значения характеристик боевой сущности                        *
*                                                                       *
************************************************************************/

uint16 CBattleEntity::STR() 
{ 
    return dsp_max(0, stats.STR + m_modStat[MOD_STR]);
}

uint16 CBattleEntity::DEX()
{
    return dsp_max(0, stats.DEX + m_modStat[MOD_DEX]);
}

uint16 CBattleEntity::VIT()
{
    return dsp_max(0, stats.VIT + m_modStat[MOD_VIT]);
}

uint16 CBattleEntity::AGI()
{
    return dsp_max(0, stats.AGI + m_modStat[MOD_AGI]);
}

uint16 CBattleEntity::INT()
{
    return dsp_max(0, stats.INT + m_modStat[MOD_INT]);
}

uint16 CBattleEntity::MND()
{
    return dsp_max(0, stats.MND + m_modStat[MOD_MND]);
}

uint16 CBattleEntity::CHR()
{
    return dsp_max(0, stats.CHR + m_modStat[MOD_CHR]);
}

uint16 CBattleEntity::ATT()
{
    int32 ATT = 8 + m_modStat[MOD_ATT] + STR() / 2;
	if (this->objtype & TYPE_PC){
		ATT += GetSkill(m_Weapons[SLOT_MAIN]->getSkillType());
	}
    return ATT + (ATT * m_modStat[MOD_ATTP] / 100) + 
        dsp_min((ATT * m_modStat[MOD_FOOD_ATTP] / 100), m_modStat[MOD_FOOD_ATT_CAP]);
}

uint16 CBattleEntity::RATT(uint8 skill)
{
    int32 ATT = 8 + GetSkill(skill) + m_modStat[MOD_RATT] + STR() / 2;

    return ATT + (ATT * m_modStat[MOD_RATTP] / 100) + 
        dsp_min((ATT * m_modStat[MOD_FOOD_RATTP] / 100), m_modStat[MOD_FOOD_RATT_CAP]);
}

uint16 CBattleEntity::ACC(uint8 slot, uint8 offsetAccuracy)
{
	if (this->objtype & TYPE_PC){
		int16 ACC = GetSkill(m_Weapons[slot]->getSkillType());
		ACC = (ACC > 200 ? (((ACC - 200)*0.9)+200) : ACC);
		if(slot == SLOT_MAIN && m_Weapons[SLOT_MAIN]->isTwoHanded() == true)
		{
			ACC += DEX() * 0.75;
		}
		else
		{
			ACC += DEX() * 0.5;
		}
		ACC = (ACC + m_modStat[MOD_ACC] + offsetAccuracy);
		ACC = ACC + (ACC * m_modStat[MOD_ACCP] / 100) + 
			dsp_min((ACC * m_modStat[MOD_FOOD_ACCP] / 100), m_modStat[MOD_FOOD_ACC_CAP]) + DEX() / 2;
		return dsp_max(0, ACC);
	}
	else{
		int16 ACC = m_modStat[MOD_ACC];
		ACC = ACC + (ACC * m_modStat[MOD_ACCP] / 100) + 
			dsp_min((ACC * m_modStat[MOD_FOOD_ACCP] / 100), m_modStat[MOD_FOOD_ACC_CAP]) + DEX() / 2; //food mods here for Snatch Morsel
		return dsp_max(0, ACC);
	}
}

uint16 CBattleEntity::DEF()
{
	if(this->StatusEffectContainer->HasStatusEffect(EFFECT_COUNTERSTANCE,0)){
		return VIT()/2;
	}
    int32 DEF = 8 + m_modStat[MOD_DEF] + VIT() / 2;

    return DEF + (DEF * m_modStat[MOD_DEFP] / 100) +
        dsp_min((DEF * m_modStat[MOD_FOOD_DEFP] / 100), m_modStat[MOD_FOOD_DEF_CAP]);
}

uint16  CBattleEntity::EVA()
{
    return dsp_max(0, (m_modStat[MOD_EVA] * (100 + m_modStat[MOD_EVAP])) / 100 + AGI() / 2);
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
	m_modStat[MOD_DEF] -= m_mlvl + dsp_cap(m_mlvl-50,0,10);
	m_mlvl = (mlvl == 0 ? 1 : mlvl);
	m_modStat[MOD_DEF] += m_mlvl + dsp_cap(m_mlvl-50,0,10);
}

void CBattleEntity::SetSLevel(uint8 slvl)
{
	m_slvl = (slvl > (m_mlvl >> 1) ? (m_mlvl == 1 ? 1 : (m_mlvl >> 1)) : slvl);
}

/************************************************************************
*																		*
*  Добавляем модификатор												*
*																		*
************************************************************************/

void CBattleEntity::addModifier(uint16 type, int16 amount)
{
	m_modStat[(type < MAX_MODIFIER ? type : MOD_NONE)] += amount; 
}

/************************************************************************
*																		*
*  Добавляем модификаторы												*
*																		*
************************************************************************/

void CBattleEntity::addModifiers(std::vector<CModifier*> *modList)
{
	for (uint16 i = 0; i < modList->size(); ++i)
	{
		m_modStat[modList->at(i)->getModID()] += modList->at(i)->getModAmount();
	}
}

/************************************************************************
*																		*
*  Устанавливаем модификатор											*
*																		*
************************************************************************/

void CBattleEntity::setModifier(uint16 type, int16 amount)
{
	m_modStat[(type < MAX_MODIFIER ? type : MOD_NONE)] = amount; 
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
	m_modStat[(type < MAX_MODIFIER ? type : MOD_NONE)] -= amount;
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

/************************************************************************
*																		*
*  Получаем текущее значение указанного модификатора					*
*																		*
************************************************************************/

int16 CBattleEntity::getMod(uint16 modID)
{
	if (modID < MAX_MODIFIER)
	{
		return m_modStat[modID];
	}
	return 0;
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