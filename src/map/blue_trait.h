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

#ifndef _CBLUETRAIT_H
#define _CBLUETRAIT_H

#include "trait.h"

class CBlueTrait : public CTrait
{
public:

    CBlueTrait(std::uint8_t category, std::uint8_t id);

    void setPoints(std::uint8_t points);

    std::uint8_t getCategory();
    std::uint8_t getPoints();

private:

    std::uint8_t m_points;
    std::uint8_t m_category;
};

#endif