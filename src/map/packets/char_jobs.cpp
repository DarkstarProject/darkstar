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

#include "char_jobs.h"
#include "../entities/charentity.h"


CCharJobsPacket::CCharJobsPacket(CCharEntity * PChar)
{
	this->type = 0x1B;
	this->size = 0x32;

	ref<uint8>(0x04) = PChar->look.race;

	ref<uint8>(0x08) = PChar->GetMJob();			    // подсвечиваем желтым главную профессию
	ref<uint8>(0x0B) = PChar->GetSJob();			    // подсвечиваем синим дополнительную профессию

	memcpy(data+(0x0C), &PChar->jobs, 22);
    memcpy(data+(0x20), &PChar->stats,14);
	memcpy(data+(0x44), &PChar->jobs, 27);

    ref<uint32>(0x3C) = PChar->health.hp;
	ref<uint32>(0x40) = PChar->health.mp;

	ref<uint32>(0x44) = PChar->jobs.unlocked & 1;    // первый бит в unlocked отвечает за дополнительную профессию

    ref<uint16>(0x60) = PChar->m_EquipBlock;         // заблокированные ячейки экипировки
    ref<uint16>(0x62) = PChar->m_StatsDebilitation;  // битовое поле. занижение физических характеристик, характеристика становится красной и рядом появляется красная стрелка.
}
