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

/* OLD FISHING PACKET - Used for old fishing minigame. Requires setting animation to 50 at fishing start and 38 when you receive a bite. Seems to still work but breaks client's target info after fishing
    this->type = 0x81;
    this->size = 0x0C;
    
    unsigned char packet[] =
    {
                                0x90, 0x27, 0x07, 0x80, 0x0e, 0x11, 0x08, 0x14, 0x00, 0x69, 0x74, 0x73,
        0x4b, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
    };

    memcpy(data+4, &packet, 20);
    
    WBUFW(data, (0x04)) = stamina;
    WBUFB(data, (0x06)) = id3;
    WBUFB(data, (0x07)) = regen;
    WBUFB(data, (0x08)) = id1;
    WBUFB(data, (0x09)) = id2;
    WBUFB(data, (0x0A)) = id4;
    WBUFB(data, (0x0B)) = time;
    	// "Unknown, can be 0x00 or 0x01 but most likely has to do how fast the rod moves around"
    WBUFB(data, (0x0C)) = unknown1;
    	// something to do with stamina
    WBUFB(data, (0x10)) = unknown2;
*/

// New Fishing Packet: Mini-Game Data.

CFishingPacket::CFishingPacket(uint16 stamina, uint16 regen, uint16 response, uint16 hit_dmg, uint16 arrowdelay, uint16 miss_regen, uint16 game_time, uint8 sense, uint32 garw_perc)
{
    this->type = 0x15; //0x115
    this->size = 0x0D;

    ref<uint16>(0x04) = stamina;    // fish HP, generally in thousands - Constant Per Fish, Changes Per Zone.
    ref<uint16>(0x06) = arrowdelay; // how long you have to hit the arrows, generally low 10's possible miliseconds
    ref<uint16>(0x08) = regen;      // how much stamina fish regains/loses per frame.  base is 128, less = drain, more = regen - Constant Per Fish, Doesn't Change Per Zone.
    ref<uint16>(0x0A) = response;   // fish movement, how active the fish is moving left to right (base 20) - Constant Per Fish, Doesn't Change Per Zone.
    ref<uint16>(0x0C) = hit_dmg;    // fish attack, how much damage is caused to fishes stamina from successful arrows - Constant Per Fish, Changes Per Zone.
    ref<uint16>(0x0E) = miss_regen; // fish heal, how much stamina fish heals from wrong arrow press - Constant Per Fish, Doesn't Change Per Zone.
    ref<uint16>(0x10) = game_time;  // how long you have to reel the fish in (base 60)
    ref<uint8>(0x12)  = sense;      // 0 = fish/item, 1 = monster (battle music), 2 = fish/item (lightbulb), 3 = monster (lightbulb + fight music)
    ref<uint32>(0x14) = garw_perc;  // % chance of getting gold arrows while fishing
}