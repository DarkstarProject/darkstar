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

#include "../common/utils.h"

#include <string.h>

#include "packets/char_update.h"
#include "packets/chat_message.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/linkshell_equip.h"
#include "packets/message_system.h"

#include "utils/charutils.h"
#include "conquest_system.h"
#include "utils/itemutils.h"
#include "linkshell.h"
#include "message.h"
#include "items/item_linkshell.h"
#include "utils/jailutils.h"
#include "map.h"
#include "item_container.h"
#include "packets/linkshell_message.h"

/************************************************************************
*                                                                       *
*  Реализация класса CLinkshell                                         *
*                                                                       *
************************************************************************/

CLinkshell::CLinkshell(std::uint32_t id)
{
    m_id = id;
}

std::uint32_t CLinkshell::getID()
{
    return m_id;
}

std::uint16_t CLinkshell::getColor()
{
    return m_color;
}

void CLinkshell::setColor(std::uint16_t color)
{
    m_color = color;
}

const std::int8_t* CLinkshell::getName()
{
    return (const std::int8_t*)m_name.c_str();
}

void CLinkshell::setName(std::int8_t* name)
{
	m_name.clear();
	m_name.insert(0, (const char*)name);
}

void CLinkshell::setMessage(const std::int8_t* message, const std::int8_t* poster)
{
    char sqlMessage[256];
    Sql_EscapeString(SqlHandle, sqlMessage, (const char*)message);
    Sql_Query(SqlHandle, "UPDATE linkshells SET poster = '%s', message = '%s', messagetime = %u WHERE linkshellid = %d;",
        poster, sqlMessage , static_cast<std::uint32_t>(time(nullptr)), m_id);

    std::int8_t packetData[8] {};
    WBUFL(packetData, 0) = m_id;
    WBUFL(packetData, 4) = 0;
    message::send(MSG_CHAT_LINKSHELL, packetData, sizeof packetData, new CLinkshellMessagePacket(poster, message, (const std::int8_t*)m_name.c_str(), std::numeric_limits<std::uint32_t>::min(), true));
}

/************************************************************************
*                                                                       *
*  Добавляем персонажа в список активных участников Linkshells          *
*                                                                       *
************************************************************************/

void CLinkshell::AddMember(CCharEntity* PChar, std::int8_t type, std::uint8_t lsNum)
{
    members.push_back(PChar);
    if (lsNum == 1)
    {
        Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid1 = %u , linkshellrank1 = %u WHERE charid = %u", this->getID(), type, PChar->id);
        PChar->PLinkshell1 = this;
    }
    else
    {
        Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid2 = %u , linkshellrank2 = %u WHERE charid = %u", this->getID(), type, PChar->id);
        PChar->PLinkshell2 = this;
    }
}

/************************************************************************
*                                                                       *
*  Удаляем персонажа из списка активных участников Linkshells           *
*                                                                       *
************************************************************************/

bool CLinkshell::DelMember(CCharEntity* PChar)
{
    for (std::uint32_t i = 0; i < members.size(); ++i)
	{
        if (members.at(i) == PChar)
        {
            if (PChar->PLinkshell1 == this)
            {
                Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid1 = 0 , linkshellrank1 = 0 WHERE charid = %u", PChar->id);
                PChar->PLinkshell1 = nullptr;
            }
            else if (PChar->PLinkshell2 == this)
            {
                Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid2 = 0 , linkshellrank2 = 0 WHERE charid = %u", PChar->id);
                PChar->PLinkshell2 = nullptr;
            }
            members.erase(members.begin() + i);
            break;
        }
    }
    if (members.empty()) { return false; }
    return true;
}

/************************************************************************
*                                                                       *
*  Promotes or demotes the target member		(linkshell)				*
*                                                                       *
************************************************************************/

