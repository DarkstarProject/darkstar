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

#include "zone_in.h"

#include "../entities/charentity.h"
#include "../../common/timer.h"
#include "../vana_time.h"
#include "../utils/zoneutils.h"

/************************************************************************
*                                                                       *
*  Кривое решение для вычисления ID MogHouse                            *
*  Возможно необходим переход на uint16 формат зоны                     * 
*                                                                       *
************************************************************************/

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

/************************************************************************
*                                                                       *
*                                                                       * 
*                                                                       *
************************************************************************/

uint8 GetMosHouseFlag(CCharEntity* PChar)
{
    if ((PChar->loc.prevzone >= 48) && (PChar->loc.prevzone <= 50))
	{
		if (PChar->profile.mhflag & 0x10) return 5;
	}
	if ((PChar->loc.prevzone >= 230) && (PChar->loc.prevzone <= 232))
	{
		if (PChar->profile.mhflag & 0x01) return 1;
	}
	if ((PChar->loc.prevzone >= 234) && (PChar->loc.prevzone <= 236))
	{
        if (PChar->profile.mhflag & 0x02) return 2;
	}
	if ((PChar->loc.prevzone >= 238) && (PChar->loc.prevzone <= 241))
	{
		if (PChar->profile.mhflag & 0x04) return 3;
	}
	if ((PChar->loc.prevzone >= 243) && (PChar->loc.prevzone <= 246))
	{
		if (PChar->profile.mhflag & 0x08) return 4;
	}
	return 0;
}

/************************************************************************
*                                                                       *
*                                                                       * 
*                                                                       *
************************************************************************/

