/*
===========================================================================

  Copyright //(c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  //(at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _CMERIT_H
#define _CMERIT_H

#include "../common/cbasetypes.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

enum MERIT_CATEGORY
{
    MCATEGORY_HP_MP = 0x0040,
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

enum MERIT_TYPE
{
    MERIT_MAX_HP = MCATEGORY_HP_MP + 0x00,
	MERIT_MAX_MP = MCATEGORY_HP_MP + 0x02,
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

struct Merit_t
{
    uint16 id;      // id мерита
    uint8  next;    // необходимое количество меритов для следующего усиления
    uint8  count;   // текущее количество усилений
};

#endif