void CLinkshell::ChangeMemberRank(std::int8_t* MemberName, std::uint8_t toSack)
{
	//topearl = 3
	//tosack = 2
	int newId = 512 + toSack;
	
    if (newId == 514 || newId == 515)
    {
	    for (std::uint32_t i = 0; i < members.size(); ++i) 
	    {
		    if (strcmp((const char*)MemberName, (const char*)members.at(i)->GetName()) == 0)
		    {
                CCharEntity* PMember = (CCharEntity*)members.at(i);

                SLOTTYPE slot = SLOT_LINK1;
                int lsID = 1;
                if (PMember->PLinkshell2 == this)
                {
                    lsID = 2;
                    slot = SLOT_LINK2;
                }

                CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PMember->getEquip(slot);

                if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL) && PItemLinkshell->GetLSID() == m_id)
                {
                    CItemLinkshell* newShellItem = (CItemLinkshell*)itemutils::GetItem(newId);
                    if (newShellItem == nullptr)
                        return;
                    newShellItem->setQuantity(1);
                    memcpy(newShellItem->m_extra, PItemLinkshell->m_extra, 24);
                    newShellItem->setSubType(ITEM_LOCKED);
                    std::uint8_t SlotID = PItemLinkshell->getSlotID();
                    delete PItemLinkshell;
                    PItemLinkshell = newShellItem;

                    PMember->getStorage(LOC_INVENTORY)->InsertItem(PItemLinkshell, SlotID);
                    const char* Query = "UPDATE char_inventory SET itemid = %u WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";
                    Sql_Query(SqlHandle, Query, PItemLinkshell->getID(), PMember->id, LOC_INVENTORY, SlotID);
                    if (lsID == 1)
                    {
                        Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid1 = %u , linkshellrank1 = %u WHERE charid = %u",
                            m_id, PItemLinkshell->GetLSType(), PMember->id);
                    }
                    else if (lsID == 2)
                    {
                        Sql_Query(SqlHandle, "UPDATE accounts_sessions SET linkshellid2 = %u , linkshellrank2 = %u WHERE charid = %u",
                            m_id, PItemLinkshell->GetLSType(), PMember->id);
                    }

                    PMember->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
                    PMember->pushPacket(new CLinkshellEquipPacket(PMember, lsID));
                    PMember->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
                }
	        
                charutils::SaveCharStats(PMember);
                charutils::SaveCharEquip(PMember);

                PMember->pushPacket(new CInventoryFinishPacket());
                PMember->pushPacket(new CCharUpdatePacket(PMember));
			    return;
		    } 
	    }
    }
}

/************************************************************************
*                                                                       *
*  Удаление персонажа из Linkshell по имени (ломаем все его Linkshells) *
*                                                                       *
************************************************************************/

void CLinkshell::RemoveMemberByName(std::int8_t* MemberName)
{
	for (std::uint32_t i = 0; i < members.size(); ++i) 
	{
		if (strcmp((const char*)MemberName, (const char*)members.at(i)->GetName()) == 0)
		{
            CCharEntity* PMember = (CCharEntity*)members.at(i);

            CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PMember->getEquip(SLOT_LINK1);
            SLOTTYPE slot = SLOT_LINK1;
            int lsNum = 1;

            if (!PItemLinkshell || (PItemLinkshell->GetLSID() != this->getID()))
            {
                PItemLinkshell = (CItemLinkshell*)PMember->getEquip(SLOT_LINK2);
                slot = SLOT_LINK2;
                lsNum = 2;
            }

            if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL))
            {
                linkshell::DelOnlineMember(PMember, PItemLinkshell);

                PItemLinkshell->setSubType(ITEM_UNLOCKED);

                PMember->equip[slot] = 0;
                if (slot == SLOT_LINK1)
                {
                    PMember->nameflags.flags &= ~FLAG_LINKSHELL;
                    PMember->updatemask |= UPDATE_HP;
                }

                PMember->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
                PMember->pushPacket(new CLinkshellEquipPacket(PMember,lsNum));
            }

			CItemContainer* Inventory = PMember->getStorage(LOC_INVENTORY);
            for (std::uint8_t SlotID = 0; SlotID < Inventory->GetSize(); ++SlotID)
            {
                    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)Inventory->GetItem(SlotID);

					if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL) && PItemLinkshell->GetLSID() == m_id)
		            {
                        const char* Query = "UPDATE char_inventory SET itemid = (itemid+2) WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";

                        Sql_Query(SqlHandle, Query, PMember->id, LOC_INVENTORY, SlotID);

                        PItemLinkshell->SetLSID(0);
                        PItemLinkshell->setID(PItemLinkshell->getID() + 2);

                        PMember->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
		            }
            }
	        
            charutils::SaveCharStats(PMember);
            charutils::SaveCharEquip(PMember);

            PMember->pushPacket(new CInventoryFinishPacket());
            PMember->pushPacket(new CCharUpdatePacket(PMember));
            PMember->pushPacket(new CMessageSystemPacket(0,0,109));
			return;
		} 
	}
}

/************************************************************************
*                                                                       *
*  Отправляем пакет всем членам Linkshells, за исключением PChar        *
*                                                                       *
************************************************************************/

void CLinkshell::PushPacket(std::uint32_t senderID, CBasicPacket* packet)
{
    for (std::uint32_t i = 0; i < members.size(); ++i)
	{
        if (members.at(i)->id != senderID &&
            members.at(i)->status != STATUS_DISAPPEAR &&
            !jailutils::InPrison(members.at(i)))
		{
            CBasicPacket* newPacket = new CBasicPacket(*packet);
            if (members.at(i)->PLinkshell2 == this)
            {
                if (newPacket->id() == CChatMessagePacket::id) {
                    newPacket->ref<std::uint8_t>(0x04) = MESSAGE_LINKSHELL2;
                }
                else if (newPacket->id() == CLinkshellMessagePacket::id) {
                    newPacket->ref<std::uint8_t>(0x05) |= 0x40;
                }
            }
            members.at(i)->pushPacket(newPacket);
		}
	}
    delete packet;
}

