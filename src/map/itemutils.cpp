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

#include <string.h>

#include "map.h"
#include "itemutils.h"

#define MaxItemID 20000
#define MaxDropID  2500

CItem *		g_pItemList[MaxItemID];	// глобальный массив указателей на игровые предметы
DropList_t* g_pDropList[MaxDropID];	// глобальный массив списков выпадающих предметов

namespace itemutils
{

CItem* CreateItem(uint16 ItemID) 
{
	if( (ItemID >= 0x0200) && (ItemID <= 0x0206) ) 
	{
		return new CItemLinkshell(ItemID);
	}
	if( (ItemID >= 0x01D8) && (ItemID <= 0x0DFF) ) 
	{
		return new CItemGeneral(ItemID);
	}
	if( (ItemID >= 0x0000) && (ItemID <= 0x0FFF) ) 
	{
		return new CItemFurnishing(ItemID);
	}
	if( (ItemID >= 0x1000) && (ItemID <= 0x17FF) ) 
	{
		return new CItemUsable(ItemID);
	}
	if( (ItemID >= 0x2000) && (ItemID <= 0x21FF) ) 
	{
		return new CItemPuppet(ItemID);
	}
	if( (ItemID >= 0x2800) && (ItemID <= 0x3FFF) ) 
	{
		return new CItemArmor(ItemID);
	}
	if( (ItemID >= 0x4000) && (ItemID <= 0x4DFF) ) 
	{
		return new CItemWeapon(ItemID);
	}

	return NULL;
}

CItem* GetItem(uint16 ItemID)
{
	if( (ItemID == 0xFFFF) ) 
	{
		return new CItemCurrency(ItemID);
	}

	if (ItemID < MaxItemID && g_pItemList[ItemID] != NULL)
	{
		if( (ItemID >= 0x0200) && (ItemID <= 0x0206) ) 
		{
			return new CItemLinkshell(*((CItemLinkshell*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x01D8) && (ItemID <= 0x0DFF) ) 
		{
			return new CItemGeneral(*((CItemGeneral*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x0000) && (ItemID <= 0x0FFF) ) 
		{
			return new CItemFurnishing(*((CItemFurnishing*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x1000) && (ItemID <= 0x17FF) ) 
		{
			return new CItemUsable(*((CItemUsable*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x2000) && (ItemID <= 0x21FF) ) 
		{
			return new CItemPuppet(*((CItemPuppet*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x2800) && (ItemID <= 0x3FFF) ) 
		{
			return new CItemArmor(*((CItemArmor*)g_pItemList[ItemID]));
		}
		if( (ItemID >= 0x4000) && (ItemID <= 0x4DFF) ) 
		{
			return new CItemWeapon(*((CItemWeapon*)g_pItemList[ItemID]));
		}
	}

	return NULL;
}

CItem* GetItemPointer(uint16 ItemID)
{
	if (ItemID < MaxItemID)
	{
		return g_pItemList[ItemID];
	}
	return NULL;
}	

DropList_t* GetDropList(uint16 DropID)
{
	if (DropID < MaxDropID)
	{
		 return g_pDropList[DropID];
	}
	return NULL;
}

void LoadItemList()
{
	memset(g_pItemList,0,sizeof(g_pItemList));
	memset(g_pDropList,0,sizeof(g_pDropList));

	const int8* fmtQuery = "SELECT b.itemId, b.name, b.stackSize, b.flags, b.aH, b.BaseSell, \
								   u.subid, u.validTargets, u.activation, u.animation, u.animationTime, u.maxCharges, u.useDelay, u.reuseDelay, \
								   a.level, a.jobs, a.MId, a.shieldSize, a.scriptType, a.slot, a.rslot, \
								   w.skill, w.delay, w.dmg, w.dmgType, \
								   f.storage, f.moghancement, f.element, f.aura \
							FROM item_basic AS b \
							LEFT JOIN item_usable AS u USING (itemId) \
							LEFT JOIN item_armor  AS a USING (itemId) \
							LEFT JOIN item_weapon AS w USING (itemId) \
							LEFT JOIN item_furnishing AS f USING (itemId) \
							WHERE itemId < %u;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,MaxItemID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CItem* PItem = CreateItem(Sql_GetUIntData(SqlHandle,0));

			if(PItem != NULL)
			{
				PItem->setName(Sql_GetData(SqlHandle,1));
				PItem->setStackSize(Sql_GetUIntData(SqlHandle,2));
				PItem->setFlag(Sql_GetUIntData(SqlHandle,3));
				PItem->setAHCat(Sql_GetUIntData(SqlHandle,4));
				PItem->setBasePrice(Sql_GetUIntData(SqlHandle,5));
				
				if (PItem->getType() & ITEM_GENERAL)
				{

				}

				if (PItem->getType() & ITEM_USABLE)
				{
					((CItemUsable*)PItem)->setSubID(Sql_GetUIntData(SqlHandle,6));
					((CItemUsable*)PItem)->setValidTarget(Sql_GetUIntData(SqlHandle,7));
					((CItemUsable*)PItem)->setActivationTime(Sql_GetUIntData(SqlHandle,8)*1000);
					((CItemUsable*)PItem)->setAnimationID(Sql_GetUIntData(SqlHandle,9));
					((CItemUsable*)PItem)->setAnimationTime(Sql_GetUIntData(SqlHandle,10)*1000);
					((CItemUsable*)PItem)->setMaxCharges(Sql_GetUIntData(SqlHandle,11));
					((CItemUsable*)PItem)->setCurrentCharges(Sql_GetUIntData(SqlHandle,11));
					((CItemUsable*)PItem)->setUseDelay(Sql_GetUIntData(SqlHandle,12));
					((CItemUsable*)PItem)->setReuseDelay(Sql_GetUIntData(SqlHandle,13));
				}

				if (PItem->getType() & ITEM_PUPPET)
				{

				}

				if (PItem->getType() & ITEM_ARMOR)
				{
					((CItemArmor*)PItem)->setReqLvl(Sql_GetUIntData(SqlHandle,14));
					((CItemArmor*)PItem)->setJobs(Sql_GetUIntData(SqlHandle,15));
					((CItemArmor*)PItem)->setModelId(Sql_GetUIntData(SqlHandle,16));
					((CItemArmor*)PItem)->setShieldSize(Sql_GetUIntData(SqlHandle,17));
					((CItemArmor*)PItem)->setScriptType(Sql_GetUIntData(SqlHandle,18));
					((CItemArmor*)PItem)->setEquipSlotId(Sql_GetUIntData(SqlHandle,19));
					((CItemArmor*)PItem)->setRemoveSlotId(Sql_GetUIntData(SqlHandle,20));

					if (((CItemArmor*)PItem)->getValidTarget() != 0)
					{
						((CItemArmor*)PItem)->setSubType(ITEM_CHARGED);
					}
				}

				if (PItem->getType() & ITEM_WEAPON)
				{
					((CItemWeapon*)PItem)->setSkillType(Sql_GetUIntData(SqlHandle,21));
					((CItemWeapon*)PItem)->setDelay((Sql_GetUIntData(SqlHandle,22)*1000)/60);
					((CItemWeapon*)PItem)->setDamage(Sql_GetUIntData(SqlHandle,23));
					((CItemWeapon*)PItem)->setDmgType(Sql_GetUIntData(SqlHandle,24));
				}

				if (PItem->getType() & ITEM_FURNISHING)
				{
					((CItemFurnishing*)PItem)->setStorage(Sql_GetUIntData(SqlHandle,25));
					((CItemFurnishing*)PItem)->setMoghancement(Sql_GetUIntData(SqlHandle,26));
					((CItemFurnishing*)PItem)->setElement(Sql_GetUIntData(SqlHandle,27));
					((CItemFurnishing*)PItem)->setAura(Sql_GetUIntData(SqlHandle,28));
				}

				g_pItemList[PItem->getID()] = PItem;
			}
		}
	}
	
	ret = Sql_Query(SqlHandle,"SELECT itemId, modId, value FROM item_mods;");

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			uint16 ItemID = (uint16)Sql_GetUIntData(SqlHandle,0);
			uint16 modID  = (uint16)Sql_GetUIntData(SqlHandle,1);
			int16  value  = (int16) Sql_GetIntData (SqlHandle,2);

			if ((g_pItemList[ItemID] != NULL) &&
				(g_pItemList[ItemID]->getType() & ITEM_ARMOR))
			{
				((CItemArmor*)g_pItemList[ItemID])->modList.push_back(new CModifier(modID,value));
			}
		}
	}

	ret = Sql_Query(SqlHandle,"SELECT dropId, itemId, type, rate FROM mob_droplist;");

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			uint16 DropID  = (uint16)Sql_GetUIntData(SqlHandle,0);

			if (DropID < MaxDropID)
			{
				if (g_pDropList[DropID] == 0)
				{
					g_pDropList[DropID] = new DropList_t;
				}

				DropItem_t DropItem;

				DropItem.ItemID  = (uint16)Sql_GetUIntData(SqlHandle,1);
				DropItem.DropType = (uint8)Sql_GetUIntData(SqlHandle,2);
				DropItem.DropRate = (uint8)Sql_GetUIntData(SqlHandle,3);

				g_pDropList[DropID]->push_back(DropItem);
			}
		}
	}
}

void FreeItemList()
{
	for(int32 ItemID = 0; ItemID < MaxItemID; ++ItemID)
	{
		if ((g_pItemList[ItemID] != NULL) &&
			(g_pItemList[ItemID]->getType() & ITEM_ARMOR))
		{
			CItemArmor* PItem = (CItemArmor*)g_pItemList[ItemID];

			for (uint32 i = 0; i < PItem->modList.size(); ++i)
			{
				delete PItem->modList.at(i);
			}
			PItem->modList.clear();
		}
		delete g_pItemList[ItemID];
	}

	for(int32 DropID = 0; DropID < MaxDropID; ++DropID)
	{
		delete g_pDropList[DropID];
	}
}

}; // namespace itemutils
