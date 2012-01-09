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

	for (uint32 i = 0; i < members.size(); ++i) 
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

uint8 CTreasurePool::AddItem(uint16 ItemID, CMobEntity* PMob)
{	
	uint8  SlotID;
	uint8  FreeSlotID;
	uint32 oldest = -1;

    // нам нужно общее количество хранимых в данный момент предметов
    // все предметы располагаются последовательно, без пробелов

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
	
	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureFindItemPacket(ItemID, FreeSlotID, PMob)); // лучше вынести это сообщение за пределы контейнера. возвращать SlotID
	}

    if (members.size() == 1) //Attempt to award for solo play
	{
		if (charutils::AddItem(members[0], LOC_INVENTORY, ItemID) != ERROR_SLOTID)
		{
		    members[0]->pushPacket(new CTreasureLotItemPacket(members[0], SlotID, -1, ITEMLOT_WIN));
		    members[0]->pushPacket(new CInventoryFinishPacket());
		    return -1;
		}
    }
	
	m_PoolItems[FreeSlotID].ItemID = ItemID;
	m_PoolItems[FreeSlotID].timestamp = gettick();
	
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

void CTreasurePool::LotItem(CCharEntity* PChar, uint8 SlotID, uint16 Lot)
{
    DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != this);

	ShowDebug(CL_RED"Loot Item: Lot Pool Members: %u  Members in Party: %u \n"CL_RESET, m_PoolItems[SlotID].ItemLotters.size(), members.size());	
	
    // TODO: а если персонаж из середины списка покинет группу ? ^^

	for (uint32 i = 0; i < members.size(); ++i) 
	{
		if (members[i]->id == PChar->id)
		{
			ShowDebug(CL_RED"Member: %u \n"CL_RESET, i); 
			m_PoolItems[SlotID].ItemLotters[i] = Lot;
		}
	}
	
	for (uint32 i = 0; i < members.size(); ++i) 
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(PChar, SlotID, Lot)); 
	}

    // TODO: первый проголосовал, а остальных не ждем ? ^^

	if (m_PoolItems[SlotID].ItemLotters.size() >= members.size())
	{
		m_PoolItems[SlotID].timestamp = 0; 
		CheckItem(SlotID);
	}
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
	TeasurePoolItem poolItem = m_PoolItems[SlotID]; 
		
	if (poolItem.ItemID == 0)
	{
		return;
	}
	
	if (poolItem.timestamp == 0 || ((gettick() - poolItem.timestamp) > TREASURE_LIVETIME)) //Treasure beyond livetime
	{
		if (m_PoolItems[SlotID].ItemLotters.size() > 0)
		{
			int WinningLot = 0; 
			int WinningLotter = 0; 

			for (uint32 i = 0; i < m_PoolItems[SlotID].ItemLotters.size(); ++i)
			{
			    if (poolItem.ItemLotters[i] > WinningLot)
				{
					WinningLot = poolItem.ItemLotters[i];
					WinningLotter = i; 
				}
			}
			if (WinningLot == 0)
			{
				for (uint32 i = 0; i < members.size(); ++i)
				{
					members[i]->pushPacket(new CTreasureLotItemPacket(members[i], SlotID, -1, ITEMLOT_LOST)); 
					members[i]->pushPacket(new CInventoryFinishPacket());
				}
			}
			else if(charutils::AddItem(members[WinningLotter], LOC_INVENTORY, poolItem.ItemID) != ERROR_SLOTID) 
			{
				for (uint32 i = 0; i < members.size(); ++i)
				{
					members[i]->pushPacket(new CTreasureLotItemPacket(members[WinningLotter], SlotID, -1, ITEMLOT_WIN));
					members[i]->pushPacket(new CInventoryFinishPacket());
				}
			}
			else
			{
				for (uint32 i = 0; i < members.size(); ++i)
				{
					members[i]->pushPacket(new CTreasureLotItemPacket(SlotID, ITEMLOT_WINERROR)); 
					members[i]->pushPacket(new CInventoryFinishPacket());
				}
			}
		}
		else
		{
			TreasureLost(SlotID); // TODO: какая-то батва. почему в слот улетает ItemID ? // TreasureLost(poolItem.ItemID);
		}
	
		m_PoolItems[SlotID].timestamp = 0; 
		m_PoolItems[SlotID].ItemID = 0;
	}	
}

void CTreasurePool::TreasureWon(CCharEntity* winner, uint8 SlotID) 
{
    DSP_DEBUG_BREAK_IF(winner == NULL);
	DSP_DEBUG_BREAK_IF(winner->PTreasurePool != this);

	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(winner, SlotID, -1, ITEMLOT_WIN));
		members[i]->pushPacket(new CInventoryFinishPacket());
	}
}

void CTreasurePool::TreasureLost(uint8 SlotID) 
{
	for (uint32 i = 0; i < members.size(); ++i)
	{
		members[i]->pushPacket(new CTreasureLotItemPacket(members[i], SlotID, -1, ITEMLOT_WINERROR)); 
		members[i]->pushPacket(new CInventoryFinishPacket());
	}
}
