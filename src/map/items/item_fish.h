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

#ifndef _CITEMFISH_H
#define _CITEMFISH_H

#include "../../common/cbasetypes.h"

#include "item.h"

/************************************************************************
*                                                                       *
*  Fishing items.                                                       *
*                                                                       *
************************************************************************/

class CItemFish : public CItem
{
public:

	CItemFish(const CItem &PItem);
    
    std::uint8_t   GetMin();
    std::uint8_t   GetMax();
    std::uint8_t   GetWatertype();
    std::uint8_t   GetSize();
    std::uint8_t   GetStamina();
    std::uint8_t   GetRodFlag();
    std::uint16_t  GetLength();
    std::uint16_t  GetWeight();
    bool    IsRanked();
    
    void    SetMin(std::uint8_t);
    void    SetMax(std::uint8_t);
    void    SetWatertype(std::uint8_t);
    void    SetSize(std::uint8_t);
    void    SetStamina(std::uint8_t);
    void    SetRodFlag(std::uint8_t);
    void    SetLength(std::uint16_t);
    void    SetWeight(std::uint16_t);
    void    SetRank(bool);

    virtual ~CItemFish();

private:

    std::uint8_t   m_min;
    std::uint8_t   m_max;
    std::uint8_t   m_watertype;
    std::uint8_t   m_size;
    std::uint8_t   m_stamina;
    std::uint8_t   m_rodflag;
};

#endif