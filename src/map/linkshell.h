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

    const int8* getName();
	void		setName(int8* name);
	void		setMessage(const int8* message, const int8* poster);

    void        AddMember(CCharEntity* PChar,int8 type, std::uint8_t lsNum);
    bool        DelMember(CCharEntity* PChar);

    void        RemoveMemberByName(int8* MemberName);
	void		ChangeMemberRank(int8* MemberName, std::uint8_t toSack);

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

    std::uint32_t RegisterNewLinkshell(const int8* name, std::uint16_t color);
	CLinkshell* GetLinkshell(std::uint32_t id);
};

#endif