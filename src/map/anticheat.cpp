/*
===========================================================================

  Copyright (c) 2010-2019 Darkstar Dev Teams

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

#include "anticheat.h"
#include "map.h"
#include "zone.h"
#include "utils/charutils.h"
#include "utils/zoneutils.h"

namespace anticheat
{
    // List of jail cell locations
    int32 g_jailCells[][4] = {
        // Floor 1 (Bottom)
        {-620, 11,  660, 0},  {-180, 11,  660, 0}, {260, 11,  660, 0}, {700, 11,  660, 0},
        {-620, 11,  220, 0},  {-180, 11,  220, 0}, {260, 11,  220, 0}, {700, 11,  220, 0},
        {-620, 11, -220, 0},  {-180, 11, -220, 0}, {260, 11, -220, 0}, {700, 11, -220, 0},
        {-620, 11, -620, 0},  {-180, 11, -620, 0}, {260, 11, -620, 0}, {700, 11, -620, 0},

        // Floor 2 (Top)
        {-620, -400,  660, 0},  {-180, -400,  660, 0}, {260, -400,  660, 0}, {700, -400,  660, 0},
        {-620, -400,  220, 0},  {-180, -400,  220, 0}, {260, -400,  220, 0}, {700, -400,  220, 0},
        {-620, -400, -220, 0},  {-180, -400, -220, 0}, {260, -400, -220, 0}, {700, -400, -220, 0},
        {-620, -400, -620, 0},  {-180, -400, -620, 0}, {260, -400, -620, 0}, {700, -400, -620, 0},
    };

    // Jail character
    bool JailChar(CCharEntity* PChar, uint32 cellid)
    {
        if (PChar == NULL) {
            return false;
        }
        // If given cell id is invalid default to cell #1
        if ((cellid == 0) || (cellid > 32)) {
            cellid = 1;
        }
        const char* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = 'inJail', value = %i ON DUPLICATE KEY UPDATE value = %i;";
        Sql_Query(SqlHandle, fmtQuery, PChar->id, cellid, cellid);
        PChar->loc.p.x = (float)g_jailCells[cellid-1][0];
        PChar->loc.p.y = (float)g_jailCells[cellid - 1][1];
        PChar->loc.p.z = (float)g_jailCells[cellid - 1][2];
        PChar->loc.p.rotation = (uint8)g_jailCells[cellid - 1][3];
        PChar->loc.destination = ZONEID::ZONE_MORDION_GAOL;
        PChar->status = STATUS_DISAPPEAR;
        PChar->loc.boundary = 0;
        PChar->m_moghouseID = 0;
        PChar->clearPacketList();
        charutils::SendToZone(PChar, 2, zoneutils::GetZoneIPP(PChar->loc.destination));
        return true;
    }

    // Log and possibly jail
    bool ReportCheatIncident(CCharEntity* PChar, CHEAT_ID cheatid, CHEAT_SEVERITY severity, uint32 cheatarg, const char* description)
    {
        if (PChar == NULL) {
            return false;
        }
        if (map_config.anticheat_enabled == false) {
            return false;
        }
        const char* fmtQuery = "INSERT INTO cheat_incidents SET charid = %u, incident_time = '%s', cheatid = %u, cheatarg = %u, severity = %u, description= '%s';";
        char strIncidentTime[128];
        time_t timeNow = time(NULL);
        strftime(strIncidentTime, sizeof(strIncidentTime), "%Y:%m:%d %H:%M:%S", gmtime(&timeNow));

        Sql_Query(SqlHandle, fmtQuery, PChar->id, strIncidentTime, cheatid, cheatarg, severity, description != NULL ? description : "");
        // if g_cheatJailSeverity is zero then jailing is disabled
        if ((map_config.anticheat_jail_threshold > 0) && (severity >= map_config.anticheat_jail_threshold)) {
            JailChar(PChar);
        }
        return true;
    }

}