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

// formula stamina needs to be heigher than pull or the fish will auto die
// orginal 39, 7, 128
// Large Fish = 40,7,128
// Small Fish = 40,9,128
// Item = 9,7,128

unsigned char largefishpacket[] =
{
	0x90, 0x28, 0x07, 0x80, 0x0e, 0x11, 0x08, 0x14, 0x00, 0x69, 0x74, 0x73,
	0x4b, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
};

unsigned char smallfishpacket[] =
{
	0x90, 0x28, 0x09, 0x80, 0x0e, 0x11, 0x08, 0x14, 0x00, 0x69, 0x74, 0x73,
	0x4b, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
};

unsigned char itempacket[] =
{
	0x90, 0x09, 0x07, 0x80, 0x0e, 0x11, 0x08, 0x14, 0x00, 0x69, 0x74, 0x73,
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

	memcpy(data, &smallfishpacket, 20);
}

/************************************************************************
*                                                                       *
*  Версия от EDGECOM                                                    *
*                                                                       *
************************************************************************/

CFishingPacket::CFishingPacket(int type, int size)
{
	if (type == 0)
	{
		if (size == 1)
		{
			this->type = 0x81;
			this->size = 0x0C;
			memcpy(data, &largefishpacket, 20);
		}
		else
		{
			this->type = 0x81;
			this->size = 0x0C;
			memcpy(data, &smallfishpacket, 20);
		}

	}
	else
	{
		this->type = 0x81;
		this->size = 0x0C;
		memcpy(data, &itempacket, 20);
	}


}