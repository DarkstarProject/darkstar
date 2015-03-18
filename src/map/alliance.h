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

#ifndef _CALLIANCE_H
#define _CALLIANCE_H

#include "map.h"
#include "../common/cbasetypes.h"

#include <vector>

class CBasicPacket;
class CBattleEntity;
class CCharEntity;
class CParty;


//it's assumed here that the alliance leader is the party leader of the lead party. sounds confusing, but it's logical.
class CAlliance
{
public:

    CAlliance(CBattleEntity* PEntity);
	CAlliance(uint32 id);

	uint32  m_AllianceID;
	CParty* getMainParty();
	void setMainParty(CParty * aLeader);
    void addParty(CParty * party);
	void addParty(uint32 partyid);
    void pushParty(CParty* PParty, uint8 number);
	void removeParty(CParty * party);
    void delParty(CParty* party);
    void dissolveAlliance(bool playerInitiated = true);
	uint32 partyCount(void);
    void assignAllianceLeader(const char* name);

	std::vector<CParty*> partyList; //list of parties in alliance

private:

	CParty* aLeader;		      		//alliance lead party
};

#endif

