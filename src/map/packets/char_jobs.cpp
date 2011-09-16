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

#include <string.h>

#include "char_jobs.h"
#include "../charentity.h"


CCharJobsPacket::CCharJobsPacket(CCharEntity * PChar) 
{
	this->type = 0x1B;
	this->size = 0x32;

	WBUFB(data,(0x04)-4) = PChar->look.race;

	WBUFB(data,(0x08)-4) = PChar->GetMJob();			// подсвечиваем желтым главную профессию
	WBUFB(data,(0x0B)-4) = PChar->GetSJob();			// подсвечиваем синим дополнительную профессию

	memcpy(data+(0x0C)-4, &PChar->jobs, 20);
	memcpy(data+(0x44)-4, &PChar->jobs, 25);

	WBUFL(data,(0x44)-4) = PChar->jobs.unlocked & 1;	// первый бит в unlocked отвечает за дополнительную профессию

	//memcpy(data+(0x20)-4, &PChar->stats, 14);

	WBUFL(data,(0x3C)-4) = PChar->health.hp;
	WBUFL(data,(0x40)-4) = PChar->health.mp;

	//WBUFW(data,(0x60)-4) =  blok; // битовое поле. блокировка ячеек экипировки, ячейка перечеркивается красным крестом. все ячейки - 0xFFFF
	//WBUFW(data,(0x62)-4) =  blok; // битовое поле. занижение физических характеристик, характеристика становится красной и рядом появляется красная стрелка.
}
