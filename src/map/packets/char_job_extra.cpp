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

#include "char_job_extra.h"
#include "../utils/puppetutils.h"

#include "../entities/charentity.h"

CCharJobExtraPacket::CCharJobExtraPacket(CCharEntity* PChar, bool mjob)
{
	this->type = 0x44;
	this->size = 0x4E;

    JOBTYPE job = JOB_NON;

    if (mjob)
        job = PChar->GetMJob();
    else
        job = PChar->GetSJob();
    
	WBUFB(data,(0x04)-4) = job;
    if (!mjob)
    {
        WBUFB(data,(0x05)-4) = 0x01;
    }

    if (job == JOB_BLU)
    {
	    memcpy(data+(0x08)-4, &PChar->m_SetBlueSpells, 20);
    }
    else if (job == JOB_PUP && PChar->PAutomaton != NULL)
    {
	    WBUFB(data,(0x08)-4) = PChar->PAutomaton->getHead();
	    WBUFB(data,(0x09)-4) = PChar->PAutomaton->getFrame();
	    WBUFB(data,(0x0A)-4) = PChar->PAutomaton->getAttachment(0);
	    WBUFB(data,(0x0B)-4) = PChar->PAutomaton->getAttachment(1);
	    WBUFB(data,(0x0C)-4) = PChar->PAutomaton->getAttachment(2);
	    WBUFB(data,(0x0D)-4) = PChar->PAutomaton->getAttachment(3);
	    WBUFB(data,(0x0E)-4) = PChar->PAutomaton->getAttachment(4);
	    WBUFB(data,(0x0F)-4) = PChar->PAutomaton->getAttachment(5);
	    WBUFB(data,(0x10)-4) = PChar->PAutomaton->getAttachment(6);
	    WBUFB(data,(0x11)-4) = PChar->PAutomaton->getAttachment(7);
	    WBUFB(data,(0x12)-4) = PChar->PAutomaton->getAttachment(8);
	    WBUFB(data,(0x13)-4) = PChar->PAutomaton->getAttachment(9);
	    WBUFB(data,(0x14)-4) = PChar->PAutomaton->getAttachment(10);
	    WBUFB(data,(0x15)-4) = PChar->PAutomaton->getAttachment(11);

	    WBUFL(data,(0x18)-4) = PChar->m_unlockedAttachments.heads;
	    WBUFL(data,(0x1C)-4) = PChar->m_unlockedAttachments.frames;

        //unlocked attachments: bit # = itemID (second itemID, 8000+ one) & 0x1F (0-31), or itemID & 0xFF - (32*element)
        WBUFL(data,(0x38)-4) = PChar->m_unlockedAttachments.attachments[0];
        WBUFL(data,(0x3C)-4) = PChar->m_unlockedAttachments.attachments[1];
        WBUFL(data,(0x40)-4) = PChar->m_unlockedAttachments.attachments[2];
        WBUFL(data,(0x44)-4) = PChar->m_unlockedAttachments.attachments[3];
        WBUFL(data,(0x48)-4) = PChar->m_unlockedAttachments.attachments[4];
        WBUFL(data,(0x4C)-4) = PChar->m_unlockedAttachments.attachments[5];
        WBUFL(data,(0x50)-4) = PChar->m_unlockedAttachments.attachments[6];
        WBUFL(data,(0x54)-4) = PChar->m_unlockedAttachments.attachments[7];
	
	    memcpy(data+(0x58)-4,PChar->PAutomaton->GetName(),PChar->PAutomaton->name.size());

	    WBUFW(data,(0x68)-4) = PChar->PAutomaton->health.hp;
	    WBUFW(data,(0x6A)-4) = PChar->PAutomaton->GetMaxHP();
	    WBUFW(data,(0x6C)-4) = PChar->PAutomaton->health.mp;
	    WBUFW(data,(0x6E)-4) = PChar->PAutomaton->GetMaxMP();

        //TODO: find a better way to store automaton skills? might not play well with built in rank for WorkingSkills
        WBUFW(data,(0x70)-4) = PChar->WorkingSkills.automaton_melee;
	    WBUFW(data,(0x72)-4) = puppetutils::getSkillCap(PChar, SKILL_AME);
	    WBUFW(data,(0x74)-4) = PChar->WorkingSkills.automaton_ranged;
	    WBUFW(data,(0x76)-4) = puppetutils::getSkillCap(PChar, SKILL_ARA);
	    WBUFW(data,(0x78)-4) = PChar->WorkingSkills.automaton_magic;
	    WBUFW(data,(0x7A)-4) = puppetutils::getSkillCap(PChar, SKILL_AMA);

	    WBUFW(data,(0x80)-4) = PChar->PAutomaton->stats.STR;
        WBUFW(data,(0x82)-4) = PChar->PAutomaton->getMod(MOD_STR);
        WBUFW(data,(0x84)-4) = PChar->PAutomaton->stats.DEX;
        WBUFW(data,(0x86)-4) = PChar->PAutomaton->getMod(MOD_DEX);
        WBUFW(data,(0x88)-4) = PChar->PAutomaton->stats.VIT;
        WBUFW(data,(0x8A)-4) = PChar->PAutomaton->getMod(MOD_VIT);
	    WBUFW(data,(0x8C)-4) = PChar->PAutomaton->stats.AGI;
        WBUFW(data,(0x8E)-4) = PChar->PAutomaton->getMod(MOD_AGI);
	    WBUFW(data,(0x90)-4) = PChar->PAutomaton->stats.INT;
        WBUFW(data,(0x92)-4) = PChar->PAutomaton->getMod(MOD_INT);
	    WBUFW(data,(0x94)-4) = PChar->PAutomaton->stats.MND;
        WBUFW(data,(0x96)-4) = PChar->PAutomaton->getMod(MOD_MND);
	    WBUFW(data,(0x98)-4) = PChar->PAutomaton->stats.CHR;
        WBUFW(data,(0x9A)-4) = PChar->PAutomaton->getMod(MOD_CHR);
    }

}
