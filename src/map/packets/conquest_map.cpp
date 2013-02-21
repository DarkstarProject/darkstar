/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../charentity.h"
#include "../conquest_system.h"

#include "conquest_map.h"


CConquestPacket::CConquestPacket(CCharEntity * PChar) 
{
	this->type = 0x5E; 
	this->size = 0x5A;

	WBUFB(data,(0x04)-4) = conquest::GetBalance();

    WBUFL(data,(0x1A)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_RONFAURE));
	WBUFL(data,(0x1C)-4) = conquest::GetInfluenceGraphics(REGION_RONFAURE);
	WBUFL(data,(0x1D)-4) = 1 + conquest::GetRegionOwner(REGION_RONFAURE);
	WBUFL(data,(0x1E)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_ZULKHEIM));
	WBUFL(data,(0x20)-4) = conquest::GetInfluenceGraphics(REGION_ZULKHEIM);
	WBUFL(data,(0x21)-4) = 1 + conquest::GetRegionOwner(REGION_ZULKHEIM);
	WBUFL(data,(0x22)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_NORVALLEN));
	WBUFL(data,(0x24)-4) = conquest::GetInfluenceGraphics(REGION_NORVALLEN);
	WBUFL(data,(0x25)-4) = 1 + conquest::GetRegionOwner(REGION_NORVALLEN);
	WBUFL(data,(0x26)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_GUSTABERG));
	WBUFL(data,(0x28)-4) = conquest::GetInfluenceGraphics(REGION_GUSTABERG);
	WBUFL(data,(0x29)-4) = 1 + conquest::GetRegionOwner(REGION_GUSTABERG);
	WBUFL(data,(0x2A)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_DERFLAND));
	WBUFL(data,(0x2C)-4) = conquest::GetInfluenceGraphics(REGION_DERFLAND);
	WBUFL(data,(0x2D)-4) = 1 + conquest::GetRegionOwner(REGION_DERFLAND);
	WBUFL(data,(0x2E)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_SARUTABARUTA));
	WBUFL(data,(0x30)-4) = conquest::GetInfluenceGraphics(REGION_SARUTABARUTA);
	WBUFL(data,(0x31)-4) = 1 + conquest::GetRegionOwner(REGION_SARUTABARUTA);
	WBUFL(data,(0x32)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_KOLSHUSHU));
	WBUFL(data,(0x34)-4) = conquest::GetInfluenceGraphics(REGION_KOLSHUSHU);
	WBUFL(data,(0x35)-4) = 1 + conquest::GetRegionOwner(REGION_KOLSHUSHU);
	WBUFL(data,(0x36)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_ARAGONEU));
	WBUFL(data,(0x38)-4) = conquest::GetInfluenceGraphics(REGION_ARAGONEU);
	WBUFL(data,(0x39)-4) = 1 + conquest::GetRegionOwner(REGION_ARAGONEU);
	WBUFL(data,(0x3A)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_FAUREGANDI));
	WBUFL(data,(0x3C)-4) = conquest::GetInfluenceGraphics(REGION_FAUREGANDI);
	WBUFL(data,(0x3D)-4) = 1 + conquest::GetRegionOwner(REGION_FAUREGANDI);
	WBUFL(data,(0x3E)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_VALDEAUNIA));
	WBUFL(data,(0x40)-4) = conquest::GetInfluenceGraphics(REGION_VALDEAUNIA);
	WBUFL(data,(0x41)-4) = 1 + conquest::GetRegionOwner(REGION_VALDEAUNIA);
	WBUFL(data,(0x42)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_QUFIMISLAND));
	WBUFL(data,(0x44)-4) = conquest::GetInfluenceGraphics(REGION_QUFIMISLAND);
	WBUFL(data,(0x45)-4) = 1 + conquest::GetRegionOwner(REGION_QUFIMISLAND);
	WBUFL(data,(0x46)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_LITELOR));
	WBUFL(data,(0x48)-4) = conquest::GetInfluenceGraphics(REGION_LITELOR);
	WBUFL(data,(0x49)-4) = 1 + conquest::GetRegionOwner(REGION_LITELOR);
	WBUFL(data,(0x4A)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_KUZOTZ));
	WBUFL(data,(0x4C)-4) = conquest::GetInfluenceGraphics(REGION_KUZOTZ);
	WBUFL(data,(0x4D)-4) = 1 + conquest::GetRegionOwner(REGION_KUZOTZ);
	WBUFL(data,(0x4E)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_VOLLBOW));
	WBUFL(data,(0x50)-4) = conquest::GetInfluenceGraphics(REGION_VOLLBOW);
	WBUFL(data,(0x51)-4) = 1 + conquest::GetRegionOwner(REGION_VOLLBOW);
	WBUFL(data,(0x52)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_ELSHIMOLOWLANDS));
	WBUFL(data,(0x54)-4) = conquest::GetInfluenceGraphics(REGION_ELSHIMOLOWLANDS);
	WBUFL(data,(0x55)-4) = 1 + conquest::GetRegionOwner(REGION_ELSHIMOLOWLANDS);
	WBUFL(data,(0x56)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_ELSHIMOUPLANDS));
	WBUFL(data,(0x58)-4) = conquest::GetInfluenceGraphics(REGION_ELSHIMOUPLANDS);
	WBUFL(data,(0x59)-4) = 1 + conquest::GetRegionOwner(REGION_ELSHIMOUPLANDS);
	WBUFL(data,(0x5A)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_TULIA));
	WBUFL(data,(0x5C)-4) = conquest::GetInfluenceGraphics(REGION_TULIA);
	WBUFL(data,(0x5D)-4) = 1 + conquest::GetRegionOwner(REGION_TULIA);
	WBUFL(data,(0x5E)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_MOVALPOLOS));
	WBUFL(data,(0x60)-4) = conquest::GetInfluenceGraphics(REGION_MOVALPOLOS);
	WBUFL(data,(0x61)-4) = 1 + conquest::GetRegionOwner(REGION_MOVALPOLOS);
	WBUFL(data,(0x62)-4) = 0x00801515 + 0x01000000 * (1 + conquest::GetRegionOwner(REGION_TAVNAZIA));
	WBUFL(data,(0x64)-4) = conquest::GetInfluenceGraphics(REGION_TAVNAZIA);
	WBUFL(data,(0x65)-4) = 1 + conquest::GetRegionOwner(REGION_TAVNAZIA);

	WBUFB(data,(0x8C)-4) = conquest::GetNexTally();
    WBUFL(data,(0x90)-4) = PChar->RegionPoints[PChar->profile.nation];
	WBUFB(data,(0x9C)-4) = 0x01;

	//uint8 packet[] = 
    //{
	//    0x80, 0x78, 0x52, 0x03, 0x1a, 0x46, 0x04, 0x00, 0x42, 0x46, 0x04, 0x00, 0x65, 0x3d, 0x04, 0x00
    //};
	//memcpy(data+(0xA0)-4, &packet, 16);

	WBUFL(data,(0xA0)-4) = 16; // Situation: mamool ja niveau -> (1) 16 (2) 32 (3) 48 (4) 64 (5) 80 (6) 96 (7) 112 (8) 128
	WBUFL(data,(0xA1)-4) = 17; // Situation: mercenaire trolls niveau -> 1~12 la suite avec un autre 
	WBUFL(data,(0xA2)-4) = 0; // Situation: mamool ja status du siege -> (0) entrainement > (1) en marche > (2) attaque > (3) retraite | (4) defense (5) preparation
	WBUFL(data,(0xA3)-4) = 4; // Situation: undead status du siege ? (3) defense (4) entrainement (5) defense

	WBUFL(data,(0xA4)-4) = 0; // mamool ja: (13) preparation (26) attaque (32) entrainement
	WBUFL(data,(0xA5)-4) = 0; // mamool ja: forces ennemies (1=32)
	WBUFL(data,(0xA6)-4) = 0; // mamool ja: miroir archaique (1=2)
	WBUFL(data,(0xA7)-4) = 0;

	WBUFL(data,(0xA8)-4) = 0; // trolls: forces ennemies (66=8)
	WBUFL(data,(0xA9)-4) = 0; // trolls: (70) attaque
	WBUFL(data,(0xAA)-4) = 0; // trolls: miroir archaique (4=8)
	WBUFL(data,(0xAB)-4) = 0;
	WBUFL(data,(0xAC)-4) = 0; // undead: forces ennemies (101=12)
	WBUFL(data,(0xAD)-4) = 0; // undead: (61) preparation
	WBUFL(data,(0xAE)-4) = 0; // undead: miroir archaique (4=8)
	WBUFL(data,(0xAF)-4) = 0;

	WBUFL(data,(0xB0)-4) = PChar->RegionPoints[3];
}
