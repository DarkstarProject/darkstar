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

#include "../../common/socket.h"

#include <string.h>

#include "automaton_update.h"

#include "../entities/charentity.h"


CAutomatonUpdatePacket::CAutomatonUpdatePacket(CCharEntity* PChar)
{
	this->type = 0x44;
	this->size = 0x4E;
	/*
	WBUFB(data,(0x04)-4) = JOB_PUP;

    harlequin head: 0x01
    valoredge head: 0x02
    sharpshot head: 0x03
    stormwaker head: 0x04
    soulsoother head: 0x05
    spiritreaver head: 0x06

    harlequin frame: 0x20
    valoredge frame: 0x21
    sharpshot frame: 0x22
    stormwaker frame: 0x23

    tension spring: 0x02 (2)
    disruptor: 0xE8 (232)

    32 attachment slots for each element (except fire)
    0x01-0x1F fire
    0x20-0x3F ice
    0x40-0x5F wind
    0x60-0x7F earth
    0x80-0x9F water
    0xA0-0xBF thunder
    0xC0-0xDF light
    0xE0-0xFF dark
    
	WBUFB(data,(0x08)-4) = 0x03; //sharpshot head, harlequin = 0x01
	WBUFB(data,(0x09)-4) = 0x22; //sharpshot frame, harlequin = 0x20
	WBUFB(data,(0x0A)-4) = 0x00; //attachment slot 0
	WBUFB(data,(0x0B)-4) = 0x00; //slot 1
	WBUFB(data,(0x0C)-4) = 0x00; //slot 2
	WBUFB(data,(0x0D)-4) = 0x00; //slot 3
	WBUFB(data,(0x0E)-4) = 0x00; //slot 4
	WBUFB(data,(0x0F)-4) = 0x00; //slot 5
	WBUFB(data,(0x10)-4) = 0x00; //slot 6
	WBUFB(data,(0x11)-4) = 0x00; //slot 7
	WBUFB(data,(0x12)-4) = 0x00; //slot 8
	WBUFB(data,(0x13)-4) = 0x00; //slot 9
	WBUFB(data,(0x14)-4) = 0x00; //slot 10
	WBUFB(data,(0x15)-4) = 0x00; //slot 11

	WBUFL(data,(0x18)-4) = 0x0A; // unlocked automaton heads (all heads: 0x7E - not sure what bit 0 is)
	WBUFL(data,(0x1C)-4) = 0x05; // unlocked automaton frames (all frames: 0x0F)

    //unlocked attachments: bit # = itemID (second itemID, 8000+ one) & 0x1F (0-31), or itemID & 0xFF - (32*element)
    WBUFL(data,(0x35)-4) = 0x00; // unlocked fire attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked ice attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked wind attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked earth attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked lightning attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked water attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked light attachments
    WBUFL(data,(0x35)-4) = 0x00; // unlocked dark attachments
	
	memcpy(data+(0x58)-4,PChar->PPet->GetName(),PChar->PPet->name.size());

	WBUFW(data,(0x68)-4) = PChar->PPet->health.hp;
	WBUFW(data,(0x6A)-4) = PChar->PPet->GetMaxHP();
	WBUFW(data,(0x6C)-4) = PChar->PPet->health.mp;
	WBUFW(data,(0x6E)-4) = PChar->PPet->GetMaxMP();

	WBUFW(data,(0x70)-4) = 0; //current melee skill
	WBUFW(data,(0x72)-4) = 0; //max melee skill
	WBUFW(data,(0x74)-4) = 0; //current ranged skill
	WBUFW(data,(0x76)-4) = 0; //max ranged skill
	WBUFW(data,(0x78)-4) = 0; //current magic skill
	WBUFW(data,(0x7A)-4) = 0; //max magic skill

	WBUFW(data,(0x80)-4) = PChar->PPet->stats.STR;
    WBUFW(data,(0x82)-4) = PChar->PPet->getMod(MOD_STR);
    WBUFW(data,(0x84)-4) = PChar->PPet->stats.DEX;
    WBUFW(data,(0x86)-4) = PChar->PPet->getMod(MOD_DEX);
    WBUFW(data,(0x88)-4) = PChar->PPet->stats.VIT;
    WBUFW(data,(0x8A)-4) = PChar->PPet->getMod(MOD_VIT);
	WBUFW(data,(0x8C)-4) = PChar->PPet->stats.AGI;
    WBUFW(data,(0x8E)-4) = PChar->PPet->getMod(MOD_AGI);
	WBUFW(data,(0x90)-4) = PChar->PPet->stats.INT;
    WBUFW(data,(0x92)-4) = PChar->PPet->getMod(MOD_INT);
	WBUFW(data,(0x94)-4) = PChar->PPet->stats.MND;
    WBUFW(data,(0x96)-4) = PChar->PPet->getMod(MOD_MND);
	WBUFW(data,(0x98)-4) = PChar->PPet->stats.CHR;
    WBUFW(data,(0x9A)-4) = PChar->PPet->getMod(MOD_CHR);
    */
	
	uint8 packet[] = {
							0x12, 0x00, 0x00, 0x00, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43, 0x6F, 0x6D, 0x65, 0x64, 0x69, 0x65, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x25, 0x00, 0x0A, 0x00, 0x0A, 0x00, 
	0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 
	0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00};

	memcpy(data+(0x04)-4, &packet, 152);
}
