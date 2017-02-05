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

CItemArmor::CItemArmor(uint16 id) : CItemUsable(id)
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

uint16 CItemArmor::getModelId()
{
	return m_modelID;
}

uint8 CItemArmor::getShieldSize()
{
	return m_shieldSize;
}

uint16 CItemArmor::getEquipSlotId()
{
	return m_equipSlotID;
}

uint16 CItemArmor::getRemoveSlotId()
{
	return m_removeSlotID;
}

uint8 CItemArmor::getReqLvl()
{
	return m_reqLvl;
}

uint8 CItemArmor::getILvl()
{
    return m_iLvl;
}

uint32 CItemArmor::getJobs()
{
	return m_jobs;
}

void CItemArmor::setReqLvl(uint8 lvl)
{
	m_reqLvl = lvl;
}

void CItemArmor::setILvl(uint8 lvl)
{
    m_iLvl = lvl;
}

void CItemArmor::setJobs(uint32 jobs)
{
	m_jobs = jobs;
}

void CItemArmor::setModelId(uint16 mdl)
{
	m_modelID = mdl;
}

void CItemArmor::setShieldSize(uint8 shield)
{
	m_shieldSize = shield;
}

void CItemArmor::setEquipSlotId(uint16 equipSlot)
{
	m_equipSlotID = equipSlot;
}

void CItemArmor::setRemoveSlotId(uint16 removSlot)
{
	m_removeSlotID = removSlot;
}

uint8 CItemArmor::getSlotType()
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

uint8 CItemArmor::getShieldAbsorption()
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

uint16 CItemArmor::getScriptType()
{
	return m_scriptType;
}

void CItemArmor::setScriptType(uint16 ScriptType)
{
	m_scriptType = ScriptType;
}

/************************************************************************
*                                                                       *
*  Добавляем модификатор к предмету                                     *
*                                                                       *
************************************************************************/

void CItemArmor::addModifier(CModifier* modifier)
{
    if (IsShield() && modifier->getModID() == Mod::DEF)
    {
        // reduction calc source: www.bluegartr.com/threads/84830-Shield-Asstery
        // http://www.ffxiah.com/forum/topic/21671/paladin-faq-info-and-trade-studies/33/ <~Aegis and Ochain

		int16 pdt = modifier->getModAmount() / 2;

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
        m_absorption = dsp_min(pdt,100);
    }
    modList.push_back(modifier);
}

int16 CItemArmor::getModifier(Mod mod)
{
	for (uint16 i = 0; i < modList.size(); ++i)
	{
		if (modList.at(i)->getModID() == mod)
		{
			return modList.at(i)->getModAmount();
		}
	}
	return 0;
}

void CItemArmor::addPetModifier(CModifier* modifier)
{
    petModList.push_back(modifier);
}

void CItemArmor::addLatent(CLatentEffect* latent)
{
	latentList.push_back(latent);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemArmor::setTrialNumber(uint16 trial)
{
    if (trial)
        WBUFB(m_extra, 0x01) |= 0x40;
    else
        WBUFB(m_extra, 0x01) &= ~0x40;

    WBUFB(m_extra, 0x0A) = trial;
}

uint16 CItemArmor::getTrialNumber()
{
    return RBUFB(m_extra, 0x0A);
}

/************************************************************************
*                                                                       *
*  Augments: 5 bits for value, 11 bits for augment ID                   *
*                                                                       *
************************************************************************/
void CItemArmor::LoadAugment(uint8 slot, uint16 augment)
{
    WBUFW(m_extra, 2 + (slot * 2)) = augment;
}

void CItemArmor::ApplyAugment(uint8 slot)
{
    SetAugmentMod(
        unpackBitsBE(m_extra, 2 + (slot * 2), 0, 11),
        unpackBitsBE(m_extra, 2 + (slot * 2), 11, 5)
        );
}

void CItemArmor::setAugment(uint8 slot, uint16 type, uint8 value)
{
    packBitsBE(m_extra, type, 2 + (slot * 2), 0, 11);
    packBitsBE(m_extra, value, 2 + (slot * 2), 11, 5);

    SetAugmentMod(type, value);
}

void CItemArmor::SetAugmentMod(uint16 type, uint8 value)
{
    if (type != 0)
    {
        setSubType(ITEM_AUGMENTED);
        WBUFB(m_extra, 0x00) |= 0x02;
        WBUFB(m_extra, 0x01) |= 0x03;
    }


    // obtain augment info by querying the db
    const int8* fmtQuery = "SELECT augmentId, multiplier, modId, `value`, `type` FROM augments WHERE augmentId = %u";

    int32 ret = Sql_Query(SqlHandle, fmtQuery, type);

    while (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        uint8 multiplier = (uint8)Sql_GetUIntData(SqlHandle, 1);
        Mod modId = static_cast<Mod>(Sql_GetUIntData(SqlHandle, 2));
        int16 modValue = (int16)Sql_GetIntData(SqlHandle, 3);
        
        // type is 0 unless mod is for pets
        uint8 type = (uint8)Sql_GetUIntData(SqlHandle, 4);

        // apply modifier to item. increase modifier power by 'value' (default magnitude 1 for most augments) if multiplier isn't specified
        // otherwise increase modifier power using the multiplier
        // check if we should be adding to or taking away from the mod power (handle scripted augments properly)
        modValue = (modValue > 0 ? modValue + value : modValue - value) * (multiplier > 1 ? multiplier : 1);

        if (!type)
            addModifier(new CModifier(modId, modValue));
        else
            addPetModifier(new CModifier(modId, modValue));
    }
}

uint16 CItemArmor::getAugment(uint8 slot)
{
    return RBUFW(m_extra, 2 + (slot * 2));
}