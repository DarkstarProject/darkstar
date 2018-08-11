/*
===========================================================================

Copyright (c) 2010-2018 Darkstar Dev Teams

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

#include "linkshell_concierge.h"

#include "../entities/charentity.h"
#include "../linkshell.h"
#include "../../common/utils.h"
#include "../../map/utils/zoneutils.h"


CLinkshellConciergePacket::CLinkshellConciergePacket(CCharEntity* PChar, uint32 conciergeID, uint32 csid, uint32 option, uint8 conciergeShareSettings)
{
	// conciergeShareSettings
    // 0 = default retail behaviour (each NPC has his/her own list)
    // 1 = Server-Wide shared (will ignore the Linkshell Concierge Type and set it to "everything" if used)
    

	this->type = 0x48;
	this->size = 0x40; // Size is always 128 bytes regardless what the packet is used for

	std::string lsName;
    // int8 DecodedName[21];
	int8 EncodedName[16];
	int32 ret = SQL_ERROR;
	std::string qStr;

	// Fill as Initialization packet by default
    // Marks the Slot offsets as 0xFE (0xFF is for unused)
	ref<uint8>(0x04) = 0xFE; // Slot 1
	ref<uint8>(0x05) = 0xFE; // Slot 2
	ref<uint8>(0x06) = 0xFE; // Slot 3
	ref<uint8>(0x07) = 0xFE; // Slot 4

	linkshellEntriesListed = 0;

	switch (option)
	{
	case 0: // do stuff
			// Initialization packet ?
		ref<uint8>(0x04) = 0xFE;
		ref<uint8>(0x05) = 0xFE;
		ref<uint8>(0x06) = 0xFE;
		ref<uint8>(0x07) = 0xFE;

		ref<uint32>(0x08) = 0x000801BF; // not sure if this is needed

		break;
	case 1: // Option 1 to 4 is for getting four times 4 Linkshell information blocks
	case 2:
	case 3:
	case 4:

        /*
            Example SQL Query to use
		    SELECT * FROM (
            SELECT t1.listingid, t1.npcid, t1.linkshellid, t1.lslanguage, t1.lspearlcount, t1.lsactivedays, t1.lstimezone, t1.lstimeofday, t2.color, t2.name
            FROM dspdb.linkshell_concierge t1 
            INNER JOIN dspdb.linkshells t2 ON t1.linkshellid = t2.linkshellid ORDER BY t1.listingid DESC LIMIT 16
            ) sub ORDER BY listingid ASC LIMIT 8,4 ;
		*/
        /*
            Note: If you want to use a more visual way of listing this for like a webpage, or in your database viewer, you can use the following;
                  This will however not list anything for non-existing Linkshells or Characters (the concierge itself still will, allowing you create a new shell-less linkshell)
            SELECT t2.name, t3.charname, t1.*, t2.color, t3.accid FROM linkshell_concierge t1
            INNER JOIN linkshells t2 ON t1.linkshellid = t2.linkshellid
            INNER JOIN chars t3 ON t1.madebyplayerid = t3.charid ;
        */

		// Fill in as No results first
		for (int8 i = 0; i < 4; i++)
		{
			uint8 slotOffset = ((option - 1) * 4) + i;
			ref<uint8>(0x04 + i) = 0xFF; // List offset
			ref<uint16>(0x08 + (i * 2)) = 0x0000; // Linkpearl icon
			ref<uint16>(0x10 + (i * 0x18)) = 0x0000; // LinkShellID
			ref<uint32>(0x70 + (i * 4)) = 0x00000000;
		}

        qStr = ("SELECT * FROM (");
        // sql fields      0             1         2               3              4                5                6              7               8         9
		qStr += "SELECT t1.listingid, t1.npcid, t1.linkshellid, t1.lslanguage, t1.lspearlcount, t1.lsactivedays, t1.lstimezone, t1.lstimeofday, t2.color, t2.name " ;
		qStr += "FROM linkshell_concierge t1 INNER JOIN linkshells t2 ON t1.linkshellid = t2.linkshellid ";
        qStr += " WHERE t1.lspearlcount > 0 ";

		if (conciergeShareSettings == 0)
		{
            // Defaul setting, each NPC his own list
			qStr += " AND t1.npcid = ";
			qStr += std::to_string(conciergeID);
		}
        /*
           Unused settings for conciergeShareSettings
           Don't need to add a WHERE case for server-wide sharing setting
		   if (conciergeShareSettings == 1)
		   {
		     qStr += " WHERE t1.npcid <> 0 ";
		   }
        */


		qStr += " ORDER BY t1.listingid DESC LIMIT 16 "; // Only list 16 newest entries
        qStr += ") sub ORDER BY listingid ASC "; // But showing them in the on the original order required the sub query
        qStr += " LIMIT "; // limiting them
		qStr += std::to_string((option -1) * 4); // starting point
		qStr += ",4";
		ret = Sql_Query(SqlHandle, qStr.c_str());

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
			// Valid results
			int i = 0;
			while ((ret == SQL_SUCCESS) && (i < 4))
			{
                
				uint16 lsID = Sql_GetUIntData(SqlHandle, 2);
				uint16 lsColor = Sql_GetUIntData(SqlHandle, 8);
				uint8 lsActive = 1; // 1 = active/used ; should always be set if we actually get to this point in code
				uint8 lsLanguage = Sql_GetUIntData(SqlHandle, 3); // 0 = none/other ; 1 = japanse ; 2 = english ; 3 = unknown(french?) ; 4 = unknown(german?) ; 5 = retail's real "other" that we won't use
				uint8 lsPearlCount = Sql_GetUIntData(SqlHandle, 4); // should be a number from 1 to 10
				uint8 lsActiveDays = Sql_GetUIntData(SqlHandle, 5);	// 0 = Everyday ; 1 = Weekends ; 2 = Weekdays ; 3 = Mondays ; 4 = Tuesdays ; 5 = Wednesdays ; 6 = Thursdays ; 7 = Fridays ; 8 = Saturdays ; 9 = Sundays
				uint8 lsTimeZone = Sql_GetUIntData(SqlHandle, 6); // 0 = at no time in particular ; 1 = JST ; 2 = PST | PDT ; 3 = GMT
				uint8 lsTimeOfDay = Sql_GetUIntData(SqlHandle, 7); // 0 = In the Morning ; 1 = In the Afternoon ; 2 = In the Evening ; 3 = At Night ; 4 = At the wee hours of the morning

			    /*
                Example settings:
                lsColor = 0xF300;
			    lsActive = 1;
			    lsLanguage = 1 + (slotOffset % 2);
			    lsPearlCount = 1 + (slotOffset % 8);
			    lsActiveDays = 0; // All days
			    lsTimeZone = 3; // GMT
			    lsTimeOfDay = 2; // in the evening
			    */


                // populate data
				uint8 slotOffset = ((option - 1) * 4) + i;
				ref<uint8>(0x04 + i) = slotOffset; // List offset
				ref<uint16>(0x08 + (i * 2)) = 0x0203; // Linkpearl icon

				ref<uint16>(0x10 + (i * 0x18)) = lsID; // LinkShellID (currently dummy value)
				ref<uint16>(0x12 + (i * 0x18)) = 0x0000; // seems to be always zero
				ref<uint16>(0x14 + (i * 0x18)) = slotOffset; // Looks like junk on retail
				ref<uint16>(0x16 + (i * 0x18)) = lsColor; // LinkShell Color (dummy blue color)
				ref<uint8>(0x18 + (i * 0x18)) = 0x03; // Looks like this is set to 3 if used or 0 if unused

			    // DecodeStringLinkshell(data[12], DecodedName);
			    // EncodeStringLinkshell((int8*)lsName.c_str(), (int8*)data + (0x19 + (i * 0x18)));
				int8* PlsName = Sql_GetData(SqlHandle, 9); // Linkshell Name
				lsName = ((char*)PlsName);
				EncodeStringLinkshell((int8*)lsName.c_str(), EncodedName);
				memcpy(data + (0x19 + (i * 0x18)), EncodedName, 15); // <-- note only 15 bytes copied, not 16 !!!


				// Start of encoding of LS options
				byte optionsOffset = 0x70 + (i * 4);
			    
				uint8 lsLanguageFlags = 0x00;
				// Could probably just replace this with a shift
				switch (lsLanguage)
				{
                    case 1: lsLanguageFlags = 0x01; break; // JP
				    case 2: lsLanguageFlags = 0x02; break; // EN
				    // case 3: lsLanguageFlags = 0x04; break; // unused now, French?
				    // case 4: lsLanguageFlags = 0x08; break; // unused now, German?
				    case 5: lsLanguageFlags = 0x10; break; // Other
                    default: lsLanguageFlags = 0x10; break; // 0 should be "none defined", but we correct this as "Other"
                }
                
				ref<uint32>(optionsOffset) = 0x00000000; // Example: 0x002AD085  English 2 pearls, Tuesdays evening GMT

				packBitsBE(data + optionsOffset, lsActive, 0, 1);
				packBitsBE(data + optionsOffset, lsLanguageFlags, 1, 5);
				packBitsBE(data + optionsOffset, lsPearlCount, 6, 4);
				packBitsBE(data + optionsOffset, lsActiveDays, 10, 4);
				packBitsBE(data + optionsOffset, lsTimeZone, 14, 2);
				packBitsBE(data + optionsOffset, lsTimeOfDay, 16, 3);
				//packBitsBE(data + optionsOffset, slotOffset, 19, 4); // add something dummy here ?

				linkshellEntriesListed++;

				i++;
				ret = Sql_NextRow(SqlHandle);
			}
            

		}
		break;

    case 5:
        // Contains Linkshell ID to purchase
        DSP_DEBUG_BREAK_IF(true);
        break;
    case 6: // Called together with 5, but does not contain the Linkshell ID
    case 7:
        DSP_DEBUG_BREAK_IF(true);
        break;

	default:
        DSP_DEBUG_BREAK_IF(true);
		break;
	}

}