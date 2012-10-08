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

#include "../../common/socket.h"

#include "item_linkshell.h"


CItemLinkshell::CItemLinkshell(uint16 id) : CItem(id)
{
	setType(ITEM_LINKSHELL);

    m_LinkshellID = 0;

	WBUFW(&m_LSColor,0) = 0;
}

CItemLinkshell::~CItemLinkshell()
{
}

uint32 CItemLinkshell::GetLSID()
{
    return m_LinkshellID;
}

void CItemLinkshell::SetLSID(uint32 lsid)
{
    m_LinkshellID = lsid;
}

LSTYPE CItemLinkshell::GetLSType()
{
    return (LSTYPE)(getID() - 0x200);
}

lscolor_t CItemLinkshell::GetLSColor()
{
	return m_LSColor;
}

uint16 CItemLinkshell::GetLSRawColor()
{
    return RBUFW(&m_LSColor,0);
}

void CItemLinkshell::SetLSColor(uint16 color)
{
	WBUFW(&m_LSColor,0) = color;
}