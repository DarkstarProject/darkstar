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

#include "item_weapon.h"

CItemWeapon::CItemWeapon(uint16 id) : CItemArmor(id)
{
	setType(ITEM_WEAPON);

	m_skillType = 0;
	m_damage	= 0;
	m_dmgType	= 0;
	m_delay		= 8000;
}

CItemWeapon::~CItemWeapon()
{
}

void CItemWeapon::setSkillType(uint8 skillType) 
{
	m_skillType = skillType;
}

uint8 CItemWeapon::getSkillType() 
{
	return m_skillType;
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

uint16 CItemWeapon::getDelay() 
{
	return m_delay;
}

void CItemWeapon::setDamage(uint16 damage) 
{
	m_damage = damage;
}

uint16 CItemWeapon::getDamage() 
{
	return m_damage;
}

void CItemWeapon::setDmgType(uint16 dmgType) 
{
	m_dmgType = dmgType;
}

//Blunt = MOD_HANDTOHAND, MOD_CLUB, MOD_STAFF
//Slashing = MOD_AXE, MOD_GREATAXE, MOD_GREATSWORD, MOD_SWORD, MOD_SCYTHE, MOD_KATANA, MOD_GREATKATANA
//Piercing = MOD_DAGGER, MOD_POLEARM, MOD_ARCHERY, MOD_MARKSMANSHIP

//Hand-to-Hand est un type de Blunt, qui est pourquoi MNK est efficace contre les Undead (Corse et Skeleton). 
//Je ne sais pas ce que vous entendez par Impact et Range? MOD_THROWING pourrait aller dans aucun d'eux parce qu'il ya différents types d'armes. 
//Par exemple, Boomerangs sont Blunt, Chakrams sont Slashing, et Shurikens sont Piercing.

uint16 CItemWeapon::getDmgType() 
{
	return m_dmgType;
}