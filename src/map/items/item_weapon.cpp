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
#include "../entities/battleentity.h"
#include "../utils/charutils.h"
#include "../utils/itemutils.h"
#include "../utils/battleutils.h"

#include "item_weapon.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItemWeapon::CItemWeapon(uint16 id) : CItemArmor(id)
{
	setType(ITEM_WEAPON);

	m_skillType		= SKILL_NON;
	m_subSkillType	= SUBSKILL_XBO;
    m_iLvlSkill     = 0;
    m_iLvlParry     = 0;
    m_iLvlMacc      = 0;
	m_damage		= 0;
    m_effect		= 0;
	m_dmgType		= DAMAGE_NONE;
	m_delay			= 8000;
	m_baseDelay		= 8000;		//this should only be needed for mobs (specifically mnks)
    m_maxHit		= 0;
    m_ranged		= false;
    m_twoHanded		= false;
	m_wsunlockpoints= 0;
}

CItemWeapon::~CItemWeapon() {}

void CItemWeapon::resetDelay()
{
    setDelay(getBaseDelay());
}

/************************************************************************
*                                                                       *
*  Оружие для атаки с дистанции (Range)                                 *
*                                                                       *
************************************************************************/

bool CItemWeapon::isThrowing()
{
    return m_ranged && getSkillType() == SKILL_THR;
}

bool CItemWeapon::isRanged()
{
    return m_ranged;
}

/************************************************************************
*                                                                       *
*  Двуручное оружие                                                     *
*                                                                       *
************************************************************************/

bool CItemWeapon::isTwoHanded()
{
    return m_twoHanded;
}


/************************************************************************
*                                                                       *
*  get unlockable property                                              *
*                                                                       *
************************************************************************/

bool CItemWeapon::isUnlockable()
{
    if(m_skillType == SKILL_NON) return false;

	return ( m_wsunlockpoints > 0 ? true : false );
}

bool CItemWeapon::isUnlocked()
{
    return isUnlockable() && getCurrentUnlockPoints() == m_wsunlockpoints;
}

bool CItemWeapon::addWsPoints(uint8 points)
{
    if (getCurrentUnlockPoints() + points >= m_wsunlockpoints)
    {
        setCurrentUnlockPoints(m_wsunlockpoints);
        return true;
    }
    else
    {
        setCurrentUnlockPoints(getCurrentUnlockPoints() + points);
        return false;
    }
}

/************************************************************************
*                                                                       *
*   Устанавливаем тип оружия и флаг isTwoHanded                         *
*                                                                       *
************************************************************************/

void CItemWeapon::setSkillType(uint8 skillType)
{
    switch (skillType)
    {
	    case SKILL_GSD:
	    case SKILL_GAX:
	    case SKILL_SYH:
	    case SKILL_POL:
	    case SKILL_GKT:
	    case SKILL_STF:
            m_twoHanded = true;
		break;
        case SKILL_ARC:
        case SKILL_MRK:
        case SKILL_THR:
            m_ranged = true;
        break;
	}
	m_skillType = skillType;
}

uint8 CItemWeapon::getSkillType()
{
	return m_skillType;
}

/************************************************************************
*                                                                       *
*   Set/get sub skillType.  Used for guns vs crossbows and other		*
*	exclusives									                        *
*                                                                       *
************************************************************************/

void CItemWeapon::setSubSkillType(uint8 subSkillType)
{
	m_subSkillType = subSkillType;
}

void CItemWeapon::setILvlSkill(uint16 skill)
{
    m_iLvlSkill = skill;
}

void CItemWeapon::setILvlParry(uint16 parry)
{
    m_iLvlParry = parry;
}

void CItemWeapon::setILvlMacc(uint16 macc)
{
    m_iLvlMacc = macc;
}

uint8 CItemWeapon::getSubSkillType()
{
	return m_subSkillType;
}

uint16 CItemWeapon::getILvlSkill()
{
    return m_iLvlSkill;
}

uint16 CItemWeapon::getILvlParry()
{
    return m_iLvlParry;
}

uint16 CItemWeapon::getILvlMacc()
{
    return m_iLvlMacc;
}

/************************************************************************
*																		*
*  Устанавливаем время задержки оружия. Сразу переводим значение в млс.	*
*  Все математические операции происходят с целыми числами, именно по	*
*  этому порядок действий очень важен, чтобы не потерять часть данных.	*
*																		*
************************************************************************/

void CItemWeapon::setDelay(uint16 delay)
{
	m_delay = delay;
}

int16 CItemWeapon::getDelay()
{
	return m_delay;
}

/************************************************************************
*																		*
*  Set/get the un-adjusted delay of the weapon							*
*  This is to fix delay adjustments of mobs and is not intended for		*
*  use outside of zoneutils/mobutils									*
*																		*
************************************************************************/

void CItemWeapon::setBaseDelay(uint16 delay)
{
	m_baseDelay = delay;
}

int16 CItemWeapon::getBaseDelay()
{
	return m_baseDelay;
}
/************************************************************************
*                                                                       *
*  get unlock points	                                                *
*                                                                       *
************************************************************************/

uint16 CItemWeapon::getUnlockPoints()
{
	return m_wsunlockpoints;
}

uint16 CItemWeapon::getCurrentUnlockPoints()
{
    return RBUFW(m_extra, 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemWeapon::setDamage(uint16 damage)
{
	m_damage = damage;
}

uint16 CItemWeapon::getDamage()
{
	return m_damage;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemWeapon::setDmgType(uint16 dmgType)
{
	m_dmgType = dmgType;
}

uint16 CItemWeapon::getDmgType()
{
	return m_dmgType;
}

/************************************************************************
*                                                                       *
*  Дополнительный урон от оружия (fire, water и т.д.)                   *
*                                                                       *
************************************************************************/

void CItemWeapon::setAdditionalEffect(uint8 effect)
{
    m_effect = effect;
}

uint8 CItemWeapon::getAdditionalEffect()
{
    return m_effect;
}

/************************************************************************
*                                                                       *
*  set unlockable points of weapon	    		                        *
*                                                                       *
************************************************************************/

void CItemWeapon::setUnlockablePoints(uint16 points)
{
    m_wsunlockpoints = points;
}

void CItemWeapon::setCurrentUnlockPoints(uint16 points)
{
    WBUFW(m_extra, 0) = points;
}

/************************************************************************
*                                                                       *
*  Максимально возможное количество ударов оружием                      *
*                                                                       *
************************************************************************/

void CItemWeapon::setMaxHit(uint8 hit)
{
    m_maxHit = dsp_min(hit, 8);
}

/************************************************************************
*                                                                       *
*  Рассчет количества ударов                                            *
*                                                                       *
************************************************************************/

uint8 CItemWeapon::getHitCount()
{
	return battleutils::getHitCount(m_maxHit);
}


//Blunt = MOD_HANDTOHAND, MOD_CLUB, MOD_STAFF
//Slashing = MOD_AXE, MOD_GREATAXE, MOD_GREATSWORD, MOD_SWORD, MOD_SCYTHE, MOD_KATANA, MOD_GREATKATANA
//Piercing = MOD_DAGGER, MOD_POLEARM, MOD_ARCHERY, MOD_MARKSMANSHIP

//Hand-to-Hand est un type de Blunt, qui est pourquoi MNK est efficace contre les Undead (Corse et Skeleton).
//Je ne sais pas ce que vous entendez par Impact et Range? MOD_THROWING pourrait aller dans aucun d'eux parce qu'il ya différents types d'armes.
//Par exemple, Boomerangs sont Blunt, Chakrams sont Slashing, et Shurikens sont Piercing.