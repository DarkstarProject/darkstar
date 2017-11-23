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

#include "item_fish.h"
#include "../map.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItemFish::CItemFish(const CItem &PItem) : CItem(PItem)
{
	m_min       = 0;
    m_max       = 0;
    m_watertype = 0;
    m_size      = 0;
    m_stamina   = 0;
    m_rodflag   = 0;
}

CItemFish::~CItemFish()
{
}

std::uint16_t CItemFish::GetLength()
{
    return RBUFW(m_extra, 0);
}

std::uint16_t CItemFish::GetWeight()
{
    return RBUFW(m_extra, 2);
}

bool CItemFish::IsRanked()
{
    return (RBUFB(m_extra, 4) & 0x01) == 0x01;
}

void CItemFish::SetLength(std::uint16_t length)
{
    WBUFW(m_extra, 0) = length;
}

void CItemFish::SetWeight(std::uint16_t weight)
{
    WBUFW(m_extra, 2) = weight;
}

void CItemFish::SetRank(bool rank)
{
    if (rank)
        WBUFB(m_extra, 4) |= 0x01;
    else
        WBUFB(m_extra, 4) &= ~0x01;
}