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

#include "../../common/utils.h"

#include "../packets/blue_set_spells.h"
#include "../packets/char_spells.h"

#include <math.h>

#include "../packets/message_basic.h"
#include "../packets/char_stats.h"
#include "../packets/char_health.h"

#include "battleutils.h"
#include "charutils.h"
#include "../grades.h"
#include "blueutils.h"
#include "../merit.h"
#include "../modifier.h"
#include "../spell.h"
#include "../blue_spell.h"

namespace blueutils
{

void SetBlueSpell(CCharEntity* PChar, CBlueSpell* PSpell, uint8 slotIndex, bool addingSpell) {

	//sanity check
	if (slotIndex < 20) {
		if (PSpell != NULL && PSpell->getID() > 0x200)
        {
			if (addingSpell) 
            {
                if (!IsSpellSet(PChar, PSpell) && HasEnoughSetPoints(PChar, PSpell, slotIndex))
                {
				    // Blue spells in SetBlueSpells must be 0x200 ofsetted so it's 1 byte per spell.
                    if (PChar->m_SetBlueSpells[slotIndex] != 0)
                    {
                        CBlueSpell* POldSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slotIndex] + 0x200);
                        PChar->delModifiers(&POldSpell->modList);
                    }
				    PChar->m_SetBlueSpells[slotIndex] = PSpell->getID() - 0x200;
				    PChar->addModifiers(&PSpell->modList);
                }
			}
			else
            {
				PChar->m_SetBlueSpells[slotIndex] = 0x00;
				PChar->delModifiers(&PSpell->modList);
			}
            SaveSetSpells(PChar);
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
				if (rand()%100 < 33) {
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

bool HasEnoughSetPoints(CCharEntity* PChar, CBlueSpell* PSpellToAdd, uint8 slotToPut)
{
    uint8 setpoints = 0;
    for (int slot = 0; slot < 20; slot++)
    {
        if (slot != slotToPut && PChar->m_SetBlueSpells[slot] != 0)
        {
            CBlueSpell* setSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200);
            if (setSpell)
            {
                setpoints += setSpell->getSetPoints();
            }
        }
    }

    if (setpoints + PSpellToAdd->getSetPoints() <= GetTotalBlueMagicPoints(PChar))
    {
        return true;
    }
    else
    {
        return false;
    }
}

void UnequipAllBlueSpells(CCharEntity* PChar)
{
    for (int slot = 0; slot < 20; slot++)
    {
        if (PChar->m_SetBlueSpells[slot] != 0)
        {
            CBlueSpell* PSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200);
            PChar->m_SetBlueSpells[slot] = 0;
            PChar->delModifiers(&PSpell->modList);
        }
    }
    PChar->status = STATUS_UPDATE;
	PChar->pushPacket(new CBlueSetSpellsPacket(PChar));
	PChar->pushPacket(new CCharStatsPacket(PChar));
	charutils::CalculateStats(PChar);
	PChar->UpdateHealth();
	PChar->pushPacket(new CCharHealthPacket(PChar));
    SaveSetSpells(PChar);
}

bool IsSpellSet(CCharEntity* PChar, CBlueSpell* PSpell)
{
    for (int slot = 0; slot < 20; slot++)
    {
        if (PChar->m_SetBlueSpells[slot] != 0)
        {
            if (PChar->m_SetBlueSpells[slot] == PSpell->getID() - 0x200)
            {
                return true;
            }
        }
    }
    return false;
}

void CompactSpells(CCharEntity* PChar)
{
    for (int i = 0; i < 20; i++)
    {
        if (PChar->m_SetBlueSpells[i] == 0)
        {
            for (int j = i; j < 20; j++)
            {
                if (PChar->m_SetBlueSpells[j] != 0)
                {
                    PChar->m_SetBlueSpells[i] = PChar->m_SetBlueSpells[j];
                    PChar->m_SetBlueSpells[j] = 0;
                    break;
                }
            }
        }
    }
}

void CheckSpellLevels(CCharEntity* PChar)
{
    uint8 level = 0;
    if (PChar->GetMJob() == JOB_BLU)
    {
        level = PChar->GetMLevel();
    }
    else if (PChar->GetSJob() == JOB_BLU)
    {
        level = PChar->GetSLevel();
    }

    if (level != 0)
    {
        for (int slot = 0; slot < 20; slot++)
        {
            if (PChar->m_SetBlueSpells[slot] != 0)
            {
                CBlueSpell* PSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200);
                if (PSpell && level < PSpell->getJob(JOB_BLU))
                {
                    SetBlueSpell(PChar, PSpell, slot, false);
                }
            }
        }
    }
}

