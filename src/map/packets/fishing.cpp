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

CFishingPacket::CFishingPacket(uint16 stamina, uint8 regen, uint8 id1, uint8 id2, uint8 id3, uint8 id4, uint8 time, uint8 unknown1, uint8 unknown2) 
{
	this->type = 0x81;
	this->size = 0x0C;

	memcpy(data, &packet, 20);
    
    WBUFW(data,(0x04)) = stamina;
    WBUFB(data,(0x06)) = id3;
    WBUFB(data,(0x07)) = regen;
	WBUFB(data,(0x08)) = id1;
	WBUFB(data,(0x09)) = id2;
	WBUFB(data,(0x0A)) = id4;
	WBUFB(data,(0x0B)) = time;
	// "Unknown, can be 0x00 or 0x01 but most likely has to do how fast the rod moves around"
	WBUFB(data,(0x0C)) = unknown1;
	// something to do with stamina
	WBUFB(data,(0x10)) = unknown2;
}