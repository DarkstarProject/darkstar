/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/linkshell_equip.h"
#include "packets/message_system.h"

#include "utils/charutils.h"
#include "conquest_system.h"
#include "utils/itemutils.h"
#include "linkshell.h"
#include "items/item_linkshell.h"
#include "utils/jailutils.h"
#include "map.h"

/************************************************************************
*                                                                       *
*  Реализация класса CLinkshell                                         *
*                                                                       *
************************************************************************/

CLinkshell::CLinkshell(uint32 id)
{
    m_id = id;
}

uint32 CLinkshell::getID()
{
    return m_id;
}

uint16 CLinkshell::getColor()
{
    return m_color;
}

void CLinkshell::setColor(uint16 color)
{
    m_color = color;
}

const int8* CLinkshell::getName()
{
    return m_name.c_str();
}

void CLinkshell::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

const int8* CLinkshell::getPoster()
{
    return m_poster.c_str();
}

void CLinkshell::setPoster(int8* poster)
{
    m_poster.clear();
	m_poster.insert(0,poster);
}

const int8* CLinkshell::getMessage()
{
    return m_message.c_str();
}

void CLinkshell::setMessage(int8* message)
{
    m_message.clear();
	m_message.insert(0,message);
}

uint32 CLinkshell::getMessageTime()
{
    return m_time;
}

void CLinkshell::setMessageTime(uint32 time)
{
    m_time = time;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажа в список активных участников Linkshells          *
*                                                                       *
************************************************************************/

void CLinkshell::AddMember(CCharEntity* PChar, int8 type)
{
    members.push_back(PChar);
	Sql_Query(SqlHandle,"UPDATE accounts_sessions SET linkshellid = %u , linkshellrank = %u WHERE charid = %u", this->getID(),type, PChar->id);
    PChar->PLinkshell = this;
}

/************************************************************************
*                                                                       *
*  Удаляем персонажа из списка активных участников Linkshells           *
*                                                                       *
************************************************************************/

void CLinkshell::DelMember(CCharEntity* PChar)
{
    for (uint32 i = 0; i < members.size(); ++i)
	{
        if (members.at(i) == PChar)
        {
			Sql_Query(SqlHandle,"UPDATE accounts_sessions SET linkshellid = 0 , linkshellrank = 0 WHERE charid = %u", PChar->id);
            members.erase(members.begin()+i);
            break;
        }
    }
    PChar->PLinkshell = NULL;
}

/************************************************************************
*                                                                       *
*  Promotes or demotes the target member		(linkshell)				*
*                                                                       *
************************************************************************/

void CLinkshell::ChangeMemberRank(int8* MemberName, uint8 toSack)
{
	//topearl = 3
	//tosack = 2
	int newId = 512 + toSack;
	
    if (newId == 514 || newId == 515)
    {
	    for (uint32 i = 0; i < members.size(); ++i) 
	    {
		    if (strcmp(MemberName, members.at(i)->GetName()) == 0)
		    {
                CCharEntity* PMember = (CCharEntity*)members.at(i);

                CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PMember->getEquip(SLOT_LINK);

                if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL))
                {
				    PItemLinkshell->setID(newId);

                    PMember->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
                    PMember->pushPacket(new CLinkshellEquipPacket(PMember));
                }

			    CItemContainer* Inventory = PMember->getStorage(LOC_INVENTORY);
                for (uint8 SlotID = 0; SlotID < Inventory->GetSize(); ++SlotID)
                {
                        CItemLinkshell* PItemLinkshell = (CItemLinkshell*)Inventory->GetItem(SlotID);

					    if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL) && PItemLinkshell->GetLSID() == m_id)
		                {
                            const int8* Query = "UPDATE char_inventory SET itemid = %u WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";
						    Sql_Query(SqlHandle, Query, PItemLinkshell->getID(),PMember->id, LOC_INVENTORY, SlotID);
						    Sql_Query(SqlHandle,"UPDATE accounts_sessions SET linkshellid = %u , linkshellrank = %u WHERE charid = %u", 
										    m_id,PItemLinkshell->GetLSType(), PMember->id);
                            PMember->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
		                }
                }
	        
                charutils::SaveCharStats(PMember);
                charutils::SaveCharEquip(PMember);

                if (PMember->status == STATUS_NORMAL) PMember->status = STATUS_UPDATE;

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

void CLinkshell::RemoveMemberByName(int8* MemberName)
{
	for (uint32 i = 0; i < members.size(); ++i) 
	{
		if (strcmp(MemberName, members.at(i)->GetName()) == 0)
		{
            CCharEntity* PMember = (CCharEntity*)members.at(i);

            CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PMember->getEquip(SLOT_LINK);

            if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL))
            {
                linkshell::DelOnlineMember(PMember, PItemLinkshell);

                PItemLinkshell->setSubType(ITEM_UNLOCKED);

                PMember->equip[SLOT_LINK] = 0;
                PMember->nameflags.flags &= ~FLAG_LINKSHELL;

                PMember->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
                PMember->pushPacket(new CLinkshellEquipPacket(PMember));
            }

			CItemContainer* Inventory = PMember->getStorage(LOC_INVENTORY);
            for (uint8 SlotID = 0; SlotID < Inventory->GetSize(); ++SlotID)
            {
                    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)Inventory->GetItem(SlotID);

					if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL) && PItemLinkshell->GetLSID() == m_id)
		            {
                        const int8* Query = "UPDATE char_inventory SET itemid = (itemid+2) WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";

                        Sql_Query(SqlHandle, Query, PMember->id, LOC_INVENTORY, SlotID);

                        PItemLinkshell->SetLSID(0);
                        PItemLinkshell->setID(PItemLinkshell->getID() + 2);

                        PMember->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
		            }
            }
	        
            charutils::SaveCharStats(PMember);
            charutils::SaveCharEquip(PMember);

            if (PMember->status == STATUS_NORMAL) PMember->status = STATUS_UPDATE;

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

