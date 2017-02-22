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

#include "../common/showmsg.h"
#include "../common/timer.h"

#include "packets/inventory_item.h"
#include "packets/inventory_finish.h"

#include "entities/charentity.h"
#include "recast_container.h"
#include "item_container.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CRecastContainer::CRecastContainer(CCharEntity* PChar) : m_PChar(PChar)
{
    DSP_DEBUG_BREAK_IF(m_PChar == nullptr || m_PChar->objtype != TYPE_PC);
}

CRecastContainer::~CRecastContainer()
{ }

/************************************************************************
*                                                                       *
*  Получаем указатель на указанный RecastList                           *
*                                                                       *
************************************************************************/

RecastList_t* CRecastContainer::GetRecastList(RECASTTYPE type)
{
    switch (type)
    {
        case RECAST_MAGIC:   return &RecastMagicList;
        case RECAST_ABILITY: return &RecastAbilityList;
        case RECAST_ITEM:    return &RecastItemList;
        case RECAST_LOOT:    return &RecastLootList;
    }
    //Unhandled Scenario
    DSP_DEBUG_BREAK_IF(true);
    return nullptr;
}

/************************************************************************
*                                                                       *
*  Get Recast                                                           *
*                                                                       *
************************************************************************/

Recast_t* CRecastContainer::GetRecast(RECASTTYPE type, uint16 id)
{
    RecastList_t* list = GetRecastList(type);
    for (auto&& recast : *list)
    {
        if (recast.ID == id)
        {
            return &recast;
        }
    }
    return nullptr;
}

/************************************************************************
*                                                                       *
*  Добавляем запись в контейнер                                         *
*                                                                       *
************************************************************************/

void CRecastContainer::Add(RECASTTYPE type, uint16 id, uint32 duration, uint32 chargeTime, uint8 maxCharges)
{
    Recast_t* recast = Load(type, id, duration, chargeTime, maxCharges);

    if (type == RECAST_ABILITY)
    {
        Sql_Query(SqlHandle, "REPLACE INTO char_recast VALUES (%u, %u, %u, %u);", m_PChar->id, recast->ID, static_cast<uint32>(recast->TimeStamp), recast->RecastTime);
    }
}

Recast_t* CRecastContainer::Load(RECASTTYPE type, uint16 id, uint32 duration, uint32 chargeTime, uint8 maxCharges)
{
    Recast_t* recast = GetRecast(type, id);

    if (recast == nullptr)
    {
        GetRecastList(type)->push_back({id, time(nullptr), duration, chargeTime, maxCharges});
        return &GetRecastList(type)->back();
    }
    else
    {
        if (chargeTime)
        {
            recast->chargeTime = chargeTime;
        }
        if (maxCharges)
        {
            recast->maxCharges = maxCharges;
        }
        if (recast->chargeTime == 0)
        {
            recast->TimeStamp = time(nullptr);
            recast->RecastTime = duration;
        }
        else
        {
            if (recast->RecastTime == 0)
            {
                recast->TimeStamp = time(nullptr);
            }
            else if (recast->RecastTime + duration > recast->chargeTime * recast->maxCharges)
            {
                auto diff = (recast->chargeTime * recast->maxCharges) - recast->RecastTime + duration;
                recast->TimeStamp += diff;
                duration -= diff;
            }
            recast->RecastTime += duration;
        }
        return recast;
    }
}

/************************************************************************
*                                                                       *
*  Удаляем все элементы указанного типа                                 *
*                                                                       *
************************************************************************/

void CRecastContainer::Del(RECASTTYPE type)
{
    RecastList_t* PRecastList = GetRecastList(type);
    if (type == RECAST_ABILITY)
    {
        for (auto&& recast : *PRecastList)
        {
            recast.RecastTime = 0;
        }
        Sql_Query(SqlHandle, "DELETE FROM char_recast WHERE charid = %u;", m_PChar->id);
    }
    else
    {
        PRecastList->clear();
    }
}

/************************************************************************
*                                                                       *
*  Удаляем указанный элемент указанного типа                            *
*                                                                       *
************************************************************************/

void CRecastContainer::Del(RECASTTYPE type, uint16 id)
{
    RecastList_t* PRecastList = GetRecastList(type);

    if (type == RECAST_ABILITY)
    {
        if (auto recast = GetRecast(RECAST_ABILITY, id))
        {
            recast->RecastTime = 0;
        }
        Sql_Query(SqlHandle, "DELETE FROM char_recast WHERE charid = %u AND id = %u;", m_PChar->id, id);
    }
    else
    {
        PRecastList->erase(std::remove_if(PRecastList->begin(), PRecastList->end(), [&id](auto& recast)
        {
            return recast.ID == id;
        }), PRecastList->end());
    }
}

