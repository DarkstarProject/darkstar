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

#ifndef _PUPUTILS_H
#define _PUPUTILS_H

#include "../entities/charentity.h"
#include "../items/item_puppet.h"
#include "../status_effect.h"

namespace puppetutils
{
	void LoadAutomaton(CCharEntity* PChar);
	void SaveAutomaton(CCharEntity* PChar);
	bool UnlockAttachment(CCharEntity* PChar, CItem* PItem);
    bool HasAttachment(CCharEntity* PChar, CItem* PItem);
    void setAttachment(CCharEntity* PChar, std::uint8_t slotId, std::uint8_t attachment);
    void setFrame(CCharEntity* PChar, std::uint8_t frame);
    void setHead(CCharEntity* PChar, std::uint8_t head);
    std::uint16_t getSkillCap(CCharEntity* PChar, SKILLTYPE skill, std::uint8_t level);
    std::uint16_t getSkillCap(CCharEntity* PChar, SKILLTYPE skill);
    void TrySkillUP(CAutomatonEntity* PAutomaton, SKILLTYPE SkillID, std::uint8_t lvl);
    void LoadAutomatonStats(CCharEntity* PChar);
    void CheckAttachmentsForManeuver(CCharEntity* PChar, EFFECT maneuver, bool gain);
};

#endif