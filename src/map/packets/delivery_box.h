/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CDELIVERYBOXPACKET_H
#define _CDELIVERYBOXPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

// если не ошибаюсь, то можно добавить любое имя аукциона, главное начать с префикса "AH-"

#define AH_SANDORIA		"AH-SandOria"
#define AH_JEUNO		"AH-Jeuno"
#define AH_WINDURST		"AH-Windurst"
#define AH_BASTOK		"AH-Bastok"
#define AH_VANADIEL		"AH-Vanadiel"

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CDeliveryBoxPacket : public CBasicPacket
{
public:

	CDeliveryBoxPacket(uint8 action, uint8 count);
};

#endif