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

#ifndef _CTRUSTWSLIST_H
#define _CTRUSTWSLIST_H

#include <vector>

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "weapon_skill.h"

#define MAX_TRUSTWSLIST_ID		125

typedef struct
{
    uint16 wsMobId;
    //uint16 wsId;
	uint16 min_level;
	uint16 max_level;
} TrustWS_t;

class CTrustWSList
{
public:

	CTrustWSList();

  void AddWS(uint16 wsMobId, uint16 minLvl, uint16 maxLvl); //uint16 wsId

  // main spell list
  std::vector<TrustWS_t> m_wsList;

private:

};

/************************************************************************
*                                                                       *
*  namespase для работы с заклинаниями                                  *
*                                                                       *
************************************************************************/

namespace trustWSList
{
    void LoadTrustWSList();

    CTrustWSList* GetTrustWSList(uint16 TrustWSListID);
};

#endif