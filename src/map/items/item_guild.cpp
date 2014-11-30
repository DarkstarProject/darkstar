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

#include "item_guild.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItemGuild::CItemGuild(uint16 id) : CItem(id)
{
    m_guild = 0;
    m_rank = 0;
    m_minRank = 0;
    m_points = 0;
    m_maxPoints = 0;
    m_pattern = 0;
}

CItemGuild::~CItemGuild()
{
}

uint8 CItemGuild::getGuild()
{
    return m_guild;
}

uint8 CItemGuild::getRank()
{
    return m_rank;
}

uint8 CItemGuild::getMinimumRank()
{
    return m_minRank;
}

uint16 CItemGuild::getPoints()
{
    return m_points;
}

uint16 CItemGuild::getMaxPoints()
{
    return m_maxPoints;
}

uint8 CItemGuild::getPattern()
{
    return m_pattern;
}

void CItemGuild::setGuild(uint8 guild)
{
    m_guild = guild;
}

void CItemGuild::setRank(uint8 rank)
{
    m_rank = rank;
}

void CItemGuild::setMinimumRank(uint8 minrank)
{
    m_minRank = minrank;
}

void CItemGuild::setPoints(uint16 points)
{
    m_points = points;
}

void CItemGuild::setMaxPoints(uint16 maxpoints)
{
    m_maxPoints = maxpoints;
}

void CItemGuild::setPattern(uint8 pattern)
{
    m_pattern = pattern;
}