/************************************************************************
*                                                                       *
*  Deletes a recast by index				                            *
*                                                                       *
************************************************************************/

void CRecastContainer::DeleteByIndex(RECASTTYPE type, uint8 index)
{
    RecastList_t* PRecastList = GetRecastList(type);
    if (type == RECAST_ABILITY)
    {
        PRecastList->at(index).RecastTime = 0;
        Sql_Query(SqlHandle, "DELETE FROM char_recast WHERE charid = %u AND id = %u;", m_PChar->id, PRecastList->at(index).ID);
    }
    else
    {
        PRecastList->erase(PRecastList->begin() + index);
    }
}

/************************************************************************
*                                                                       *
*  Проверяем наличие элемента с указанным ID                            *
*                                                                       *
************************************************************************/

bool CRecastContainer::Has(RECASTTYPE type, uint16 id)
{
    RecastList_t* PRecastList = GetRecastList(type);

    return std::find_if(PRecastList->begin(), PRecastList->end(), [&id](auto& recast)
    {
        return recast.ID == id;
    }) != PRecastList->end();
}

/************************************************************************
*                                                                       *
*  Finds recast and checks if time > 0                                  *
*                                                                       *
************************************************************************/

bool CRecastContainer::HasRecast(RECASTTYPE type, uint16 id, uint32 recast)
{
    RecastList_t* PRecastList = GetRecastList(type);

    for (uint16 i = 0; i < PRecastList->size(); ++i)
    {
        if (PRecastList->at(i).ID == id && PRecastList->at(i).RecastTime > 0)
        {
            if (PRecastList->at(i).chargeTime == 0)
            {
                return true;
            }
            else
            {
                int charges = PRecastList->at(i).maxCharges - ((PRecastList->at(i).RecastTime - (time(nullptr) - PRecastList->at(i).TimeStamp)) / (PRecastList->at(i).chargeTime)) - 1;

                if (charges < recast)
                {
                    return true;
                }
            }
        }
    }
    return false;
}

/************************************************************************
*                                                                       *
*  Проверяем список на устаревшие записи                                *
*                                                                       *
************************************************************************/

void CRecastContainer::Check()
{
    for (uint8 type = 0; type < MAX_RECASTTPE_SIZE; ++type)
    {
        RecastList_t* PRecastList = GetRecastList((RECASTTYPE)type);

        for (uint16 i = 0; i < PRecastList->size(); ++i)
        {
            Recast_t* recast = &PRecastList->at(i);

            if (time(nullptr) >= (recast->TimeStamp + recast->RecastTime))
            {
                if (type == RECAST_ITEM)
                {
                    CItem* PItem = m_PChar->getStorage(LOC_INVENTORY)->GetItem(recast->ID);

                    m_PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, recast->ID));
                    m_PChar->pushPacket(new CInventoryFinishPacket());
                }
                if (type == RECAST_ITEM || type == RECAST_MAGIC || type == RECAST_LOOT)
                {
                    PRecastList->erase(PRecastList->begin() + i--);
                }
                else
                {
                    recast->RecastTime = 0;
                }
            }
        }
    }
}

/************************************************************************
*                                                                       *
*  Resets all job abilities except two-hour                             *
*                                                                       *
************************************************************************/

void CRecastContainer::ResetAbilities()
{
    RecastList_t* PRecastList = GetRecastList(RECAST_ABILITY);

    uint32 timestamp = 0;
    uint32 recastTime = 0;

    for (auto&& recast : *PRecastList)
    {
        if (recast.ID != 0)
        {
            Load(RECAST_ABILITY, recast.ID, 0);
        }
    }

    Sql_Query(SqlHandle, "DELETE FROM char_recast WHERE charid = %u AND id != 0;", m_PChar->id);
}

/************************************************************************
*                                                                       *
*  Resets all job abilities except two-hour (change jobs)               *
*                                                                       *
************************************************************************/

void CRecastContainer::ChangeJob()
{
    RecastList_t* PRecastList = GetRecastList(RECAST_ABILITY);

    PRecastList->erase(std::remove_if(PRecastList->begin(), PRecastList->end(), [](auto& recast)
    {
        return recast.ID != 0;
    }), PRecastList->end());

    Sql_Query(SqlHandle, "DELETE FROM char_recast WHERE charid = %u AND id != 0;", m_PChar->id);
}