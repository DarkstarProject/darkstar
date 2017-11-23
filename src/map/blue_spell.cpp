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

#include "blue_spell.h"

CBlueSpell::CBlueSpell(SpellID id) : CSpell(id)
{
}

std::unique_ptr<CSpell> CBlueSpell::clone()
{
  return std::unique_ptr<CBlueSpell>(new CBlueSpell(*this));
}

std::uint16_t CBlueSpell::getMonsterSkillId()
{
	return m_monsterSkillId;
}

void CBlueSpell::setMonsterSkillId(std::uint16_t skillid)
{
	m_monsterSkillId = skillid;
}

std::uint8_t CBlueSpell::getSetPoints()
{
	return m_setPoints;
}

void CBlueSpell::setSetPoints(std::uint8_t setpoints)
{
	m_setPoints = setpoints;
}

std::uint8_t CBlueSpell::getEcosystem()
{
	return m_ecosystem;
}

void CBlueSpell::setEcosystem(std::uint8_t ecosystem)
{
	m_ecosystem = ecosystem;
}

std::uint8_t CBlueSpell::getTraitCategory()
{
	return m_traitCategory;
}

void CBlueSpell::setTraitCategory(std::uint8_t category)
{
	m_traitCategory = category;
}

std::uint8_t CBlueSpell::getTraitWeight()
{
	return m_traitWeight;
}

void CBlueSpell::setTraitWeight(std::uint8_t weight)
{
	m_traitWeight = weight;
}

std::uint8_t CBlueSpell::getPrimarySkillchain()
{
    return m_PrimarySkillchain;
}

void CBlueSpell::setPrimarySkillchain(std::uint8_t sc)
{
    m_PrimarySkillchain = sc;
}

std::uint8_t CBlueSpell::getSecondarySkillchain()
{
    return m_SecondarySkillchain;
}

void CBlueSpell::setSecondarySkillchain(std::uint8_t sc)
{
    m_SecondarySkillchain = sc;
}

void CBlueSpell::addModifier(CModifier modifier)
{
    modList.push_back(modifier);
}
