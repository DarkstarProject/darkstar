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

#include "../../common/socket.h"

#include <string.h> 

#include "fishing.h"

unsigned char packet[] = 
{	
	                        0x90, 0x27, 0x07, 0x80, 0x0e, 0x11, 0x08, 0x14, 0x00, 0x69, 0x74, 0x73, 
	0x4b, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
};

/************************************************************************
*                                                                       *  
*  Статический dump оригинального пакета                                *
*                                                                       *
************************************************************************/

CFishingPacket::CFishingPacket() 
{
	this->type = 0x81;
	this->size = 0x0C;

	memcpy(data, &packet, 20);
}

/************************************************************************
*                                                                       *  
*  Версия от EDGECOM                                                    *
*                                                                       *
************************************************************************/

CFishingPacket::CFishingPacket(uint8 stamina, uint8 pull, uint8 hp) 
{
	this->type = 0x81;
	this->size = 0x0C;

	memcpy(data, &packet, 20);
    
    WBUFB(data,(0x01)-4) = stamina;
    WBUFB(data,(0x02)-4) = pull;
    WBUFB(data,(0x03)-4) = hp;
}