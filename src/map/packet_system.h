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

#ifndef _PACKETSYSTEM_H
#define _PACKETSYSTEM_H

#include "../common/cbasetypes.h"

#include "charentity.h"

struct map_session_data_t;

//void (*PacketParcer[512])(map_session_data_t* session, int8* data);

int32 SmallPacket0x00A(CCharEntity*, int8*, map_session_data_t*);
int32 SmallPacket0x00B(CCharEntity*, int8*);
int32 SmallPacket0x00C(CCharEntity*, int8*);
int32 SmallPacket0x00D(CCharEntity*, int8*, map_session_data_t*);
int32 SmallPacket0x00F(CCharEntity*, int8*);
int32 SmallPacket0x011(CCharEntity*, int8*);
int32 SmallPacket0x015(CCharEntity*, int8*);
int32 SmallPacket0x016(CCharEntity*, int8*);
int32 SmallPacket0x017(CCharEntity*, int8*);
int32 SmallPacket0x01A(CCharEntity*, int8*);
int32 SmallPacket0x01C(CCharEntity*, int8*);
int32 SmallPacket0x028(CCharEntity*, int8*);
int32 SmallPacket0x029(CCharEntity*, int8*);
int32 SmallPacket0x032(CCharEntity*, int8*);
int32 SmallPacket0x033(CCharEntity*, int8*);
int32 SmallPacket0x034(CCharEntity*, int8*);
int32 SmallPacket0x036(CCharEntity*, int8*);
int32 SmallPacket0x037(CCharEntity*, int8*);
int32 SmallPacket0x03A(CCharEntity*, int8*);
int32 SmallPacket0x03C(CCharEntity*, int8*);
int32 SmallPacket0x041(CCharEntity*, int8*);
int32 SmallPacket0x042(CCharEntity*, int8*);
int32 SmallPacket0x04B(CCharEntity*, int8*);
int32 SmallPacket0x04D(CCharEntity*, int8*);
int32 SmallPacket0x04E(CCharEntity*, int8*);
int32 SmallPacket0x050(CCharEntity*, int8*);
int32 SmallPacket0x059(CCharEntity*, int8*);
int32 SmallPacket0x05A(CCharEntity*, int8*);
int32 SmallPacket0x05B(CCharEntity*, int8*);
int32 SmallPacket0x05C(CCharEntity*, int8*);
int32 SmallPacket0x05D(CCharEntity*, int8*);
int32 SmallPacket0x05E(CCharEntity*, int8*);
int32 SmallPacket0x060(CCharEntity*, int8*);
int32 SmallPacket0x061(CCharEntity*, int8*);
int32 SmallPacket0x063(CCharEntity*, int8*);
int32 SmallPacket0x064(CCharEntity*, int8*);
int32 SmallPacket0x066(CCharEntity*, int8*);
int32 SmallPacket0x06E(CCharEntity*, int8*);
int32 SmallPacket0x06F(CCharEntity*, int8*);
int32 SmallPacket0x070(CCharEntity*, int8*);
int32 SmallPacket0x071(CCharEntity*, int8*);
int32 SmallPacket0x074(CCharEntity*, int8*);
int32 SmallPacket0x076(CCharEntity*, int8*);
int32 SmallPacket0x077(CCharEntity*, int8*);
int32 SmallPacket0x078(CCharEntity*, int8*);
int32 SmallPacket0x083(CCharEntity*, int8*);
int32 SmallPacket0x084(CCharEntity*, int8*);
int32 SmallPacket0x085(CCharEntity*, int8*);
int32 SmallPacket0x096(CCharEntity*, int8*);
int32 SmallPacket0x0A0(CCharEntity*, int8*);
int32 SmallPacket0x0A1(CCharEntity*, int8*);
int32 SmallPacket0x0A2(CCharEntity*, int8*);
int32 SmallPacket0x0AA(CCharEntity*, int8*);
int32 SmallPacket0x0AB(CCharEntity*, int8*);
int32 SmallPacket0x0AC(CCharEntity*, int8*);
int32 SmallPacket0x0AD(CCharEntity*, int8*);
int32 SmallPacket0x0B5(CCharEntity*, int8*);
int32 SmallPacket0x0B6(CCharEntity*, int8*);
int32 SmallPacket0x0BE(CCharEntity*, int8*);
int32 SmallPacket0x0C3(CCharEntity*, int8*);
int32 SmallPacket0x0C4(CCharEntity*, int8*);
int32 SmallPacket0x0CB(CCharEntity*, int8*);
int32 SmallPacket0x0D2(CCharEntity*, int8*);
int32 SmallPacket0x0D3(CCharEntity*, int8*);
int32 SmallPacket0x0D4(CCharEntity*, int8*);
int32 SmallPacket0x0DB(CCharEntity*, int8*);
int32 SmallPacket0x0DC(CCharEntity*, int8*);
int32 SmallPacket0x0DE(CCharEntity*, int8*);
int32 SmallPacket0x0DD(CCharEntity*, int8*);
int32 SmallPacket0x0E0(CCharEntity*, int8*);
int32 SmallPacket0x0E1(CCharEntity*, int8*);
int32 SmallPacket0x0E2(CCharEntity*, int8*);
int32 SmallPacket0x0E7(CCharEntity*, int8*);
int32 SmallPacket0x0E8(CCharEntity*, int8*);
int32 SmallPacket0x0EA(CCharEntity*, int8*);
int32 SmallPacket0x0F1(CCharEntity*, int8*);
int32 SmallPacket0x0F2(CCharEntity*, int8*);
int32 SmallPacket0x0F4(CCharEntity*, int8*);
int32 SmallPacket0x0F5(CCharEntity*, int8*);
int32 SmallPacket0x0F6(CCharEntity*, int8*);
int32 SmallPacket0x0FA(CCharEntity*, int8*);
int32 SmallPacket0x0FB(CCharEntity*, int8*);
int32 SmallPacket0x100(CCharEntity*, int8*);
int32 SmallPacket0x102(CCharEntity*, int8*);
int32 SmallPacket0x104(CCharEntity*, int8*);
int32 SmallPacket0x105(CCharEntity*, int8*);
int32 SmallPacket0x106(CCharEntity*, int8*);
int32 SmallPacket0x109(CCharEntity*, int8*);
int32 SmallPacket0x10A(CCharEntity*, int8*);
int32 SmallPacket0x10B(CCharEntity*, int8*);

#endif