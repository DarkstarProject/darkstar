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


#include "../common/showmsg.h"
#include "../common/timer.h"
#include "../common/utils.h"

#include <string.h>

#include "utils/battleutils.h"
#include "utils/charutils.h"
#include "enmity_container.h"
#include "utils/itemutils.h"
#include "map.h"
#include "utils/mobutils.h"
#include "entities/npcentity.h"
#include "entities/petentity.h"
#include "utils/petutils.h"
#include "spell.h"
#include "treasure_pool.h"
#include "vana_time.h"
#include "zone_instance.h"
#include "ai/ai_mob_dummy.h"

#include "lua/luautils.h"

#include "packets/action.h"
#include "packets/char.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/entity_update.h"
#include "packets/fade_out.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/lock_on.h"
#include "packets/message_basic.h"
#include "packets/server_ip.h"
#include "packets/wide_scan.h"

/************************************************************************
*																		*
*  Класс CZoneInstance													*
*																		*
************************************************************************/

CZoneInstance::CZoneInstance(ZONEID ZoneID, REGIONTYPE RegionID, CONTINENTTYPE ContinentID) 
: CZone(ZoneID, RegionID, ContinentID)
{

}

void  CZoneInstance::HealAllMobs()
{

}

void CZoneInstance::InsertMOB(CBaseEntity* PMob)
{

}

void CZoneInstance::InsertNPC(CBaseEntity* PNpc)
{

}

void CZoneInstance::DeletePET(CBaseEntity* PPet)
{

}

void CZoneInstance::InsertPET(CBaseEntity* PPet)
{

}

void CZoneInstance::FindPartyForMob(CBaseEntity* PEntity)
{

}

void CZoneInstance::TransportDepart(CBaseEntity* PTransportNPC)
{

}

void CZoneInstance::DecreaseZoneCounter(CCharEntity* PChar)
{

}

void CZoneInstance::IncreaseZoneCounter(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnMOBs(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnPETs(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnNPCs(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnPCs(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnMoogle(CCharEntity* PChar)
{

}

void CZoneInstance::SpawnTransport(CCharEntity* PChar)
{

}

void CZoneInstance::TOTDChange(TIMETYPE TOTD)
{

}

void CZoneInstance::PushPacket(CBaseEntity* PEntity, GLOBAL_MESSAGE_TYPE message_type, CBasicPacket* packet)
{

}

void CZoneInstance::WideScan(CCharEntity* PChar, uint16 radius)
{

}

void CZoneInstance::ZoneServer(uint32 tick)
{

}

void CZoneInstance::ZoneServerRegion(uint32 tick)
{

}