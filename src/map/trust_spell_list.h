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

#ifndef _CTRUSTSPELLLIST_H
#define _CTRUSTSPELLLIST_H

#include <vector>

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "spell.h"

#define MAX_TRUSTSPELLLIST_ID		125

typedef struct
{
	SpellID spellId;
	uint16 min_level;
	uint16 max_level;
} TrustSpell_t;

class CTrustSpellList
{
public:

	CTrustSpellList();

  void AddSpell(SpellID spellId, uint16 minLvl, uint16 maxLvl);

  // main spell list
  std::vector<TrustSpell_t> m_spellList;

private:

};

/************************************************************************
*                                                                       *
*  namespase для работы с заклинаниями                                  *
*                                                                       *
************************************************************************/

namespace trustSpellList
{
    void LoadTrustSpellList();

    CTrustSpellList* GetTrustSpellList(uint16 TrustSpellListID);
};

#endif