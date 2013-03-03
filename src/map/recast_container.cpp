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
#include "../common/timer.h"

#include "packets/inventory_item.h"
#include "packets/inventory_finish.h"

#include "charentity.h"
#include "recast_container.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CRecastContainer::CRecastContainer(CCharEntity* PChar) : m_PChar(PChar)
{
    DSP_DEBUG_BREAK_IF(m_PChar == NULL || m_PChar->objtype != TYPE_PC);
}

CRecastContainer::~CRecastContainer()
{
    for (uint8 type = 0; type < MAX_RECASTTPE_SIZE; ++type)
    {
        RecastList_t* PRecastList = GetRecastList((RECASTTYPE)type);

        for (uint16 i = 0; i < PRecastList->size(); ++i)
	    {
		    delete PRecastList->at(i);
	    }
    }
}

/************************************************************************
*                                                                       *
*  Получаем указатель на указанный RecastList                           *
*                                                                       *
************************************************************************/

std::vector<Recast_t*>* CRecastContainer::GetRecastList(RECASTTYPE type)
{
    switch (type)
    {
        case RECAST_MAGIC:   return &RecastMagicList;
        case RECAST_ABILITY: return &RecastAbilityList;
        case RECAST_ITEM:    return &RecastItemList;
    }
    //Unhandled Scenario
	DSP_DEBUG_BREAK_IF(true);
	return &std::vector<Recast_t*>::vector();
}

/************************************************************************
*                                                                       *
*  Добавляем запись в контейнер                                         *
*                                                                       *
************************************************************************/

void CRecastContainer::Add(RECASTTYPE type, uint16 id, uint32 duration)
{
    Recast_t* recast = new Recast_t;

    recast->ID = id;
    recast->TimeStamp = gettick();
    recast->RecastTime = duration;

    GetRecastList(type)->push_back(recast);
}

/************************************************************************
*                                                                       *
*  Удаляем все элементы указанного типа                                 *
*                                                                       *
************************************************************************/

void CRecastContainer::Del(RECASTTYPE type)
{
    RecastList_t* PRecastList = GetRecastList(type);

    for (uint16 i = 0; i < PRecastList->size(); ++i) 
	{
        delete PRecastList->at(i);
	}
    PRecastList->clear();
}

/************************************************************************
*                                                                       *
*  Удаляем указанный элемент указанного типа                            *
*                                                                       *
************************************************************************/

void CRecastContainer::Del(RECASTTYPE type, uint16 id)
{
    RecastList_t* PRecastList = GetRecastList(type);

    for (uint16 i = 0; i < PRecastList->size(); ++i) 
	{
        if (PRecastList->at(i)->ID == id)
        {
            delete PRecastList->at(i);
            PRecastList->erase(PRecastList->begin() + i);
            return;
        }
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

    for (uint16 i = 0; i < PRecastList->size(); ++i) 
	{
        if (PRecastList->at(i)->ID == id)
        {
            return true;
        }
	}
    return false;
}

/************************************************************************
*                                                                       *
*  Проверяем список на устаревшие записи                                *
*                                                                       *
************************************************************************/

void CRecastContainer::Check(uint32 tick)
{
    for (uint8 type = 0; type < MAX_RECASTTPE_SIZE; ++type)
    {
        RecastList_t* PRecastList = GetRecastList((RECASTTYPE)type);

        for (uint16 i = 0; i < PRecastList->size(); ++i)
	    {
		    Recast_t* recast = PRecastList->at(i);

		    if (tick >= (recast->TimeStamp + recast->RecastTime))
		    {
                if (type == RECAST_ITEM)
                {
                    CItem* PItem = m_PChar->getStorage(LOC_INVENTORY)->GetItem(recast->ID);

                    m_PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, recast->ID));
	                m_PChar->pushPacket(new CInventoryFinishPacket());
                }
                PRecastList->erase(PRecastList->begin() + i--);
                delete recast;
		    }
	    }
    }
}