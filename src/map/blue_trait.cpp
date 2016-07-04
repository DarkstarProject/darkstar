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

#include "blue_trait.h"

CBlueTrait::CBlueTrait(uint8 category, uint16 id) : CTrait(id)
{
    m_category = category;
    m_points = 0;
}

uint8 CBlueTrait::getCategory()
{
	return m_category;
}

uint8 CBlueTrait::getPoints()
{
	return m_points;
}

void CBlueTrait::setPoints(uint8 points)
{
	m_points = points;
}