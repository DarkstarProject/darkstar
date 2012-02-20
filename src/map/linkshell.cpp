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

#include "../common/utils.h"

#include "packets/basic.h"

#include "charentity.h"
#include "itemutils.h"
#include "linkshell.h"
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

/************************************************************************
*                                                                       *
*  Отправляем пакет всем членам Linkshells, за исключением PChar        *
*                                                                       *
************************************************************************/

void CLinkshell::PushPacket(CCharEntity* PChar, CBasicPacket* packet)
{
    for (uint32 i = 0; i < members.size(); ++i)
	{
        if (members.at(i) != PChar &&
            members.at(i)->status != STATUS_DISAPPEAR)
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
	    int32 ret = Sql_Query(SqlHandle, "SELECT linkshellid, color, name, poster, message FROM linkshells");

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
			    CLinkshell* PLinkshell = new CLinkshell(Sql_GetUIntData(SqlHandle,0));
			
			    PLinkshell->setColor(Sql_GetIntData(SqlHandle,1));
                PLinkshell->setName(Sql_GetData(SqlHandle,2));
                PLinkshell->setPoster(Sql_GetData(SqlHandle,3));
                PLinkshell->setMessage(Sql_GetData(SqlHandle,4));

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
        //DSP_DEBUG_BREAK_IF(PChar == NULL);
        //DSP_DEBUG_BREAK_IF(PChar->PLinkshell != NULL);

        if (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL))
        {
            LinkshellList_t::const_iterator it = LinkshellList.find(PItemLinkshell->GetLSID()); 
			if (it != LinkshellList.end())
			{
                CLinkshell* PLinkshell = it->second;

				PChar->PLinkshell = PLinkshell;
                ShowDebug(CL_CYAN"linkshell:AddOnlineMember\n"CL_RESET);
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
        //DSP_DEBUG_BREAK_IF(PChar == NULL);
        //DSP_DEBUG_BREAK_IF(PChar->PLinkshell == NULL);

        if (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL))
        {
            LinkshellList_t::const_iterator it = LinkshellList.find(PItemLinkshell->GetLSID()); 
			if (it != LinkshellList.end())
			{
				CLinkshell* PLinkshell = it->second;

                PChar->PLinkshell = NULL;
                ShowDebug(CL_CYAN"linkshell:DelOnlineMember\n"CL_RESET);
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
                
                LinkshellList[PLinkshell->getID()] = PLinkshell;

                return PLinkshell->getID();
            }
        }
        return 0;
    }
};