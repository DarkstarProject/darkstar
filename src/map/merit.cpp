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

#include "merit.h"

/************************************************************************
*                                                                       *
*  Две версии значений - до abyssea и после                             *
*                                                                       *
************************************************************************/

// массив больше на одно значение, заполняемое нулем

#if define ABYSSEA_EXPANSION
uint8 upgrade[8][16] =
{
    {1,2,3,4,5,5,5,5,5,7,7,7,9,9,9},
    {3,6,9,9,9,12,12,12,12,15,15,15},
    {1,2,3,3,3,3,3,3},
    {1,2,3,3},
    {1,2,3,3,3,3,3,3},
    {1,2,3,4,5},
    {1,2,3,4,5},
    {3,4,5,5,5},
};
#else
uint8 upgrade[8][9] =
{
    {1,2,3,4,5,5,5,5},
    {3,6,9,9,9},
    {1,2,3,3,3,3,3,3},
    {1,2,3,3},
    {1,2,3,3,3,3,3,3},
    {1,2,3,4},
    {1,2,3,4,5},
    {3,4,5,5,5},
};
#endif