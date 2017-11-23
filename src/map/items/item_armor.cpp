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

#include "item_armor.h"

#include <string.h>
#include "../map.h"

CItemArmor::CItemArmor(std::uint16_t id) : CItemUsable(id)
{
	setType(ITEM_ARMOR);

	m_jobs         = 0;
	m_modelID      = 0;
	m_removeSlotID = 0;
	m_shieldSize   = 0;
	m_scriptType   = 0;
	m_reqLvl       = 255;
    m_iLvl         = 0;
	m_equipSlotID  = 255;
    m_absorption   = 0;
}

CItemArmor::~CItemArmor()
{
	// ни в коем случае не освобождать здесь указатели на модификатоты и спецеффекты. они глобальны.
}

std::uint16_t CItemArmor::getModelId()
{
	return m_modelID;
}

std::uint8_t CItemArmor::getShieldSize()
{
	return m_shieldSize;
}

std::uint16_t CItemArmor::getEquipSlotId()
{
	return m_equipSlotID;
}

std::uint16_t CItemArmor::getRemoveSlotId()
{
	return m_removeSlotID;
}

std::uint8_t CItemArmor::getReqLvl()
{
	return m_reqLvl;
}

std::uint8_t CItemArmor::getILvl()
{
    return m_iLvl;
}

uint32 CItemArmor::getJobs()
{
	return m_jobs;
}

void CItemArmor::setReqLvl(std::uint8_t lvl)
{
	m_reqLvl = lvl;
}

void CItemArmor::setILvl(std::uint8_t lvl)
{
    m_iLvl = lvl;
}

void CItemArmor::setJobs(uint32 jobs)
{
	m_jobs = jobs;
}

void CItemArmor::setModelId(std::uint16_t mdl)
{
	m_modelID = mdl;
}

void CItemArmor::setShieldSize(std::uint8_t shield)
{
	m_shieldSize = shield;
}

void CItemArmor::setEquipSlotId(std::uint16_t equipSlot)
{
	m_equipSlotID = equipSlot;
}

void CItemArmor::setRemoveSlotId(std::uint16_t removSlot)
{
	m_removeSlotID = removSlot;
}

std::uint8_t CItemArmor::getSlotType()
{
	uint32 result = 0;
	getMSB(&result,(uint32)m_equipSlotID);
	return result;
}

/************************************************************************
*																		*
*  Процент урона, блокируемого щитом                                    *
*																		*
************************************************************************/

std::uint8_t CItemArmor::getShieldAbsorption()
{
    return m_absorption;
}

/************************************************************************
*																		*
*  Проверяем, является ли проедмет щитом                                *
*																		*
************************************************************************/

bool CItemArmor::IsShield()
{
    return m_shieldSize > 0 && m_shieldSize <= 6;
}

/************************************************************************
*																		*
*  Проверяем необходимость выполнения скрипта для экипировки при		*
*  возникновении какого-либо из событий (экипировка, смена зоны и т.п.)	*
*																		*
*  Функция возвращает типы событий на которые предмет реагирует, что	*
*  избавляет нас от необходимости проверять	предмет во всех событиях	*
*																		*
************************************************************************/

std::uint16_t CItemArmor::getScriptType()
{
	return m_scriptType;
}

void CItemArmor::setScriptType(std::uint16_t ScriptType)
{
	m_scriptType = ScriptType;
}

/************************************************************************
*                                                                       *
*  Добавляем модификатор к предмету                                     *
*                                                                       *
************************************************************************/

void CItemArmor::addModifier(CModifier modifier)
{
    if (IsShield() && modifier.getModID() == Mod::DEF)
    {
        // reduction calc source: www.bluegartr.com/threads/84830-Shield-Asstery
        // http://www.ffxiah.com/forum/topic/21671/paladin-faq-info-and-trade-studies/33/ <~Aegis and Ochain
		auto pdt = (std::uint8_t)(modifier.getModAmount() / 2);

        switch(m_shieldSize)
        {
            case 1: // Buckler
                pdt += 22;
                break;
            case 2: // Round
            case 6: // Ochain
                pdt += 40;
                break;
            case 3: // Kite
                pdt += 50;
                break;
            case 4: // Tower
            case 5: // Aegis
                pdt += 55;
                break;
        }
        m_absorption = std::min<std::uint8_t>(pdt, 100);
    }
    modList.push_back(modifier);
}

