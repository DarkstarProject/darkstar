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

#include "zone_in.h"

#include "../charentity.h"
#include "../vana_time.h"
#include "../zoneutils.h"


uint16 GetMogHouseID(CCharEntity * PChar)
{
	if ( (PChar->loc.prevzone >= 48) && (PChar->loc.prevzone <= 50) )
	{
		return 0x00D6;
	}
	if ( (PChar->loc.prevzone >= 230) && (PChar->loc.prevzone <= 232) )
	{
		return (PChar->profile.nation == 0 ? 0x0121 : 0x0101);
	}
	if ( (PChar->loc.prevzone >= 234) && (PChar->loc.prevzone <= 236) )
	{
		return (PChar->profile.nation == 1 ? 0x0122 : 0x0102);
	}
	if ( (PChar->loc.prevzone >= 238) && (PChar->loc.prevzone <= 241) )
	{
		return (PChar->profile.nation == 2 ?  0x0123 : 0x0120);
	}
	if ( (PChar->loc.prevzone >= 243) && (PChar->loc.prevzone <= 246) )
	{
		return 0x0100;
	}
	return 0x0100;
}

CZoneInPacket::CZoneInPacket(CCharEntity * PChar, int16 csid) 
{
	this->type = 0x0A;
	this->size = 0x82;

	WBUFL(data,(0x04)-4) = PChar->id;
	WBUFW(data,(0x08)-4) = PChar->targid;

	memcpy(data+(0x84)-4, PChar->GetName(), PChar->name.size());   

	WBUFB(data,(0x0B)-4) = PChar->loc.p.rotation;		
	WBUFF(data,(0x0C)-4) = PChar->loc.p.x;				
	WBUFF(data,(0x10)-4) = PChar->loc.p.y;				
	WBUFF(data,(0x14)-4) = PChar->loc.p.z;

	WBUFB(data,(0x1C)-4) = PChar->speed * (100 + PChar->getMod(MOD_MOVE)) / 100;
	WBUFB(data,(0x1D)-4) = PChar->speedsub;
	WBUFB(data,(0x1E)-4) = PChar->GetHPP();
	WBUFB(data,(0x1F)-4) = PChar->animation;

	uint32 time  = CVanaTime::getInstance()->getSysTime(); 

	WBUFL(data,(0x38)-4) = time;
	WBUFL(data,(0x3C)-4) = time - 1009810800;

	WBUFB(data,(0x44)-4) = PChar->look.face;
	WBUFB(data,(0x45)-4) = PChar->look.race;
	WBUFW(data,(0x46)-4) = PChar->look.head   + 0x1000;
	WBUFW(data,(0x48)-4) = PChar->look.body   + 0x2000;
	WBUFW(data,(0x4A)-4) = PChar->look.hands  + 0x3000;
	WBUFW(data,(0x4C)-4) = PChar->look.legs   + 0x4000;
	WBUFW(data,(0x4E)-4) = PChar->look.feet   + 0x5000;
	WBUFW(data,(0x50)-4) = PChar->look.main   + 0x6000;
	WBUFW(data,(0x52)-4) = PChar->look.sub    + 0x7000;
	WBUFW(data,(0x54)-4) = PChar->look.ranged + 0x8000;

	WBUFB(data,(0x56)-4) = PChar->loc.zone->GetBackgroundMusic();
	WBUFB(data,(0x58)-4) = PChar->loc.zone->GetBackgroundMusic();
	WBUFB(data,(0x5A)-4) = PChar->loc.zone->GetSoloBattleMusic();
	WBUFB(data,(0x5C)-4) = PChar->loc.zone->GetPartyBattleMusic();

	WBUFW(data,(0x60)-4) = PChar->loc.boundary;

	if(csid != -1) 
	{
	  //WBUFB(data,(0x1F)-4) = 4;								// animation
	  //WBUFB(data,(0x20)-4) = 2;

		WBUFB(data,(0x40)-4) = PChar->getZone();
		WBUFB(data,(0x62)-4) = PChar->getZone();
		WBUFW(data,(0x64)-4) = csid;
	}

	if (PChar->getZone() == 0) 
	{
		WBUFB(data,(0x80)-4) = 1;
		WBUFB(data,(0x30)-4) = PChar->loc.prevzone;				// form zone
		WBUFB(data,(0x42)-4) = PChar->loc.prevzone;				// from zone
	    WBUFW(data,(0xAA)-4) = GetMogHouseID(PChar);			// Mog House id
		WBUFB(data,(0xAE)-4) = PChar->profile.mhflag;			// Mog House leaving flag
	} else {
		WBUFB(data,(0x80)-4) = 2;										
		WBUFB(data,(0x30)-4) = PChar->getZone();				// to zone
		WBUFB(data,(0x42)-4) = PChar->getZone();				// to zone
	    WBUFW(data,(0xAA)-4) = 0x01FF;
	    WBUFB(data,(0xAC)-4) = 0x01;							// сообщаем клиенту, что он должен начать отправлять 0x15-ые пакеты лишь после полной загрузки
		WBUFB(data,(0xAF)-4) = PChar->loc.zone->CanUseMisc(MISC_MOGMENU);	// флаг, позволяет использовать mog menu за пределами mog house
	}

  //WBUFL(data,(0x98)-4) = PChar->clientip;

	WBUFL(data,(0xA0)-4) = 0x00000000;							// время, проведенное персонажем в игре с момента создания
	WBUFL(data,(0xA4)-4) = 0x00000000;							// оставшееся время до возрождения после смерти (формат времени неизвестен)

	memcpy(data+(0xCC)-4, &PChar->stats, 14);

    WBUFL(data,(0xE8)-4) = PChar->GetMaxHP();
    WBUFL(data,(0xEB)-4) = PChar->GetMaxMP();

	WBUFB(data,(0x100)-4) = 0x01;
}
