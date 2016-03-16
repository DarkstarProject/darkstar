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
	if ( (PChar->getZone() >= 48) && (PChar->getZone() <= 50) )
	{
		return 0x00D6;
	}
	if ( (PChar->getZone() >= 230) && (PChar->getZone() <= 232) )
	{
		return (PChar->profile.nation == 0 ? 0x0121 : 0x0101);
	}
	if ( (PChar->getZone() >= 234) && (PChar->getZone() <= 236) )
	{
		return (PChar->profile.nation == 1 ? 0x0122 : 0x0102);
	}
	if ( (PChar->getZone() >= 238) && (PChar->getZone() <= 241) )
	{
		return (PChar->profile.nation == 2 ?  0x0123 : 0x0120);
	}
	if ( (PChar->getZone() >= 243) && (PChar->getZone() <= 246) )
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
    if ((PChar->getZone() >= 48) && (PChar->getZone() <= 50))
	{
		if (PChar->profile.mhflag & 0x10) return 5;
	}
	if ((PChar->getZone() >= 230) && (PChar->getZone() <= 232))
	{
		if (PChar->profile.mhflag & 0x01) return 1;
	}
	if ((PChar->getZone() >= 234) && (PChar->getZone() <= 236))
	{
        if (PChar->profile.mhflag & 0x02) return 2;
	}
	if ((PChar->getZone() >= 238) && (PChar->getZone() <= 241))
	{
		if (PChar->profile.mhflag & 0x04) return 3;
	}
	if ((PChar->getZone() >= 243) && (PChar->getZone() <= 246))
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
	//memcpy(data + 0x70, &packet, 16);

    //data[0x2A] = 0x08;//data[0x2A] = 0x80;  // в зоне 3 управляет путями следования транспорта 0x10 и 0x08

	WBUFL(data,(0x04)) = PChar->id;
	WBUFW(data,(0x08)) = PChar->targid;

	memcpy(data+(0x84), PChar->GetName(), PChar->name.size());   

	WBUFB(data,(0x0B)) = PChar->loc.p.rotation;		
	WBUFF(data,(0x0C)) = PChar->loc.p.x;				
	WBUFF(data,(0x10)) = PChar->loc.p.y;				
	WBUFF(data,(0x14)) = PChar->loc.p.z;

	WBUFB(data,(0x1C)) = PChar->GetSpeed();
	WBUFB(data,(0x1D)) = PChar->speedsub;
	WBUFB(data,(0x1E)) = PChar->GetHPP();
	WBUFB(data,(0x1F)) = PChar->animation;
    WBUFB(data,(0x21)) = PChar->GetGender() * 128 + (1 << PChar->look.size);

    look_t *look = (PChar->getStyleLocked() ? &PChar->mainlook : &PChar->look);
	WBUFB(data,(0x44)) = look->face;
	WBUFB(data,(0x45)) = look->race;
	WBUFW(data,(0x46)) = look->head   + 0x1000;
	WBUFW(data,(0x48)) = look->body   + 0x2000;
	WBUFW(data,(0x4A)) = look->hands  + 0x3000;
	WBUFW(data,(0x4C)) = look->legs   + 0x4000;
	WBUFW(data,(0x4E)) = look->feet   + 0x5000;
	WBUFW(data,(0x50)) = look->main   + 0x6000;
	WBUFW(data,(0x52)) = look->sub    + 0x7000;
	WBUFW(data,(0x54)) = look->ranged + 0x8000;

	if (PChar->m_Monstrosity != 0)
	{
		WBUFW(data, (0x44) ) = PChar->m_Monstrosity;
		WBUFW(data, (0x54) ) = 0xFFFF;
	}

	WBUFB(data,(0x56)) = PChar->loc.zone->GetBackgroundMusicDay();
	WBUFB(data,(0x58)) = PChar->loc.zone->GetBackgroundMusicNight();
	WBUFB(data,(0x5A)) = PChar->loc.zone->GetSoloBattleMusic();
	WBUFB(data,(0x5C)) = PChar->loc.zone->GetPartyBattleMusic();
    WBUFB(data,(0x5E)) = 0xD4; //default chocobo music for all zones

	WBUFW(data,(0x60)) = PChar->loc.boundary;
    WBUFW(data,(0x68)) = PChar->loc.zone->GetWeather();
    WBUFL(data,(0x6A)) = PChar->loc.zone->GetWeatherChangeTime();
  //WBUFL(data,(0x6C)) = PChar->loc.zone->GetWeather();
  //WBUFL(data,(0x70)) = PChar->loc.zone->GetWeatherChangeTime();

	if(csid != -1) 
	{
	  //WBUFB(data,(0x1F)) = 4;								// предположительно animation
	  //WBUFB(data,(0x20)) = 2;

		WBUFW(data,(0x40)) = PChar->getZone();
		WBUFW(data,(0x62)) = PChar->getZone();
		WBUFW(data,(0x64)) = csid;
	}

    WBUFW(data, (0x30) ) = PChar->getZone();
    WBUFW(data, (0x42) ) = PChar->getZone();

	if (PChar->m_moghouseID != 0) 
	{
		WBUFB(data,(0x80)) = 1;
	    WBUFW(data,(0xAA)) = GetMogHouseID(PChar);            // Mog House id
		WBUFB(data,(0xAE)) = GetMosHouseFlag(PChar);          // Mog House leaving flag
	} else {
		WBUFB(data,(0x80)) = 2;
	    WBUFW(data,(0xAA)) = 0x01FF;
        WBUFB(data,(0xAC)) = csid > 0 ? 0x01 : 0x00;          //if 0x01 then pause between zone
		WBUFB(data,(0xAF)) = PChar->loc.zone->CanUseMisc(MISC_MOGMENU);	// флаг, позволяет использовать mog menu за пределами mog house
	}

	WBUFL(data,(0xA0)) = PChar->GetPlayTime();				// время, проведенное персонажем в игре с момента создания

    uint32 pktTime = CVanaTime::getInstance()->getVanaTime();

    WBUFL(data,(0x38)) = pktTime + VTIME_BASEDATE;
    WBUFL(data,(0x3C)) = pktTime;

    // 60min starts at 0x03A020 (66 min) and ventures down to 0x5460 (6 min)
    if (PChar->m_DeathCounter < 3600 && PChar->isDead())
        WBUFL(data,(0xA4)) = 0x03A020 - (60 * PChar->m_DeathCounter);

	ref<uint8>(0xB4) = PChar->GetMJob();
	ref<uint8>(0xB7) = PChar->GetSJob();

	memcpy(data+(0xCC), &PChar->stats, 14);

    WBUFL(data,(0xE8)) = PChar->GetMaxHP();
    WBUFL(data,(0xEC)) = PChar->GetMaxMP();

    WBUFB(data, (0x100)) = 0x01;
}
