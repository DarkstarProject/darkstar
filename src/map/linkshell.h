﻿/*
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
    uint8       getPostRights();

    void        setColor(uint16 color);
    void        setPostRights(uint8 postrights); // Updates lsmes privilege and writes to db

    const int8* getName();
	void		setName(int8* name);
	void		setMessage(const int8* message, const int8* poster);

    void        AddMember(CCharEntity* PChar,int8 type, uint8 lsNum);
    bool        DelMember(CCharEntity* PChar);

    void        BreakLinkshell(int8* lsname, bool gm);
    void        RemoveMemberByName(int8* MemberName, uint8 kickerRank);
	void		ChangeMemberRank(int8* MemberName, uint8 toSack);

    void        PushPacket(uint32 senderID, CBasicPacket* packet);
    void        PushLinkshellMessage(CCharEntity* PChar, bool ls1);

    std::vector<CCharEntity*> members; // список участников linkshell
    uint8       m_postRights;

private:

    uint32      m_id;
    uint16      m_color;

    string_t    m_name;
};

/************************************************************************
*                                                                       *
*  namespase для работы с Linkshells                                    *
*                                                                       *
************************************************************************/

namespace linkshell
{
    CLinkshell* LoadLinkshell(uint32 id);
    void UnloadLinkshell(uint32 id);

    bool AddOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell, uint8 lsNum);
    bool DelOnlineMember(CCharEntity* PChar, CItemLinkshell* PItemLinkshell);

    uint32 RegisterNewLinkshell(const int8* name, uint16 color);
	CLinkshell* GetLinkshell(uint32 id);
};

#endif