uint8 GetTotalSlots(CCharEntity* PChar)
{
    uint8 level = 0;
    if (PChar->GetMJob() == JOB_BLU)
    {
        level = PChar->GetMLevel();
    }
    else if (PChar->GetSJob() == JOB_BLU)
    {
        level = PChar->GetSLevel();
    }

    if (level == 0)
        return 0;
    else
        return dsp_cap(((level - 1)/10)*2 + 6, 6, 20);
}

uint8 GetTotalBlueMagicPoints(CCharEntity* PChar)
{
    uint8 level = 0;
    if (PChar->GetMJob() == JOB_BLU)
    {
        level = PChar->GetMLevel();
    }
    else if (PChar->GetSJob() == JOB_BLU)
    {
        level = PChar->GetSLevel();
    }

    if (level == 0)
        return 0;
    else
    {
        uint8 points = ((level - 1)/10)*5 + 10;
        if (level > 75)
        {
            points = points + PChar->PMeritPoints->GetMeritValue(MERIT_ASSIMILATION, PChar);
        }
        return points;
    }
}

void SaveSetSpells(CCharEntity* PChar)
{
    if (PChar->GetMJob() == JOB_BLU || PChar->GetSJob() == JOB_BLU)
    {
	    const int8* Query =
            "UPDATE chars SET "
              "set_blue_spells = '%s' "
            "WHERE charid = %u;";

	    int8 spells[sizeof(PChar->m_SetBlueSpells)*2+1];
	    Sql_EscapeStringLen(SqlHandle,spells,(const int8*)PChar->m_SetBlueSpells,sizeof(PChar->m_SetBlueSpells));

	    Sql_Query(SqlHandle,Query,
            spells,
            PChar->id);
    }
}

void LoadSetSpells(CCharEntity* PChar)
{
    if (PChar->GetMJob() == JOB_BLU || PChar->GetSJob() == JOB_BLU)
    {
	    const int8* Query =
            "SELECT set_blue_spells FROM "
              "chars WHERE charid = %u;";

        int32 ret = Sql_Query(SqlHandle,Query,PChar->id);

        if (ret != SQL_ERROR &&
            Sql_NumRows(SqlHandle) != 0 &&
            Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
		    size_t length = 0;
		    int8* blue_spells = NULL;
		    Sql_GetData(SqlHandle,0,&blue_spells,&length);
		    memcpy(PChar->m_SetBlueSpells, blue_spells, (length > sizeof(PChar->m_SetBlueSpells) ? sizeof(PChar->m_SetBlueSpells) : length));
        }
        for (int slot = 0; slot < 20; slot++)
        {
            if (PChar->m_SetBlueSpells[slot] != 0)
            {
                CBlueSpell* PSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200);
                PChar->addModifiers(&PSpell->modList);
            }
        }
        ValidateBlueSpells(PChar);
    }
}

void ValidateBlueSpells(CCharEntity* PChar)
{
    CheckSpellLevels(PChar);

    uint8 maxSetPoints = GetTotalBlueMagicPoints(PChar);
    uint8 currentPoints = 0;

    for (int slot = 0; slot < 20; slot++)
    {
        if (PChar->m_SetBlueSpells[slot] != 0)
        {
            CBlueSpell* PSpell = (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200);
            if (currentPoints + PSpell->getSetPoints() > maxSetPoints)
            {
                SetBlueSpell(PChar, PSpell, slot, false);
            }
            else
            {
                currentPoints += PSpell->getSetPoints();
            }
        }
    }

    CompactSpells(PChar);

    uint8 maxSlots = GetTotalSlots(PChar);

    for (int slot = maxSlots; slot < 20; slot++)
    {
        if (PChar->m_SetBlueSpells[slot] != 0)
        {
            SetBlueSpell(PChar, (CBlueSpell*)spell::GetSpell(PChar->m_SetBlueSpells[slot] + 0x200), slot, false);
        }
    }

    SaveSetSpells(PChar);
    PChar->status = STATUS_UPDATE;
	PChar->pushPacket(new CBlueSetSpellsPacket(PChar));
	PChar->pushPacket(new CCharStatsPacket(PChar));
	charutils::CalculateStats(PChar);
	PChar->UpdateHealth();
	PChar->pushPacket(new CCharHealthPacket(PChar));
}

}