CZoneInPacket::CZoneInPacket(CCharEntity * PChar, int16 csid) 
{
	this->type = 0x0A;
	this->size = 0x82;

    // необходимо для работы manaklipper
	// последние 8 байт похожи на время
	//unsigned char packet [] = {
	//0x0D, 0x3A, 0x0C, 0x00, 0x11, 0x00, 0x19, 0x00, 0x02, 0xE4, 0x93, 0x10, 0x91, 0xE5, 0x93, 0x10}; // 0x2a = 0x10 
    //0x89, 0x39, 0x0C, 0x00, 0x19, 0x00, 0x07, 0x00, 0x5C, 0xE1, 0x93, 0x10, 0x81, 0xE3, 0x93, 0x10}; // 0x2a = 0x08
	//memcpy(data + 0x70-4, &packet, 16);

    //data[0x2A-4] = 0x08;//data[0x2A-4] = 0x80;  // в зоне 3 управляет путями следования транспорта 0x10 и 0x08

	WBUFL(data,(0x04)-4) = PChar->id;
	WBUFW(data,(0x08)-4) = PChar->targid;

	memcpy(data+(0x84)-4, PChar->GetName(), PChar->name.size());   

	WBUFB(data,(0x0B)-4) = PChar->loc.p.rotation;		
	WBUFF(data,(0x0C)-4) = PChar->loc.p.x;				
	WBUFF(data,(0x10)-4) = PChar->loc.p.y;				
	WBUFF(data,(0x14)-4) = PChar->loc.p.z;

	WBUFB(data,(0x1C)-4) = PChar->GetSpeed();
	WBUFB(data,(0x1D)-4) = PChar->speedsub;
	WBUFB(data,(0x1E)-4) = PChar->GetHPP();
	WBUFB(data,(0x1F)-4) = PChar->animation;
    WBUFB(data,(0x21)-4) = PChar->GetGender() * 128 + (1 << PChar->look.size);

    look_t *look = (PChar->getStyleLocked() ? &PChar->mainlook : &PChar->look);
	WBUFB(data,(0x44)-4) = look->face;
	WBUFB(data,(0x45)-4) = look->race;
	WBUFW(data,(0x46)-4) = look->head   + 0x1000;
	WBUFW(data,(0x48)-4) = look->body   + 0x2000;
	WBUFW(data,(0x4A)-4) = look->hands  + 0x3000;
	WBUFW(data,(0x4C)-4) = look->legs   + 0x4000;
	WBUFW(data,(0x4E)-4) = look->feet   + 0x5000;
	WBUFW(data,(0x50)-4) = look->main   + 0x6000;
	WBUFW(data,(0x52)-4) = look->sub    + 0x7000;
	WBUFW(data,(0x54)-4) = look->ranged + 0x8000;

	if (PChar->m_Monstrosity != 0)
	{
		WBUFW(data, (0x44) - 4) = PChar->m_Monstrosity;
		WBUFW(data, (0x54) - 4) = 0xFFFF;
	}

        if(PChar->animation == ANIMATION_CHOCOBO && PChar->loc.zone->CanUseMisc(MISC_CHOCOBO)) {
		// Keep the Chocobo music going if we're on a Chocobo
                WBUFB(data,(0x56)-4) = 212;
                WBUFB(data,(0x58)-4) = 212;
        } else {
                WBUFB(data,(0x56)-4) = PChar->loc.zone->GetBackgroundMusic();
                WBUFB(data,(0x58)-4) = PChar->loc.zone->GetBackgroundMusic();
        }
	WBUFB(data,(0x5A)-4) = PChar->loc.zone->GetSoloBattleMusic();
	WBUFB(data,(0x5C)-4) = PChar->loc.zone->GetPartyBattleMusic();

	WBUFW(data,(0x60)-4) = PChar->loc.boundary;
    WBUFW(data,(0x68)-4) = PChar->loc.zone->GetWeather();
    WBUFL(data,(0x6A)-4) = PChar->loc.zone->GetWeatherChangeTime();
  //WBUFL(data,(0x6C)-4) = PChar->loc.zone->GetWeather();
  //WBUFL(data,(0x70)-4) = PChar->loc.zone->GetWeatherChangeTime();

	if(csid != -1) 
	{
	  //WBUFB(data,(0x1F)-4) = 4;								// предположительно animation
	  //WBUFB(data,(0x20)-4) = 2;

		WBUFW(data,(0x40)-4) = PChar->getZone();
		WBUFW(data,(0x62)-4) = PChar->getZone();
		WBUFW(data,(0x64)-4) = csid;
	}

	if (PChar->getZone() == 0) 
	{
		WBUFB(data,(0x80)-4) = 1;
		WBUFW(data,(0x30)-4) = PChar->loc.prevzone;             // form zone
		WBUFW(data,(0x42)-4) = PChar->loc.prevzone;             // from zone
	    WBUFW(data,(0xAA)-4) = GetMogHouseID(PChar);            // Mog House id
		WBUFB(data,(0xAE)-4) = GetMosHouseFlag(PChar);          // Mog House leaving flag
	} else {
		WBUFB(data,(0x80)-4) = 2;
		WBUFW(data,(0x30)-4) = PChar->getZone();                // to zone
		WBUFW(data,(0x42)-4) = PChar->getZone();                // to zone
	    WBUFW(data,(0xAA)-4) = 0x01FF;
        WBUFB(data,(0xAC)-4) = csid > 0 ? 0x01 : 0x00;          //if 0x01 then pause between zone
		WBUFB(data,(0xAF)-4) = PChar->loc.zone->CanUseMisc(MISC_MOGMENU);	// флаг, позволяет использовать mog menu за пределами mog house
	}

	WBUFL(data,(0xA0)-4) = PChar->GetPlayTime();				// время, проведенное персонажем в игре с момента создания

	uint32 pktTime = CVanaTime::getInstance()->getVanaTime() + 2; //buffering this by 2 prevents autohp

    WBUFL(data,(0x38)-4) = pktTime + VTIME_BASEDATE;
    WBUFL(data,(0x3C)-4) = pktTime;

    // 60min starts at 0x03A020 (66 min) and ventures down to 0x5460 (6 min)
    if (PChar->m_DeathCounter < 3600 && PChar->isDead())
        WBUFL(data,(0xA4)-4) = 0x03A020 - (60 * PChar->m_DeathCounter);

	memcpy(data+(0xCC)-4, &PChar->stats, 14);

    WBUFL(data,(0xE8)-4) = PChar->GetMaxHP();
    WBUFL(data,(0xEB)-4) = PChar->GetMaxMP();

	WBUFB(data,(0x100)-4) = 0x01;
}
