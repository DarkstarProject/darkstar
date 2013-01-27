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
#include "../battleentity.h"
#include "../charutils.h"
#include "../itemutils.h"

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
	m_damage		= 0;
    m_effect		= 0;
	m_dmgType		= DAMAGE_NONE;
	m_delay			= 8000;
    m_maxHit		= 0;
    m_ranged		= false;
    m_twoHanded		= false;
}

CItemWeapon::~CItemWeapon() {}

/************************************************************************
*                                                                       *
*  Оружие для атаки с дистанции (Range)                                 *
*                                                                       *
************************************************************************/

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
	return ( m_unlockId > 0 ? true : false ); 
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

uint8 CItemWeapon::getSubSkillType() 
{
	return m_subSkillType;
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

int16 CItemWeapon::getDelay(CBattleEntity* user) 
{
	if (user->objtype == TYPE_PC)
	{
		if (m_skillType != SKILL_NON && m_unlockId > 0 && ((CCharEntity*)user)->isWeaponUnlocked(m_unlockId))
		{
			return (nameSpaceUnlockableWeapons::g_pWeaponUnlockable[m_unlockId-1].delay *1000 / 60);
		}
		else
		{
			return m_delay;
		}
	}
	else
	{
	return m_delay;
	}
}

/************************************************************************
*                                                                       *
*  get unlock id		                                                *
*                                                                       *
************************************************************************/

uint16 CItemWeapon::getUnlockId()
{
	return m_unlockId;
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

uint16 CItemWeapon::getDamage(CBattleEntity* user) 
{
	if (user->objtype == TYPE_PC)
	{
		if (m_skillType != SKILL_NON && m_unlockId > 0 && ((CCharEntity*)user)->isWeaponUnlocked(m_unlockId))
		{
			return nameSpaceUnlockableWeapons::g_pWeaponUnlockable[m_unlockId-1].damage;
		}
	}
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
*  set unlockable property of weapon			                        *
*                                                                       *
************************************************************************/

void CItemWeapon::setUnlockable(uint16 unlockId)
{
    m_unlockId = unlockId;
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

uint8 CItemWeapon::getHitCount(uint8 checkMobHits)
{
    int num = 1;
    int distribution = rand()%100;

	uint8 hits = m_maxHit;
	if (checkMobHits != NULL) hits = checkMobHits;

    switch (hits)
    {
        case 0: break;
        case 1: break;
        case 2: // cdf = 55,100
		    if(distribution < 55){ break; }
		    else{ num+=1; break;}
		    break;
        case 3: // cdf = 30,80,100
		    if(distribution < 30){ break; }
		    else if(distribution < 80){ num+=1; break; }
		    else{ num+=2; break; }
		    break;
        case 4: // cdf = 20,50,80,100
		    if(distribution < 20){ break; }
		    else if(distribution < 50){ num+=1; break; }
		    else if(distribution < 80){ num+=2; break; }
		    else{ num+=3; break; }
		    break;
        case 5: // cdf = 10,30,60,90,100
		    if(distribution < 10){ break; }
		    else if(distribution < 30){ num+=1; break; }
		    else if(distribution < 60){ num+=2; break; }
		    else if(distribution < 90){ num+=3; break; }
		    else{ num+=4; break; }
		    break;
        case 6: // cdf = 10,30,50,70,90,100
            if(distribution < 10){ break; }
		    else if(distribution < 30){num+=1; break; }
		    else if(distribution < 50){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 90){num+=4; break; }
		    else{ num+=5; break; }
            break;
        case 7: // cdf = 5,20,45,70,85,95,100
            if(distribution < 5){ break; }
		    else if(distribution < 20){num+=1; break; }
		    else if(distribution < 45){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 85){num+=4; break; }
		    else if(distribution < 95){num+=5; break; }
		    else{ num+=6; break; }
            break;
        case 8: // cdf = 5,20,45,70,85,95,98,100
		    if(distribution < 5){ break; }
		    else if(distribution < 20){num+=1; break; }
		    else if(distribution < 45){num+=2; break; }
		    else if(distribution < 70){num+=3; break; }
		    else if(distribution < 85){num+=4; break; }
		    else if(distribution < 95){num+=5; break; }
		    else if(distribution < 98){num+=6; break; }
		    else{ num+=7; break; }
            break;
	}
    return dsp_min(num,8); // не более восьми ударов за одну атаку
}


//Blunt = MOD_HANDTOHAND, MOD_CLUB, MOD_STAFF
//Slashing = MOD_AXE, MOD_GREATAXE, MOD_GREATSWORD, MOD_SWORD, MOD_SCYTHE, MOD_KATANA, MOD_GREATKATANA
//Piercing = MOD_DAGGER, MOD_POLEARM, MOD_ARCHERY, MOD_MARKSMANSHIP

//Hand-to-Hand est un type de Blunt, qui est pourquoi MNK est efficace contre les Undead (Corse et Skeleton). 
//Je ne sais pas ce que vous entendez par Impact et Range? MOD_THROWING pourrait aller dans aucun d'eux parce qu'il ya différents types d'armes. 
//Par exemple, Boomerangs sont Blunt, Chakrams sont Slashing, et Shurikens sont Piercing.