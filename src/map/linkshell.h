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

#ifndef _CLINKSHELL_H
#define _CLINKSHELL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include <vector>

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CBasicPacket;
class CCharEntity;
class CItemLinkshell;

class CLinkshell
{
public:

    CLinkshell(std::uint32_t id);

    std::uint32_t      getID();
    std::uint16_t      getColor();

    void        setColor(std::uint16_t color);

    const std::int8_t* getName();
	void		setName(std::int8_t* name);
	void		setMessage(const std::int8_t* message, const std::int8_t* poster);

    void        AddMember(CCharEntity* PChar,std::int8_t type, std::uint8_t lsNum);
    bool        DelMember(CCharEntity* PChar);

    void        RemoveMemberByName(std::int8_t* MemberName);
	void		ChangeMemberRank(std::int8_t* MemberName, std::uint8_t toSack);

    void        PushPacket(std::uint32_t senderID, CBasicPacket* packet);
    void        PushLinkshellMessage(CCharEntity* PChar, bool ls1);

    std::vector<CCharEntity*> members; // список участников linkshell

private:

    std::uint32_t      m_id;
    std::uint16_t      m_color;

    string_t    m_name;
};

/************************************************************************
*                                                                       *
*  namespase для работы с Linkshells                                    *
*                                                                       *
************************************************************************/

namespace linkshell
{
    CLinkshell* LoadLinkshell(std::uint32_t id);

    bool AddOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell, std::uint8_t lsNum);
    bool DelOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell);

    std::uint32_t RegisterNewLinkshell(const std::int8_t* name, std::uint16_t color);
	CLinkshell* GetLinkshell(std::uint32_t id);
};

#endif