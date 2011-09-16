/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "packets/inventory_finish.h"
#include "packets/treasure_find_item.h"
#include "packets/treasure_lot_item.h"

#include <string.h>

#include "charutils.h"
#include "mobentity.h"
#include "treasure_pool.h"


#define TREASURE_CHECKTIME		  5000		// частота проверки контейнера - 5 секунд
#define TREASURE_LIVETIME		300000		// время жизни предметов в контейнере - 5 минут

/************************************************************************
*																		*
*  Инициализация TreasurePool											*
*																		*
************************************************************************/

CTreasurePool::CTreasurePool(TREASUREPOOLTYPE PoolType)
{
	m_TreasurePoolType = PoolType;

	for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i)
	{
		m_PoolItems[i].ItemID = 0;
	}
	members.reserve(PoolType);
	ShowDebug(CL_CYAN"TreasurePool::Create\n"CL_RESET);
}

/************************************************************************
*																		*
*  Узнаем текущий тип контейнера										*
*																		*
************************************************************************/

TREASUREPOOLTYPE CTreasurePool::GetPoolType()
{
	return m_TreasurePoolType;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTreasurePool::AddMember(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	members.push_back(PChar);

	if (m_TreasurePoolType == TREASUREPOOL_SOLO && members.size() > 1)
	{
		m_TreasurePoolType = TREASUREPOOL_PARTY;
	}
	ShowDebug(CL_CYAN"TreasurePool::AddMember <%s>\n"CL_RESET, PChar->GetName());
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTreasurePool::DelMember(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	for (int32 i = 0; i < members.size(); ++i) 
	{
		if (PChar == members.at(i))
		{
			PChar->PTreasurePool = NULL;
			members.erase(members.begin()+i);
			break;
		}
	}
	if (m_TreasurePoolType != TREASUREPOOL_ZONE && members.empty())
	{
		ShowDebug(CL_CYAN"TreasurePool::Delete self <%s>\n"CL_RESET, PChar->GetName());
		delete this;
		return;
	}
	ShowDebug(CL_CYAN"TreasurePool::DelMember <%s>\n"CL_RESET, PChar->GetName());
}

/************************************************************************
*																		*
*  Добавляем предмет в хранилище										*
*																		*
************************************************************************/

uint8 CTreasurePool::AddItem(uint16 ItemID)
{	
	/*
	uint8  SlotID;
	uint8  FreeSlotID;
	uint32 oldest = -1;

	for (SlotID = 0; SlotID < 10; ++SlotID) 
	{	
		if (m_PoolItems[SlotID].ItemID == 0) 
		{
			FreeSlotID = SlotID;
			break;
		} 
		else 
		{
			if (m_PoolItems[SlotID].timestamp < oldest) 
			{
				FreeSlotID = SlotID;
				oldest = m_PoolItems[SlotID].timestamp;
			}
		}
	}
	
	if (SlotID == 10) 
	{
		m_PoolItems[FreeSlotID].timestamp = 0;
		CheckItem(FreeSlotID);
	}

	//m_Owner->pushPacket(new CTreasureFindItemPacket(ItemID, FreeSlotID, PMob)); // лучше вынести это сообщение за пределы контейнера. возвращать SlotID

	if (FreeSlotID == 0 &&
		charutils::AddItem(m_Owner, LOC_INVENTORY, ItemID) != 0xFF)
	{
		//m_Owner->pushPacket(new CTreasureLotItemPacket(m_Owner, SlotID, -1, ITEMLOT_WIN));
		//m_Owner->pushPacket(new CInventoryFinishPacket());
		return -1;
	}

	m_PoolItems[FreeSlotID].ItemID = ItemID;
	m_PoolItems[FreeSlotID].timestamp = gettick();
	*/
	return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTreasurePool::UpdatePool(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	if (PChar->status != STATUS_DISAPPEAR)
	{
		for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i) 
		{	
			PChar->pushPacket(new CTreasureFindItemPacket(m_PoolItems[i].ItemID, i, NULL));
		}
		ShowDebug(CL_CYAN"TreasurePool::Update <%s>\n"CL_RESET, PChar->GetName());
	}
}

/************************************************************************
*																		*
*  Персонаж отказывается/голосует за предмет в хранилище				*
*																		*
************************************************************************/

void CTreasurePool::LotItem(uint8 SlotID, uint16 Lot)
{

}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTreasurePool::CheckItems(uint32 tick) 
{	
	if (tick - m_Tick < TREASURE_CHECKTIME)
		return;

	for (uint8 i = 0; i < TREASUREPOOL_SIZE; ++i) 
	{
		CheckItem(i);
	}
	m_Tick = tick;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTreasurePool::CheckItem(uint8 SlotID) 
{
	//m_Owner->pushPacket(new CTreasureLotItemPacket(SlotID, ITEMLOT_WINERROR));
}