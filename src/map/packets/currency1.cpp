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

#include "currency1.h"

#include "../entities/charentity.h"

CCurrencyPacket1::CCurrencyPacket1(CCharEntity* PChar)
{
	this->type = 0x13;
	this->size = 0x6F;

    const char* query = "SELECT sandoria_cp, bastok_cp, windurst_cp, beastman_seal, kindred_seal, kindred_crest, \
                        high_kindred_crest, sacred_kindred_crest, ancient_beastcoin, valor_point, scyld, \
                        guild_fishing, guild_woodworking, guild_smithing, guild_goldsmithing, guild_weaving, \
                        guild_leathercraft, guild_bonecraft, guild_alchemy, guild_cooking, cinder, fire_fewell, \
                        ice_fewell, wind_fewell, earth_fewell, lightning_fewell, water_fewell, light_fewell, \
                        dark_fewell, ballista_point, fellow_point, chocobuck_sandoria, chocobuck_bastok, chocobuck_windurst, \
                        research_mark, tunnel_worm, morion_worm, phantom_worm, moblin_marble, infamy, prestige, \
                        legion_point, spark_of_eminence, shining_star, imperial_standing, leujaoam_assault_point, \
                        mamool_assault_point, lebros_assault_point, periqia_assault_point, ilrusi_assault_point, \
                        nyzul_isle_assault_point, zeni_point, jetton, therion_ichor, allied_notes, cruor, resistance_credit, \
                        dominion_note, fifth_echelon_trophy, fourth_echelon_trophy, third_echelon_trophy, second_echelon_trophy, \
                        first_echelon_trophy, cave_points, id_tags, op_credits, traverser_stones, voidstones, kupofried_corundums, \
                        pheromone_sacks FROM char_points WHERE charid = %d";

    int ret = Sql_Query(SqlHandle, query, PChar->id);
    if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        WBUFL(data, (0x04)) = Sql_GetIntData(SqlHandle, 0);
        WBUFL(data, (0x08)) = Sql_GetIntData(SqlHandle, 1);
        WBUFL(data, (0x0C)) = Sql_GetIntData(SqlHandle, 2);

        WBUFW(data, (0x10)) = Sql_GetUIntData(SqlHandle, 3);
        WBUFW(data, (0x12)) = Sql_GetUIntData(SqlHandle, 4);
        WBUFW(data, (0x14)) = Sql_GetUIntData(SqlHandle, 5);
        WBUFW(data, (0x16)) = Sql_GetUIntData(SqlHandle, 6);
        WBUFW(data, (0x18)) = Sql_GetUIntData(SqlHandle, 7);
        WBUFW(data, (0x1A)) = Sql_GetUIntData(SqlHandle, 8);
        WBUFW(data, (0x1C)) = Sql_GetUIntData(SqlHandle, 9);
        WBUFW(data, (0x1E)) = Sql_GetUIntData(SqlHandle, 10);

        WBUFL(data, (0x20)) = Sql_GetIntData(SqlHandle, 11);
        WBUFL(data, (0x24)) = Sql_GetIntData(SqlHandle, 12);
        WBUFL(data, (0x28)) = Sql_GetIntData(SqlHandle, 13);
        WBUFL(data, (0x2C)) = Sql_GetIntData(SqlHandle, 14);
        WBUFL(data, (0x30)) = Sql_GetIntData(SqlHandle, 15);
        WBUFL(data, (0x34)) = Sql_GetIntData(SqlHandle, 16);
        WBUFL(data, (0x38)) = Sql_GetIntData(SqlHandle, 17);
        WBUFL(data, (0x3C)) = Sql_GetIntData(SqlHandle, 18);
        WBUFL(data, (0x40)) = Sql_GetIntData(SqlHandle, 19);

        WBUFL(data, (0x44)) = Sql_GetIntData(SqlHandle, 20);
        WBUFB(data, (0x48)) = Sql_GetUIntData(SqlHandle, 21);
        WBUFB(data, (0x49)) = Sql_GetUIntData(SqlHandle, 22);
        WBUFB(data, (0x4A)) = Sql_GetUIntData(SqlHandle, 23);
        WBUFB(data, (0x4B)) = Sql_GetUIntData(SqlHandle, 24);
        WBUFB(data, (0x4C)) = Sql_GetUIntData(SqlHandle, 25);
        WBUFB(data, (0x4D)) = Sql_GetUIntData(SqlHandle, 26);
        WBUFB(data, (0x4E)) = Sql_GetUIntData(SqlHandle, 27);
        WBUFB(data, (0x4F)) = Sql_GetUIntData(SqlHandle, 28);

        WBUFL(data, (0x50)) = Sql_GetIntData(SqlHandle, 29);
        WBUFL(data, (0x54)) = Sql_GetIntData(SqlHandle, 30);
        WBUFW(data, (0x58)) = Sql_GetUIntData(SqlHandle, 31);
        WBUFW(data, (0x5A)) = Sql_GetUIntData(SqlHandle, 32);
        WBUFW(data, (0x5C)) = Sql_GetUIntData(SqlHandle, 33);
        // daily tally (2 byte)
        WBUFL(data, (0x60)) = Sql_GetIntData(SqlHandle, 34);
        WBUFB(data, (0x64)) = Sql_GetUIntData(SqlHandle, 35);
        WBUFB(data, (0x65)) = Sql_GetUIntData(SqlHandle, 36);
        WBUFB(data, (0x66)) = Sql_GetUIntData(SqlHandle, 37);
        WBUFL(data, (0x68)) = Sql_GetIntData(SqlHandle, 38);

        WBUFW(data, (0x6C)) = Sql_GetUIntData(SqlHandle, 39);
        WBUFW(data, (0x6E)) = Sql_GetUIntData(SqlHandle, 40);

        WBUFL(data, (0x70)) = Sql_GetIntData(SqlHandle, 41);
        WBUFL(data, (0x74)) = Sql_GetIntData(SqlHandle, 42);
        WBUFL(data, (0x78)) = Sql_GetIntData(SqlHandle, 43);

        WBUFL(data, (0x7C)) = Sql_GetIntData(SqlHandle, 44);
        WBUFL(data, (0x80)) = Sql_GetIntData(SqlHandle, 45);
        WBUFL(data, (0x84)) = Sql_GetIntData(SqlHandle, 46);
        WBUFL(data, (0x88)) = Sql_GetIntData(SqlHandle, 47);
        WBUFL(data, (0x8C)) = Sql_GetIntData(SqlHandle, 48);
        WBUFL(data, (0x90)) = Sql_GetIntData(SqlHandle, 49);
        WBUFL(data, (0x94)) = Sql_GetIntData(SqlHandle, 50);
        WBUFL(data, (0x98)) = Sql_GetIntData(SqlHandle, 51);
        WBUFL(data, (0x9C)) = Sql_GetIntData(SqlHandle, 52);
        WBUFL(data, (0xA0)) = Sql_GetIntData(SqlHandle, 53);

        WBUFL(data, (0xA4)) = Sql_GetIntData(SqlHandle, 54);

        // AMAN vouchers
        // unity accolades

        WBUFL(data, (0xAC)) = Sql_GetIntData(SqlHandle, 55);
        WBUFL(data, (0xB0)) = Sql_GetIntData(SqlHandle, 56);
        WBUFL(data, (0xB4)) = Sql_GetIntData(SqlHandle, 57);
        WBUFB(data, (0xB8)) = Sql_GetUIntData(SqlHandle, 58);
        WBUFB(data, (0xB9)) = Sql_GetUIntData(SqlHandle, 59);
        WBUFB(data, (0xBA)) = Sql_GetUIntData(SqlHandle, 60);
        WBUFB(data, (0xBB)) = Sql_GetUIntData(SqlHandle, 61);
        WBUFB(data, (0xBC)) = Sql_GetUIntData(SqlHandle, 62);

        WBUFB(data, (0xBD)) = Sql_GetUIntData(SqlHandle, 63);

        WBUFB(data, (0xBE)) = Sql_GetUIntData(SqlHandle, 64);

        WBUFB(data, (0xBF)) = Sql_GetUIntData(SqlHandle, 65);

        WBUFL(data, (0xC0)) = Sql_GetIntData(SqlHandle, 66);
        WBUFL(data, (0xC4)) = Sql_GetIntData(SqlHandle, 67);
        WBUFL(data, (0xC8)) = Sql_GetIntData(SqlHandle, 68);

        WBUFB(data, (0xCC)) = Sql_GetUIntData(SqlHandle, 69);
    }
}