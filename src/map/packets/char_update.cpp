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

#include "../../common/socket.h"
#include "../../common/showmsg.h"

#include <string.h>

#include "char_update.h"

#include "../charentity.h"
#include "../itemutils.h"
#include "../vana_time.h"


CCharUpdatePacket::CCharUpdatePacket(CCharEntity* PChar) 
{
	this->type = 0x37;
	this->size = 0x28;

	memcpy(data+(0x04)-4, PChar->StatusEffectContainer->m_StatusIcons, 32);

	WBUFL(data,(0x24)-4) = PChar->id;
	WBUFB(data,(0x2A)-4) = PChar->GetHPP();

	WBUFB(data,(0x28)-4) = (PChar->nameflags.byte2 << 1);
	WBUFB(data,(0x2B)-4) = (PChar->nameflags.byte4 << 5) + PChar->nameflags.byte3;
	WBUFB(data,(0x2F)-4) = (PChar->nameflags.byte4 >> 2);

	if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_INVISIBLE) || PChar->StatusEffectContainer->HasStatusEffect(EFFECT_HIDE) 
		|| PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CAMOUFLAGE))
	{
		data[0x2D-0x04] = 0x80;
	}

	
	if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK)) 
	{
		data[0x38-0x04] ^= 0x04;
	}


	WBUFB(data,(0x29)-4) = (PChar->look.race)%2 ^ (PChar->look.race > 6);

	WBUFB(data,(0x2C)-4) = PChar->speed * (100 + PChar->getMod(MOD_MOVE)) / 100;	
	WBUFB(data,(0x30)-4) = PChar->animation;

	CItemLinkshell* linkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

	if ((linkshell != NULL) && (linkshell->getType() & ITEM_LINKSHELL))
	{
		lscolor_t LSColor = linkshell->GetLSColor();
		
		WBUFB(data,(0x31)-4) = LSColor.R << 4;
		WBUFB(data,(0x32)-4) = LSColor.G << 4;
		WBUFB(data,(0x33)-4) = LSColor.B << 4;
	}

	if (PChar->PPet != NULL)
	{
		WBUFW(data,(0x34)-4) = PChar->PPet->targid << 3;
	}

	WBUFB(data,(0x36)-4) = 0x20;  //Ballista flag, bit 6, 0 = ballista, 1 = not ballista

	// chocobo ?
	WBUFB(data,(0x3C)-4) = 0x20;
	WBUFB(data,(0x3D)-4) = 0xA0;
	WBUFB(data,(0x3E)-4) = 0x03;

	WBUFL(data,(0x40)-4) = CVanaTime::getInstance()->getSysTime() - 1009810800;

	if (PChar->animation == ANIMATION_FISHING_START)
	{
		WBUFB(data,(0x4A)-4) = 0x10;		
	}
	WBUFL(data,(0x4C)-4) = PChar->StatusEffectContainer->m_Flags;
}