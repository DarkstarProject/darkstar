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

    CLinkshell(uint32 id);

    uint32      getID();
    uint16      getColor();
    uint32      getMessageTime();

    void        setColor(uint16 color);
    void        setMessageTime(uint32 time);

    const int8* getName();
	void		setName(int8* name);
    const int8* getPoster();
	void		setPoster(int8* poster);
    const int8* getMessage();
	void		setMessage(int8* message);

    void        AddMember(CCharEntity* PChar,int8 type);
    void        DelMember(CCharEntity* PChar);

    void        RemoveMemberByName(int8* MemberName);
	void		ChangeMemberRank(int8* MemberName, uint8 toSack);

    void        PushPacket(uint32 senderID, CBasicPacket* packet);

    std::vector<CCharEntity*> members; // список участников linkshell

private:

    uint32      m_id;
    uint32      m_time;
    uint16      m_color;

    string_t    m_name;
    string_t    m_poster;
    string_t    m_message;
};

/************************************************************************
*                                                                       *
*  namespase для работы с Linkshells                                    *
*                                                                       *
************************************************************************/

namespace linkshell
{
    void LoadLinkshellList();

    bool AddOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell);
    bool DelOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell);

    uint32 RegisterNewLinkshell(const int8* name, uint16 color);
	CLinkshell* GetLinkshell(uint32 id);
};

#endif