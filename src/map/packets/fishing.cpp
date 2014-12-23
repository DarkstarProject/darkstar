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
	0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

/************************************************************************
*                                                                       *
*  Статический dump оригинального пакета                                *
*                                                                       *
************************************************************************/

CFishingPacket::CFishingPacket()
{
	this->type = 0x15;
	this->size = 0x0D;

	memcpy(data, &packet, 20);
}

/************************************************************************
*                                                                       *
*  Версия от EDGECOM                                                    *
*                                                                       *
************************************************************************/

CFishingPacket::CFishingPacket(uint16 stamina, uint16 regen, uint16 id1, uint16 id2, uint16 id3, uint16 id4, uint16 fishtime, uint8 anglersense, uint8 luckytiming)
{
	this->type = 0x15;
	this->size = 0x0D;


	/*

	stamina     - fish HP, generally in thousands
	id3         - arrow delay, how long you have to hit the arrows, generally low 10's possible miliseconds
	regen       - how much stamina fish regains/loses per frame.  base is 128, less = drain, more = regen
	id1         - fish movement, how active the fish is moving left to right.
	id2         - fish attack, how much damage is caused to fishes stamina from successful arrows
	id4         - fish heal, how much stamina fish heals from wrong arrow press
	fishtime    - how long you have to reel the fish in
	anglersense - 0 = fish/item, 1 = monster (battle music), 2 = fish/item (lightbulb), 3 = monster (lightbulb + fight music)
	luckytiming - % chance of getting gold arrows while fishing

	*/

	WBUFW(data, (0x04) - 4) = stamina;
	WBUFW(data, (0x06) - 4) = id3;
	WBUFW(data, (0x08) - 4) = regen;
	WBUFW(data, (0x0A) - 4) = id1;
	WBUFW(data, (0x0C) - 4) = id2;
	WBUFW(data, (0x0E) - 4) = id4;
	WBUFW(data, (0x10) - 4) = fishtime;
	WBUFB(data, (0x12) - 4) = anglersense;
	WBUFB(data, (0x14) - 4) = luckytiming;
}

/*
struct packet_115
{
	unsigned int header;
	unsigned short  Stamina;        // Fish Health
	unsigned short  ID3;            // Arrow Delay (How long you have to hit the arrows as they appear.)
	unsigned short  Regen;          // -128 -- Fish Regen (How much stamina the fish regains/loses per frame.) [128 isbase, + is regen, - is drain]
	unsigned short  ID1;            // *20 -- Fish Movement (How active the fish is moving left to right.)
	unsigned short  ID2;            // Fish Attack (How much damage is caused to the fish on successful arrow presses.)
	unsigned short  ID4;            // Fishing Heal Rate (How much the fish recovers for wrong arrow presses.)
	unsigned short  FightTime;      // *60
	unsigned char   AnglerSense;    // &1 -- 0 = Fish/Item, 1 = Monster (Battle music), 2 = Fish Item (Light bulb), 3 = Monster (Light bulb, fight music)
	unsigned char   Unknown;        // Not used (padding)
	unsigned int    LuckyTiming;    // The % chance the gold arrow will appear while fishing this fish.
};
*/