void CLinkshell::PushPacket(uint32 senderID, CBasicPacket* packet)
{
    for (uint32 i = 0; i < members.size(); ++i)
	{
        if (members.at(i)->id != senderID &&
            members.at(i)->status != STATUS_DISAPPEAR &&
            !jailutils::InPrison(members.at(i)))
		{
            members.at(i)->pushPacket(new CBasicPacket(*packet));
		}
	}
    delete packet;
}

/************************************************************************
*                                                                       *
*  Реализация namespase для работы с Linkshells                         *
*                                                                       *
************************************************************************/

typedef std::map<uint32,CLinkshell*> LinkshellList_t;

namespace linkshell
{
    LinkshellList_t LinkshellList;

    /************************************************************************
    *                                                                       *
    *  Загружаем список зарегистрированных Linkshells                       *
    *                                                                       *
    ************************************************************************/

    void LoadLinkshellList()
    {
	    int32 ret = Sql_Query(SqlHandle, "SELECT linkshellid, color, name, poster, message, messagetime FROM linkshells");

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
			    CLinkshell* PLinkshell = new CLinkshell(Sql_GetUIntData(SqlHandle,0));
			
			    PLinkshell->setColor(Sql_GetIntData(SqlHandle,1));
                int8 EncodedName[16];
                EncodeStringLinkshell(Sql_GetData(SqlHandle,2), EncodedName);
                PLinkshell->setName(EncodedName);
                PLinkshell->setPoster(Sql_GetData(SqlHandle,3));

                int8* linkshellMessage = Sql_GetData(SqlHandle, 4);
                if (linkshellMessage != NULL)
                    PLinkshell->setMessage(linkshellMessage);
                else
                    PLinkshell->setMessage("");
                PLinkshell->setMessageTime(Sql_GetUIntData(SqlHandle,5));

                LinkshellList[PLinkshell->getID()] = PLinkshell;
		    }
	    }
    }

    /************************************************************************
    *                                                                       *
    *  Добавляем персонажа в список Linkshell                               *
    *                                                                       *
    ************************************************************************/

    bool AddOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell)
    {
        DSP_DEBUG_BREAK_IF(PChar == NULL);
        if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL))
        {
            LinkshellList_t::const_iterator it = LinkshellList.find(PItemLinkshell->GetLSID()); 
			if (it != LinkshellList.end())
			{
                it->second->AddMember(PChar,PItemLinkshell->GetLSType());
                ShowDebug(CL_CYAN"linkshell:AddOnlineMember <%u>\n" CL_RESET, it->first);
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
        DSP_DEBUG_BREAK_IF(PChar == NULL);
        if (PItemLinkshell != NULL && PItemLinkshell->isType(ITEM_LINKSHELL))
        {
            LinkshellList_t::const_iterator it = LinkshellList.find(PItemLinkshell->GetLSID()); 
			if (it != LinkshellList.end())
			{
				it->second->DelMember(PChar);

                ShowDebug(CL_CYAN"linkshell:DelOnlineMember <%u>\n" CL_RESET, it->first);
			}
        }
        return false;
    }

    /************************************************************************
    *                                                                       *
    *  Проверяем строку на возможность использования в качестве имени LS    *
    *                                                                       *
    ************************************************************************/

    bool IsValidLinkshellName(const int8* name)
    {
        for (LinkshellList_t::iterator it = LinkshellList.begin(); it != LinkshellList.end() ; ++it)
	    {
            if (strcmp(it->second->getName(), name) == 0) return false;
        }
        return true;
    }

    /************************************************************************
    *                                                                       *
    *  Регистрируем новую linkshell                                         *
    *                                                                       *
    ************************************************************************/

    uint32 RegisterNewLinkshell(const int8* name, uint16 color)
    {
        if (IsValidLinkshellName(name))
        {
		    if (Sql_Query(SqlHandle, "INSERT INTO linkshells (name, color) VALUES ('%s', %u)", name, color) != SQL_ERROR)
            {
                CLinkshell* PLinkshell = new CLinkshell(Sql_LastInsertId(SqlHandle));
			
			    PLinkshell->setColor(color);
                PLinkshell->setName((int8*)name);
                PLinkshell->setMessage("");
                
                LinkshellList[PLinkshell->getID()] = PLinkshell;

                return PLinkshell->getID();
            }
        }
        return 0;
    }

	CLinkshell* GetLinkshell(uint32 id)
	{
		try
		{
			return LinkshellList.at(id);
		}
		catch (const std::out_of_range& oor)
		{
			return NULL;
		}
	}
};