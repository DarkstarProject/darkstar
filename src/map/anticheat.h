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

#ifndef _CANTICHEAT_H
#define _CANTICHEAT_H

#include "../common/cbasetypes.h"
#include "entities/charentity.h"

namespace anticheat
{
    // Cheat type as appears in the cheat id column in the cheat_incidents table.
    enum class CheatID : uint32
    {
        // Player attempted to speed up synth (craft) by injecting a synth done
        // (0x59) packet. If anti cheating is enabled this will cause all cheated
        // crafts to fail.
        // Argument is the time spent on synth animation.
        CHEAT_ID_FASTSYNTH = 1,
        // For boundary checks
        CHEAT_ID_LAST
    };

    enum class CheatSeverity : uint8
    {
        // Debug purposes only. Characters cannot be jailed at this threshold
        CHEAT_SEVERITY_DEBUG = 0,
        // May be a cheat but there could be legitimate reasons
        CHEAT_SEVERITY_POSSIBLE = 1,
        // Probably a cheat though it is not tested enough to say with 100% accuracy
        CHEAT_SEVERITY_PROBABLE = 2,
        // Definitely a cheat - no possible legitimate reason for this to happen
        CHEAT_SEVERITY_DEFINITE = 3,
        // Very severe cast of cheating
        CHEAT_SEVERITY_SEVERE = 4,
        // For boundary checks
        CHEAT_SEVERITY_LAST
    };

    // Jail a given character. Used by the anti-cheat system if cheat severity
    // is over the cheat threshold.
    // PChar - Character to jail
    // cellid - Cell to jail the character in
    // returns true on success, false on failure
    bool JailChar(CCharEntity* PChar, uint32 cellid = 1);

    // Report a cheat, log into the incidents table and possibly jail the user
    // (according to the severity threshold in the map server configuration)
    // PChar - Character object eof the cheating player
    // cheatid - ID of the cheat caught
    // severity - Severity of the cheat attempt
    // cheatarg - Optional argument (varies by cheat ID)
    // description - Optional text description to be logged
    // returns true on success, false on failure
    bool ReportCheatIncident(CCharEntity* PChar, CheatID cheatid, CheatSeverity severity, uint32 cheatarg = 0, const char* description = NULL);

};

#endif
