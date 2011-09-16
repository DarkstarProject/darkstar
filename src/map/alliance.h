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

#ifndef _CALLIANCE_H
#define _CALLIANCE_H

#include "../common/cbasetypes.h"

#include <vector>

class CCharEntity;
class CParty;

//it's assumed here that the alliance leader is the party leader of the lead party. sounds confusing, but it's logical.
class CAlliance 
{
public:
	CAlliance(void);
	~CAlliance(void);

	CParty * getMainParty();
	int setMainParty(CParty * aLeader);
	int addParty(CParty * party);
	int removeParty(CParty * party);
	int dissolveAlliance(void);
	unsigned int partyCount(void);
	std::vector<CParty*> partyList; //list of parties in alliance

private:

	CParty * aLeader;		      		//alliance lead party
};

#endif

