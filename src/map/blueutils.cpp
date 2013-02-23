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
#include "packets/char_spells.h"

#include <math.h>

#include "packets/message_basic.h"
#include "packets/char_update.h"
#include "packets/char_health.h"

#include "battleutils.h"
#include "charutils.h"
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
				//PChar->addModifiers(&PSpell->modList);
			}
			else {
				PChar->m_SetBlueSpells[slotIndex] = 0x00;
				//PChar->delModifiers(&PSpell->modList);
			}
			PChar->status = STATUS_UPDATE;
			PChar->pushPacket(new CBlueSetSpellsPacket(PChar));
			PChar->pushPacket(new CCharUpdatePacket(PChar));
			charutils::CalculateStats(PChar);
			PChar->UpdateHealth();
			PChar->pushPacket(new CCharHealthPacket(PChar));
		}
	}
}

void TryLearningSpells(CCharEntity* PChar, CMobEntity* PMob) {

	if (PMob->m_UsedSkillIds.size() == 0) { // minor optimisation.
		return;
	}

	// prune the learnable blue spells
	std::vector<CSpell*> PLearnableSpells;
	for (std::map<uint16, uint16>::iterator i=PMob->m_UsedSkillIds.begin(); i != PMob->m_UsedSkillIds.end(); ++i) {
		CSpell* PSpell = spell::GetSpellByMonsterSkillId(i->first);
		if (PSpell != NULL) {
			PLearnableSpells.push_back(PSpell);
		}
	}

	if (PLearnableSpells.size() == 0) {
		return;
	}

	std::vector<CCharEntity*> PBlueMages;

	// populate PBlueMages
	if (PChar->PParty != NULL) {
        for (uint8 i = 0; i < PChar->PParty->members.size(); i++) {
			if (PChar->PParty->members[i]->GetMJob() == JOB_BLU && PChar->PParty->members[i]->objtype == TYPE_PC) {
				PBlueMages.push_back((CCharEntity*)PChar->PParty->members[i]);
			}
		}
	}
	else if (PChar->GetMJob() == JOB_BLU) {
		PBlueMages.push_back(PChar);
	}

	// loop through the list of BLUs and see if they can learn.
	for (int i=0; i<PBlueMages.size(); i++) {
		CCharEntity* PBlueMage = PBlueMages[i];

		if (PBlueMage->isDead()) { // too dead to learn
			continue;
		}

		if (distance(PBlueMage->loc.p, PMob->loc.p) > 100) { // too far away to learn
			continue;
		}

		for (int spell=0; spell<PLearnableSpells.size(); spell++) {
			CSpell* PSpell = PLearnableSpells[spell];

			if (charutils::hasSpell(PBlueMage, PSpell->getID())) {
				continue;
			}

			uint8 learnableLevel = PSpell->getJob(JOB_BLU);
			if (learnableLevel > 0 && learnableLevel < PBlueMage->GetMLevel()+7) { // TODO: Use blue magic skill check rather than level
				if (rand()%100 < 25) {
					if (charutils::addSpell(PBlueMage, PSpell->getID())) {
						PBlueMage->pushPacket(new CMessageBasicPacket(PBlueMage, PBlueMage, PSpell->getID(), 0, MSGBASIC_LEARNS_SPELL));
						charutils::SaveSpells(PBlueMage);
						PBlueMage->pushPacket(new CCharSpellsPacket(PBlueMage));
					}
				}
				break; // only one attempt at learning a spell, regardless of learn or not.
			}
		}

	}
}

void HasEnoughSetPoints(CCharEntity* PChar, CSpell* PSpellToAdd, uint8 slotToPut) {

}

}