std::int16_t CItemArmor::getModifier(Mod mod)
{
	for (std::uint16_t i = 0; i < modList.size(); ++i)
	{
		if (modList.at(i).getModID() == mod)
		{
			return modList.at(i).getModAmount();
		}
	}
	return 0;
}

void CItemArmor::addPetModifier(CPetModifier modifier)
{
    petModList.push_back(modifier);
}

void CItemArmor::addLatent(LATENT ConditionsID, std::uint16_t ConditionsValue, Mod ModValue, std::int16_t ModPower)
{
    itemLatent latent{ ConditionsID, ConditionsValue, ModValue, ModPower };
    latentList.push_back(latent);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemArmor::setTrialNumber(std::uint16_t trial)
{
    if (trial)
        WBUFB(m_extra, 0x01) |= 0x40;
    else
        WBUFB(m_extra, 0x01) &= ~0x40;

    WBUFB(m_extra, 0x0A) = (std::uint8_t)trial;
}

std::uint16_t CItemArmor::getTrialNumber()
{
    return RBUFB(m_extra, 0x0A);
}

/************************************************************************
*                                                                       *
*  Augments: 5 bits for value, 11 bits for augment ID                   *
*                                                                       *
************************************************************************/
void CItemArmor::LoadAugment(std::uint8_t slot, std::uint16_t augment)
{
    WBUFW(m_extra, 2 + (slot * 2)) = augment;
}

void CItemArmor::ApplyAugment(std::uint8_t slot)
{
    SetAugmentMod(
        (std::uint16_t)unpackBitsBE(m_extra, 2 + (slot * 2), 0, 11),
        (std::uint8_t)unpackBitsBE(m_extra, 2 + (slot * 2), 11, 5)
        );
}

void CItemArmor::setAugment(std::uint8_t slot, std::uint16_t type, std::uint8_t value)
{
    packBitsBE(m_extra, type, 2 + (slot * 2), 0, 11);
    packBitsBE(m_extra, value, 2 + (slot * 2), 11, 5);

    SetAugmentMod(type, value);
}

void CItemArmor::SetAugmentMod(std::uint16_t type, std::uint8_t value)
{
    if (type != 0)
    {
        setSubType(ITEM_AUGMENTED);
        WBUFB(m_extra, 0x00) |= 0x02;
        WBUFB(m_extra, 0x01) |= 0x03;
    }


    // obtain augment info by querying the db
    const char* fmtQuery = "SELECT augmentId, multiplier, modId, `value`, `isPet`, `petType` FROM augments WHERE augmentId = %u";

    std::int32_t ret = Sql_Query(SqlHandle, fmtQuery, type);

    while (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        std::uint8_t multiplier = (std::uint8_t)Sql_GetUIntData(SqlHandle, 1);
        Mod modId = static_cast<Mod>(Sql_GetUIntData(SqlHandle, 2));
        std::int16_t modValue = (std::int16_t)Sql_GetIntData(SqlHandle, 3);

        // type is 0 unless mod is for pets
        std::uint8_t isPet = (std::uint8_t)Sql_GetUIntData(SqlHandle, 4);
        PetModType petType = static_cast<PetModType>(Sql_GetIntData(SqlHandle, 5));

        // apply modifier to item. increase modifier power by 'value' (default magnitude 1 for most augments) if multiplier isn't specified
        // otherwise increase modifier power using the multiplier
        // check if we should be adding to or taking away from the mod power (handle scripted augments properly)
        modValue = (modValue > 0 ? modValue + value : modValue - value) * (multiplier > 1 ? multiplier : 1);

        if (!isPet)
            addModifier(CModifier(modId, modValue));
        else
            addPetModifier(CPetModifier(modId, petType, modValue));
    }
}

std::uint16_t CItemArmor::getAugment(std::uint8_t slot)
{
    return RBUFW(m_extra, 2 + (slot * 2));
}