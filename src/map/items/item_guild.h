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

#ifndef _CITEMGUILD_H
#define _CITEMGUILD_H

#include "../../common/cbasetypes.h"

#include "item.h"

/************************************************************************
*                                                                       *
*  Guild point items                                                    *
*                                                                       *
************************************************************************/

class CItemGuild : public CItem
{
public:

    CItemGuild(uint16 id);

    uint8   getGuild();
    uint8   getRank();
    uint8   getMinimumRank();
    uint16  getPoints();
    uint16  getMaxPoints();
    uint8   getPattern();

    void    setGuild(uint8);
    void    setRank(uint8);
    void    setMinimumRank(uint8);
    void    setPoints(uint16);
    void    setMaxPoints(uint16);
    void    setPattern(uint8);

    virtual ~CItemGuild();

private:

    uint8   m_guild;
    uint8   m_rank;
    uint8   m_minRank;
    uint16  m_points;
    uint16  m_maxPoints;
    uint8   m_pattern;
};

#endif