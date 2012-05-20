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
#include "../common/timer.h"

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

/************************************************************************
*                                                                       *
*  Пересчитываем максимальные значения hp и mp с учетом модификаторов   *
*                                                                       *
************************************************************************/

void CBattleEntity::UpdateHealth()
{
    int32 dif = (getMod(MOD_CONVMPTOHP) - getMod(MOD_CONVHPTOMP));

    health.modmp = (health.maxmp + getMod(MOD_MP)) * (100 + getMod(MOD_MPP)) / 100;
    health.modhp = (health.maxhp + getMod(MOD_HP)) * (100 + getMod(MOD_HPP)) / 100;

    dif = (health.modmp - 0) <  dif ?  (health.modmp - 0) : dif;
    dif = (health.modhp - 1) < -dif ? -(health.modhp - 1) : dif;

    health.modhp += dif;
    health.modmp -= dif;

    health.hp = cap_value(health.hp, 0, health.modhp);
    health.mp = cap_value(health.mp, 0, health.modmp);
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
*																		*
*  Изменяем количество TP сущности										*
************************************************************************/

uint16 CBattleEntity::addTP(float tp)
{
	DSP_DEBUG_BREAK_IF((objtype != TYPE_PC) && (objtype != TYPE_MOB) && (objtype != TYPE_PET));
	
	float TPMulti = 1.0;
	if(objtype == TYPE_PC)
	{
		TPMulti = map_config.player_tp_multiplier;
	}
	else if(objtype == TYPE_MOB)
	{
		TPMulti = map_config.mob_tp_multiplier;
	}
	
	float cap = cap_value(health.tp + (tp * TPMulti),0,300);
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

    int32 cap = cap_value(health.hp + hp, 0, GetMaxHP());
	hp = health.hp - cap;
	health.hp = cap;

	// если количество жизней достигает нуля, то сущность умирает

	if (health.hp == 0)
	{
		PBattleAI->SetCurrentAction(ACTION_FALL);
	}
	return abs(hp);
}

int32 CBattleEntity::addMP(int32 mp)
{
	int32 cap = cap_value(health.mp + mp, 0, GetMaxMP());
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
    uint32 ATT = 8 + m_modStat[MOD_ATT] + STR() / 2;

    return ((100 + m_modStat[MOD_ATTP]) * ATT)/100 + dsp_min(((100 + m_modStat[MOD_FOOD_ATTP]) * ATT)/100, m_modStat[MOD_FOOD_ATT_CAP]);
}

uint16 CBattleEntity::DEF()
{
	if(this->StatusEffectContainer->HasStatusEffect(EFFECT_COUNTERSTANCE,0)){
		return VIT()/2;
	}
    uint32 DEF = 8 + m_modStat[MOD_DEF] + VIT() / 2;

    return ((100 + m_modStat[MOD_DEFP]) * DEF)/100 + dsp_min(((100 + m_modStat[MOD_FOOD_DEFP]) * DEF)/100, m_modStat[MOD_FOOD_DEF_CAP]);
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
	m_modStat[MOD_DEF] -= m_mlvl + cap_value(m_mlvl-50,0,10);
	m_mlvl = (mlvl == 0 ? 1 : mlvl);
	m_modStat[MOD_DEF] += m_mlvl + cap_value(m_mlvl-50,0,10);
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