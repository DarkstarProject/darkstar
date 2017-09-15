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

#include "../../common/socket.h"

#include <string.h>

#include "char_job_extra.h"
#include "../utils/puppetutils.h"

#include "../entities/charentity.h"
#include "../entities/automatonentity.h"
#include "../merit.h"

CCharJobExtraPacket::CCharJobExtraPacket(CCharEntity* PChar, bool mjob)
{
    this->type = 0x44;
    this->size = 0x50;

    JOBTYPE job = JOB_NON;

    if (mjob)
        job = PChar->GetMJob();
    else
        job = PChar->GetSJob();
    
    WBUFB(data,(0x04)) = job;
    if (!mjob)
    {
        WBUFB(data,(0x05)) = 0x01;
    }

    if (job == JOB_BLU)
    {
        memcpy(data+(0x08), &PChar->m_SetBlueSpells, 20);
    }
    else if (job == JOB_PUP && PChar->PAutomaton != nullptr)
    {
        WBUFB(data,(0x08)) = PChar->PAutomaton->getHead();
        WBUFB(data,(0x09)) = PChar->PAutomaton->getFrame();
        WBUFB(data,(0x0A)) = PChar->PAutomaton->getAttachment(0);
        WBUFB(data,(0x0B)) = PChar->PAutomaton->getAttachment(1);
        WBUFB(data,(0x0C)) = PChar->PAutomaton->getAttachment(2);
        WBUFB(data,(0x0D)) = PChar->PAutomaton->getAttachment(3);
        WBUFB(data,(0x0E)) = PChar->PAutomaton->getAttachment(4);
        WBUFB(data,(0x0F)) = PChar->PAutomaton->getAttachment(5);
        WBUFB(data,(0x10)) = PChar->PAutomaton->getAttachment(6);
        WBUFB(data,(0x11)) = PChar->PAutomaton->getAttachment(7);
        WBUFB(data,(0x12)) = PChar->PAutomaton->getAttachment(8);
        WBUFB(data,(0x13)) = PChar->PAutomaton->getAttachment(9);
        WBUFB(data,(0x14)) = PChar->PAutomaton->getAttachment(10);
        WBUFB(data,(0x15)) = PChar->PAutomaton->getAttachment(11);

        WBUFL(data,(0x18)) = PChar->m_unlockedAttachments.heads;
        WBUFL(data,(0x1C)) = PChar->m_unlockedAttachments.frames;

        //unlocked attachments: bit # = itemID (second itemID, 8000+ one) & 0x1F (0-31), or itemID & 0xFF - (32*element)
        WBUFL(data,(0x38)) = PChar->m_unlockedAttachments.attachments[0];
        WBUFL(data,(0x3C)) = PChar->m_unlockedAttachments.attachments[1];
        WBUFL(data,(0x40)) = PChar->m_unlockedAttachments.attachments[2];
        WBUFL(data,(0x44)) = PChar->m_unlockedAttachments.attachments[3];
        WBUFL(data,(0x48)) = PChar->m_unlockedAttachments.attachments[4];
        WBUFL(data,(0x4C)) = PChar->m_unlockedAttachments.attachments[5];
        WBUFL(data,(0x50)) = PChar->m_unlockedAttachments.attachments[6];
        WBUFL(data,(0x54)) = PChar->m_unlockedAttachments.attachments[7];

        memcpy(data+(0x58),PChar->PAutomaton->GetName(),PChar->PAutomaton->name.size());

        WBUFW(data,(0x68)) = PChar->PAutomaton->health.hp == 0 ? PChar->PAutomaton->GetMaxHP() : PChar->PAutomaton->health.hp;
        WBUFW(data,(0x6A)) = PChar->PAutomaton->GetMaxHP();
        WBUFW(data,(0x6C)) = PChar->PAutomaton->health.mp;
        WBUFW(data,(0x6E)) = PChar->PAutomaton->GetMaxMP();

        // TODO: this is a lot of calculations that could be avoided if these were properly initialized in the Automaton when first loading your character
        int32 meritbonus = PChar->PMeritPoints->GetMeritValue(MERIT_AUTOMATON_SKILLS, PChar);
        uint16 ameCap = puppetutils::getSkillCap(PChar, SKILL_AME);
        uint16 ameBonus = PChar->getMod(Mod::AUTO_MELEE_SKILL) + meritbonus;
        WBUFW(data,(0x70)) = dsp_min(ameCap, PChar->GetSkill(SKILL_AME)) + ameBonus;
        WBUFW(data,(0x72)) = ameCap + ameBonus;

        uint16 araCap = puppetutils::getSkillCap(PChar, SKILL_ARA);
        uint16 araBonus = PChar->getMod(Mod::AUTO_RANGED_SKILL) + meritbonus;
        WBUFW(data,(0x74)) = dsp_min(araCap, PChar->GetSkill(SKILL_ARA)) + araBonus;
        WBUFW(data,(0x76)) = araCap + araBonus;

        uint16 amaCap = puppetutils::getSkillCap(PChar, SKILL_AMA);
        uint16 amaBonus = PChar->getMod(Mod::AUTO_MAGIC_SKILL) + meritbonus;
        WBUFW(data,(0x78)) = dsp_min(amaCap, PChar->GetSkill(SKILL_AMA)) + amaBonus;
        WBUFW(data,(0x7A)) = amaCap + amaBonus;

        WBUFW(data,(0x80)) = PChar->PAutomaton->stats.STR;
        WBUFW(data,(0x82)) = PChar->PAutomaton->getMod(Mod::STR);
        WBUFW(data,(0x84)) = PChar->PAutomaton->stats.DEX;
        WBUFW(data,(0x86)) = PChar->PAutomaton->getMod(Mod::DEX);
        WBUFW(data,(0x88)) = PChar->PAutomaton->stats.VIT;
        WBUFW(data,(0x8A)) = PChar->PAutomaton->getMod(Mod::VIT);
        WBUFW(data,(0x8C)) = PChar->PAutomaton->stats.AGI;
        WBUFW(data,(0x8E)) = PChar->PAutomaton->getMod(Mod::AGI);
        WBUFW(data,(0x90)) = PChar->PAutomaton->stats.INT;
        WBUFW(data,(0x92)) = PChar->PAutomaton->getMod(Mod::INT);
        WBUFW(data,(0x94)) = PChar->PAutomaton->stats.MND;
        WBUFW(data,(0x96)) = PChar->PAutomaton->getMod(Mod::MND);
        WBUFW(data,(0x98)) = PChar->PAutomaton->stats.CHR;
        WBUFW(data,(0x9A)) = PChar->PAutomaton->getMod(Mod::CHR);

        WBUFB(data, 0x9C) = 0; //extra elemental capacity from gifts
    }

}