void CLinkshell::PushLinkshellMessage(CCharEntity* PChar, bool ls1)
{
    auto ret = Sql_Query(SqlHandle, "SELECT poster, message, messagetime FROM linkshells WHERE linkshellid = %u", m_id);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        PChar->pushPacket(new CLinkshellMessagePacket(Sql_GetData(SqlHandle, 0), Sql_GetData(SqlHandle, 1),
            (const std::int8_t*)m_name.c_str(), Sql_GetUIntData(SqlHandle, 2), ls1));
    }
}

/************************************************************************
*                                                                       *
*  Реализация namespase для работы с Linkshells                         *
*                                                                       *
************************************************************************/

namespace linkshell
{
    std::map<std::uint32_t, std::unique_ptr<CLinkshell>> LinkshellList;

    /************************************************************************
    *                                                                       *
    *  Загружаем список зарегистрированных Linkshells                       *
    *                                                                       *
    ************************************************************************/

    CLinkshell* LoadLinkshell(std::uint32_t id)
    {
	    std::int32_t ret = Sql_Query(SqlHandle, "SELECT linkshellid, color, name FROM linkshells WHERE linkshellid = %d", id);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	    {
            auto PLinkshell = std::make_unique<CLinkshell>(Sql_GetUIntData(SqlHandle,0));
        
            PLinkshell->setColor(Sql_GetIntData(SqlHandle,1));
            std::int8_t EncodedName[16];
            EncodeStringLinkshell(Sql_GetData(SqlHandle,2), EncodedName);
            PLinkshell->setName(EncodedName);
            LinkshellList[id] = std::move(PLinkshell);

            return LinkshellList[id].get();
	    }
        return nullptr;
    }

    /************************************************************************
    *                                                                       *
    *  Добавляем персонажа в список Linkshell                               *
    *                                                                       *
    ************************************************************************/

    bool AddOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell, std::uint8_t lsNum)
    {
        DSP_DEBUG_BREAK_IF(PChar == nullptr);
        if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL))
        {
            CLinkshell* PLinkshell = nullptr;
            try
            {
                PLinkshell = LinkshellList.at(PItemLinkshell->GetLSID()).get();
            }
            catch (std::out_of_range&)
            {
                PLinkshell = LoadLinkshell(PItemLinkshell->GetLSID());
            }
            if (PLinkshell)
            {
                PLinkshell->AddMember(PChar, PItemLinkshell->GetLSType(), lsNum);
            }
        }
        return false;
    }

    /************************************************************************
    *                                                                       *
    *  Удаляем персонажа из списка Lilkshell                                *
    *                                                                       *
    ************************************************************************/

    bool DelOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell)
    {
        DSP_DEBUG_BREAK_IF(PChar == nullptr);
        if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL))
        {
            try
            {
                CLinkshell* Linkshell = LinkshellList.at(PItemLinkshell->GetLSID()).get();
                if (!Linkshell->DelMember(PChar))
                {
                    LinkshellList.erase(PItemLinkshell->GetLSID());
                }
            }
            catch (std::out_of_range&)
            {
            }
        }
        return false;
    }

    /************************************************************************
    *                                                                       *
    *  Проверяем строку на возможность использования в качестве имени LS    *
    *                                                                       *
    ************************************************************************/

    bool IsValidLinkshellName(const std::int8_t* name)
    {
        auto ret = Sql_Query(SqlHandle, "SELECT linkshellid FROM linkshells WHERE name = '%s';", name);
        return ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0;
    }

    /************************************************************************
    *                                                                       *
    *  Регистрируем новую linkshell                                         *
    *                                                                       *
    ************************************************************************/

    std::uint32_t RegisterNewLinkshell(const std::int8_t* name, std::uint16_t color)
    {
        if (IsValidLinkshellName(name))
        {
		    if (Sql_Query(SqlHandle, "INSERT INTO linkshells (name, color) VALUES ('%s', %u)", name, color) != SQL_ERROR)
            {
                return LoadLinkshell((std::uint32_t)Sql_LastInsertId(SqlHandle))->getID();
            }
        }
        return 0;
    }

	CLinkshell* GetLinkshell(std::uint32_t id)
	{
		try
		{
			return LinkshellList.at(id).get();
		}
		catch (const std::out_of_range&)
		{
			return nullptr;
		}
	}
};