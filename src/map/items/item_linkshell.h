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

#ifndef _CITEMLINKSHELL_H
#define _CITEMLINKSHELL_H

#include "../../common/cbasetypes.h"

#include "item.h"

struct lscolor_t
{
	std::uint8_t R:4;
	std::uint8_t G:4;
	std::uint8_t B:4;
	std::uint8_t A:4;
};

enum LSTYPE : std::uint8_t
{
    LSTYPE_NEW_LINKSHELL,
    LSTYPE_LINKSHELL,
    LSTYPE_PEARLSACK,
    LSTYPE_LINKPEARL,
    LSTYPE_RIPPED_PERLSACK,
    LSTYPE_BROKEN_LINKSHELL,
};

class CItemLinkshell : public CItem
{
public:

	CItemLinkshell(std::uint16_t);
	virtual ~CItemLinkshell();

    std::uint32_t      GetLSID();
    LSTYPE      GetLSType();
	lscolor_t	GetLSColor();
    std::uint16_t      GetLSRawColor();
    void        SetLSID(std::uint32_t lsid);
	void		SetLSColor(std::uint16_t color);	
    virtual const std::int8_t* getSignature();
    virtual void setSignature(std::int8_t* signature);
	
private:

};

#endif