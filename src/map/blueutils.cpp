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

#include "../common/utils.h"

#include "packets/blue_set_spells.h"

#include <math.h>

#include "battleutils.h"
#include "grades.h"
#include "blueutils.h"
#include "modifier.h"
#include "spell.h"


namespace blueutils
{

void SetBlueSpell(CCharEntity* PChar, CSpell* PSpell, uint8 slotIndex, bool addingSpell) {
	// for now lets just let them do what they want

	//sanity check
	if (slotIndex < 20) {
		if (PSpell != NULL && PSpell->getID() > 0x200) {
			if (addingSpell) {
				// Blue spells in SetBlueSpells must be 0x200 ofsetted so it's 1 byte per spell.
				PChar->m_SetBlueSpells[slotIndex] = PSpell->getID() - 0x200; 
			}
			else {
				PChar->m_SetBlueSpells[slotIndex] = 0x00;
			}
			PChar->pushPacket(new CBlueSetSpellsPacket(PChar));
		}
	}
}

void HasEnoughSetPoints(CCharEntity* PChar, CSpell* PSpellToAdd, uint8 slotToPut) {

}

}

