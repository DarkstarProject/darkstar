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

#include "../charentity.h"

/* It seems the 0x44 packet contains extended information about a specific job. For PUPs it's automaton information, for BLUs it's set spell info:

ON ZONE IN MUST SEND A 0x44 packet like:

44 4E 05 00 10 00 00 00 01 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00

possibly offset 0x04 == job this is affecting because 0x10 = 16 = JOBBLU and below there is implementation for 0x12 = 18 = JOB_PUP

offset 0x05 onwards: This is potentially a bitmask (?) of BLU spells set. Sending this will activate the spell setting packets on the client.
Without this, you won't get them when you try to select spells on the UI.

SPELL SETTING PACKETS = 0x102

unknown:
abs 0x08 is always 0x10.

only set for add:
abs 0x04 with the byte.

always set for add/rem:
abs offset 0x1C is the spell (shifted by 0x200) e.g. spellid 0x02A6 becomes 0xA6

*/

CAutomatonUpdatePacket::CAutomatonUpdatePacket(CCharEntity* PChar)
{
	this->type = 0x44;
	this->size = 0x4E;
	/*
	WBUFB(data,(0x04)-4) = JOB_PUP;

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

	WBUFL(data,(0x18)-4) = 0x0A; // ??? also received 0x03, keg's packet 0x01
	WBUFL(data,(0x1C)-4) = 0x05; // ???


	
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

	WBUFW(data,(0x80)-4) = PChar->PPet->STR();
	WBUFW(data,(0x84)-4) = PChar->PPet->DEX();
	WBUFW(data,(0x88)-4) = PChar->PPet->VIT();
	WBUFW(data,(0x8C)-4) = PChar->PPet->AGI();
	WBUFW(data,(0x90)-4) = PChar->PPet->INT();
	WBUFW(data,(0x94)-4) = PChar->PPet->MND();
	WBUFW(data,(0x98)-4) = PChar->PPet->CHR();

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
