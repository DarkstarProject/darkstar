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

#include "../lua/luautils.h"
#include "puppetutils.h"
#include "petutils.h"
#include "battleutils.h"
#include "charutils.h"
#include "../packets/char_job_extra.h"

namespace puppetutils
{

void LoadAutomaton(CCharEntity* PChar)
{
	const int8* Query =
        "SELECT unlocked_attachments, name, equipped_attachments FROM "
            "char_pet LEFT JOIN pet_name ON automatonid = id "
            "WHERE charid = %u;";

    int32 ret = Sql_Query(SqlHandle,Query,PChar->id);

    if (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
		size_t length = 0;
		int8* attachments = nullptr;
		Sql_GetData(SqlHandle,0,&attachments,&length);
		memcpy(&PChar->m_unlockedAttachments, attachments, (length > sizeof(PChar->m_unlockedAttachments) ? sizeof(PChar->m_unlockedAttachments) : length));

        if (PChar->PAutomaton != nullptr)
        {
            delete PChar->PAutomaton;
            PChar->PAutomaton = nullptr;
        }

        if (PChar->GetMJob() == JOB_PUP || PChar->GetSJob() == JOB_PUP)
        {
            PChar->PAutomaton = new CAutomatonEntity();
            PChar->PAutomaton->name.insert(0,Sql_GetData(SqlHandle, 1));
            automaton_equip_t tempEquip;
		    attachments = nullptr;
		    Sql_GetData(SqlHandle,2,&attachments,&length);
		    memcpy(&tempEquip, attachments, (length > sizeof(tempEquip) ? sizeof(tempEquip) : length));
			setHead(PChar, tempEquip.Head < HEAD_HARLEQUIN || tempEquip.Head > HEAD_SPIRITREAVER ? HEAD_HARLEQUIN : tempEquip.Head);
			setFrame(PChar, tempEquip.Frame <= FRAME_HARLEQUIN || tempEquip.Frame > FRAME_STORMWAKER ? FRAME_HARLEQUIN : tempEquip.Frame);
            for (int i = 0; i < 8; i++)
                setAttachment(PChar, i, tempEquip.Attachments[i]);
            LoadAutomatonStats(PChar);
        }
    }
}

void SaveAutomaton(CCharEntity* PChar)
{
    if (PChar->PAutomaton)
    {
        const int8* Query =
            "UPDATE char_pet SET "
            "unlocked_attachments = '%s', "
            "equipped_attachments = '%s' "
            "WHERE charid = %u;";

        int8 unlockedAttachmentsEscaped[sizeof(PChar->m_unlockedAttachments) * 2 + 1];
        int8 unlockedAttachments[sizeof(PChar->m_unlockedAttachments)];
        memcpy(unlockedAttachments, &PChar->m_unlockedAttachments, sizeof(unlockedAttachments));
        Sql_EscapeStringLen(SqlHandle, unlockedAttachmentsEscaped, unlockedAttachments, sizeof(unlockedAttachments));

        int8 equippedAttachmentsEscaped[sizeof(PChar->PAutomaton->m_Equip) * 2 + 1];
        int8 equippedAttachments[sizeof(PChar->PAutomaton->m_Equip)];
        memcpy(equippedAttachments, &PChar->PAutomaton->m_Equip, sizeof(equippedAttachments));
        Sql_EscapeStringLen(SqlHandle, equippedAttachmentsEscaped, equippedAttachments, sizeof(equippedAttachments));

        Sql_Query(SqlHandle, Query,
            unlockedAttachmentsEscaped,
            equippedAttachmentsEscaped,
            PChar->id);
    }
    else
    {
        const int8* Query =
            "UPDATE char_pet SET "
            "unlocked_attachments = '%s' "
            "WHERE charid = %u;";

        int8 unlockedAttachmentsEscaped[sizeof(PChar->m_unlockedAttachments) * 2 + 1];
        int8 unlockedAttachments[sizeof(PChar->m_unlockedAttachments)];
        memcpy(unlockedAttachments, &PChar->m_unlockedAttachments, sizeof(unlockedAttachments));
        Sql_EscapeStringLen(SqlHandle, unlockedAttachmentsEscaped, unlockedAttachments, sizeof(unlockedAttachments));

        Sql_Query(SqlHandle, Query,
            unlockedAttachmentsEscaped,
            PChar->id);
    }
	//TODO: PUP only: save equipped automaton items
}

bool UnlockAttachment(CCharEntity* PChar, CItem* PItem)
{
	uint16 id = PItem->getID();

	if (!PItem->isType(ITEM_PUPPET))
		return false;

    uint8 slot = ((CItemPuppet*)PItem)->getEquipSlot();
	
	if (slot == 3) //automaton attachment
	{
		if (addBit(id & 0xFF, (uint8*)PChar->m_unlockedAttachments.attachments, sizeof(PChar->m_unlockedAttachments.attachments)))
		{
			SaveAutomaton(PChar);
            PChar->pushPacket(new CCharJobExtraPacket(PChar, PChar->GetMJob() == JOB_PUP));
			return true;
		}
		return false;
	}
	else if (slot == 2) //automaton frame
	{
		if (addBit(id & 0x0F, &PChar->m_unlockedAttachments.frames, sizeof(PChar->m_unlockedAttachments.frames)))
		{
			SaveAutomaton(PChar);
            PChar->pushPacket(new CCharJobExtraPacket(PChar, PChar->GetMJob() == JOB_PUP));
			return true;
		}
		return false;
	}
	else if (slot == 1) //automaton head
	{
		if (addBit(id & 0x0F, &PChar->m_unlockedAttachments.heads, sizeof(PChar->m_unlockedAttachments.heads)))
		{
			SaveAutomaton(PChar);
            PChar->pushPacket(new CCharJobExtraPacket(PChar, PChar->GetMJob() == JOB_PUP));
			return true;
		}
		return false;
	}
    return false;
}

bool HasAttachment(CCharEntity* PChar, CItem* PItem)
{
	uint16 id = PItem->getID();

	if (!PItem->isType(ITEM_PUPPET))
		return false;

    uint8 slot = ((CItemPuppet*)PItem)->getEquipSlot();
	
	if (slot == 3) //automaton attachment
	{
		return hasBit(id & 0xFF, (uint8*)PChar->m_unlockedAttachments.attachments, sizeof(PChar->m_unlockedAttachments.attachments));
	}
	else if (slot == 2) //automaton frame
	{
		return hasBit(id & 0x0F, &PChar->m_unlockedAttachments.frames, sizeof(PChar->m_unlockedAttachments.frames));

	}
	else if (slot == 1) //automaton head
	{
		return hasBit(id & 0x0F, &PChar->m_unlockedAttachments.heads, sizeof(PChar->m_unlockedAttachments.heads));
	}
    return false;
}

void setAttachment(CCharEntity* PChar, uint8 slotId, uint8 attachment)
{
    if (attachment != 0)
    {
        for (int i = 0; i < 12; i++)
        {
            if (attachment == PChar->PAutomaton->getAttachment(i))
                return;
        }
    }

    uint8 oldAttachment = PChar->PAutomaton->getAttachment(slotId);
    if (attachment != 0 && oldAttachment != 0)
    {
        setAttachment(PChar, slotId, 0);
    }

    if (attachment != 0)
    {
        CItemPuppet* PAttachment = (CItemPuppet*)itemutils::GetItemPointer(0x2100 + attachment);

        bool valid = false;

        if (PAttachment && PAttachment->getEquipSlot() == ITEM_PUPPET_ATTACHMENT)
        {
            valid = true;
            for (int i = 0; i < 8; i++)
            {
                if (PChar->PAutomaton->getElementCapacity(i) + ((PAttachment->getElementSlots() >> (i * 4)) & 0xF) > PChar->PAutomaton->getElementMax(i))
                {
                    valid = false;
                    break;
                }
            }
        }

        if (valid)
        {
            for (int i = 0; i < 8; i++)
            {
                PChar->PAutomaton->addElementCapacity(i, (PAttachment->getElementSlots() >> (i * 4)) & 0xF);
            }
            PChar->PAutomaton->setAttachment(slotId, attachment);
        }
        else
        {
            setAttachment(PChar, slotId, oldAttachment);
        }
    }
    else
    {
        attachment = PChar->PAutomaton->getAttachment(slotId);

        if (attachment != 0)
        {
            CItemPuppet* PAttachment = (CItemPuppet*)itemutils::GetItemPointer(0x2100 + attachment);

            if (PAttachment && PAttachment->getEquipSlot() == ITEM_PUPPET_ATTACHMENT)
            {
                for (int i = 0; i < 8; i++)
                {
                    PChar->PAutomaton->addElementCapacity(i, -((PAttachment->getElementSlots() >> (i * 4)) & 0xF));
                    PChar->PAutomaton->setAttachment(slotId, 0);
                }
            }
        }
    }
}

void setFrame(CCharEntity* PChar, uint8 frame)
{
    uint8 tempElementMax[8];

    for (int i = 0; i < 8; i++)
        tempElementMax[i] = PChar->PAutomaton->getElementMax(i);

    if (PChar->PAutomaton->getFrame() != 0)
    {
        CItemPuppet* POldFrame = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + PChar->PAutomaton->getFrame());
        if (POldFrame == nullptr || POldFrame->getEquipSlot() != ITEM_PUPPET_FRAME)
            return;
        for (int i = 0; i < 8; i ++)
        {
            tempElementMax[i] -= (POldFrame->getElementSlots() >> (i * 4)) & 0xF;
        }
    }
    CItemPuppet* PFrame = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + frame);
    if (PFrame == nullptr || PFrame->getEquipSlot() != ITEM_PUPPET_FRAME)
        return;
    for (int i = 0; i < 8; i ++)
    {
        tempElementMax[i] += (PFrame->getElementSlots() >> (i * 4)) & 0xF;
    }

    bool valid = true;

    for (int i = 0; i < 8; i++)
    {
        if (tempElementMax[i] < PChar->PAutomaton->getElementCapacity(i))
        {
            valid = false;
            break;
        }
    }

    if (valid)
    {
        PChar->PAutomaton->setFrame((AUTOFRAMETYPE)frame);
        uint8 head = PChar->PAutomaton->getHead();
        PChar->PAutomaton->look.race = 0x07;
        if (head == 3)
            PChar->PAutomaton->look.face = 0xBC + ((frame - 32) * 5);
        else if (head == 4)
            PChar->PAutomaton->look.face = 0xBB + ((frame - 32) * 5);
        else if (head == 5)
            PChar->PAutomaton->look.face = 0xD3 + ((frame - 32));
        else if (head == 6)
            PChar->PAutomaton->look.face = 0xD7 + ((frame - 32));
        else
            PChar->PAutomaton->look.face = 0xB9 + ((frame - 32) * 5) + (head-1);
        for (int i = 0; i < 8; i++)
            PChar->PAutomaton->setElementMax(i, tempElementMax[i]);
        LoadAutomatonStats(PChar);
    }

    
}

void setHead(CCharEntity* PChar, uint8 head)
{
    uint8 tempElementMax[8];

    for (int i = 0; i < 8; i++)
        tempElementMax[i] = PChar->PAutomaton->getElementMax(i);

    if (PChar->PAutomaton->getHead() != 0)
    {
        CItemPuppet* POldHead = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + PChar->PAutomaton->getHead());
        if (POldHead == nullptr || POldHead->getEquipSlot() != ITEM_PUPPET_HEAD)
            return;
        for (int i = 0; i < 8; i ++)
        {
            tempElementMax[i] -= (POldHead->getElementSlots() >> (i * 4)) & 0xF;
        }
    }
    CItemPuppet* PHead = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + head);
    if (PHead == nullptr || PHead->getEquipSlot() != ITEM_PUPPET_HEAD)
        return;
    for (int i = 0; i < 8; i ++)
    {
        tempElementMax[i] += (PHead->getElementSlots() >> (i * 4)) & 0xF;
    }

    bool valid = true;

    for (int i = 0; i < 8; i++)
    {
        if (tempElementMax[i] < PChar->PAutomaton->getElementCapacity(i))
        {
            valid = false;
            break;
        }
    }

    if (valid)
    {
        PChar->PAutomaton->setHead((AUTOHEADTYPE)head);
        uint8 frame = PChar->PAutomaton->getFrame();
        PChar->PAutomaton->look.race = 0x07;
        if (head == 3)
            PChar->PAutomaton->look.face = 0xBC + ((frame - 32) * 5);
        else if (head == 4)
            PChar->PAutomaton->look.face = 0xBB + ((frame - 32) * 5);
        else if (head == 5)
            PChar->PAutomaton->look.face = 0xD3 + ((frame - 32));
        else if (head == 6)
            PChar->PAutomaton->look.face = 0xD7 + ((frame - 32));
        else
            PChar->PAutomaton->look.face = 0xB9 + ((frame - 32) * 5) + (head-1);
        for (int i = 0; i < 8; i++)
            PChar->PAutomaton->setElementMax(i, tempElementMax[i]);
    }

}

uint16 getSkillCap(CCharEntity* PChar, SKILLTYPE skill, uint8 level)
{
    int8 rank = 0;
    if (skill < SKILL_AME || skill > SKILL_AMA)
        return 0;
    switch (PChar->PAutomaton->getFrame())
    {
        case FRAME_HARLEQUIN:
            rank = 5;
            break;
        case FRAME_VALOREDGE:
            if (skill == SKILL_AME)
                rank = 2;
            break;
        case FRAME_SHARPSHOT:
            if (skill == SKILL_AME)
                rank = 6;
            else if (skill == SKILL_ARA)
                rank = 3;
            break;
        case FRAME_STORMWAKER:
            if (skill == SKILL_AME)
                rank = 7;
            else if (skill == SKILL_AMA)
                rank = 3;
            break;
    }

    switch (PChar->PAutomaton->getHead())
    {
        case HEAD_VALOREDGE:
            if (skill == SKILL_AME)
                rank -= 1;
            break;
        case HEAD_SHARPSHOT:
            if (skill == SKILL_ARA)
                rank -= 1;
            break;
        case HEAD_STORMWAKER:
            if (skill == SKILL_AME || skill == SKILL_AMA)
                rank -= 1;
            break;
        case HEAD_SOULSOOTHER:
        case HEAD_SPIRITREAVER:
            if (skill == SKILL_AMA)
                rank -= 2;
            break;
    }

    //only happens if a head gives bonus to a rank of 0 - making it G or F rank
    if (rank < 0)
        rank = 13 + rank;

    return battleutils::GetMaxSkill(rank, level);
}

uint16 getSkillCap(CCharEntity* PChar, SKILLTYPE skill)
{
    return getSkillCap(PChar, skill, PChar->PAutomaton->GetMLevel());
}

void LoadAutomatonStats(CCharEntity* PChar)
{
    switch (PChar->PAutomaton->getFrame())
    {
        case FRAME_HARLEQUIN:
            petutils::LoadPet(PChar, PETID_HARLEQUINFRAME, false);
            break;
        case FRAME_VALOREDGE:
            petutils::LoadPet(PChar, PETID_VALOREDGEFRAME, false);
            break;
        case FRAME_SHARPSHOT:
            petutils::LoadPet(PChar, PETID_SHARPSHOTFRAME, false);
            break;
        case FRAME_STORMWAKER:
            petutils::LoadPet(PChar, PETID_STORMWAKERFRAME, false);
            break;
    }
    PChar->PPet = nullptr; //already saved as PAutomaton, don't need it twice unless it's summoned
}

void TrySkillUP(CAutomatonEntity* PAutomaton, SKILLTYPE SkillID, uint8 lvl)
{
    DSP_DEBUG_BREAK_IF(!PAutomaton->PMaster || PAutomaton->PMaster->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)PAutomaton->PMaster;
    if (getSkillCap(PChar, SkillID) != 0 && !(PChar->WorkingSkills.skill[SkillID] & 0x8000))
    {
        uint16 CurSkill = PChar->RealSkills.skill[SkillID];
        uint16 MaxSkill = getSkillCap(PChar, SkillID);

        int16  Diff = MaxSkill - CurSkill / 10;
        double SkillUpChance = Diff / 5.0 + map_config.skillup_chance_multiplier * (2.0 - log10(1.0 + CurSkill / 100));

        double random = dsprand::GetRandomNumber(1.);

        if (SkillUpChance > 0.5)
        {
            SkillUpChance = 0.5;
        }

        if (Diff > 0 && random < SkillUpChance)
        {
            double chance = 0;
            uint8  SkillAmount = 1;
            uint8  tier = dsp_min(1 + (Diff / 5), 5);

            for (uint8 i = 0; i < 4; ++i) // 1 + 4 возможных дополнительных (максимум 5)
            {
                random = dsprand::GetRandomNumber(1.);

                switch (tier)
                {
                case 5:  chance = 0.900; break;
                case 4:  chance = 0.700; break;
                case 3:  chance = 0.500; break;
                case 2:  chance = 0.300; break;
                case 1:  chance = 0.200; break;
                default: chance = 0.000; break;
                }

                if (chance < random || SkillAmount == 5) break;

                tier -= 1;
                SkillAmount += 1;
            }
            MaxSkill = MaxSkill * 10;

            // Do skill amount multiplier (Will only be applied if default setting is changed)
            if (map_config.skillup_amount_multiplier > 1)
            {
                SkillAmount += SkillAmount * map_config.skillup_amount_multiplier;
                if (SkillAmount > 9)
                {
                    SkillAmount = 9;
                }
            }

            if (SkillAmount + CurSkill >= MaxSkill)
            {
                SkillAmount = MaxSkill - CurSkill;
                PChar->WorkingSkills.skill[SkillID] |= 0x8000;
            }

            PChar->RealSkills.skill[SkillID] += SkillAmount;
            PChar->pushPacket(new CMessageBasicPacket(PAutomaton, PAutomaton, SkillID, SkillAmount, 38));

            if ((CurSkill / 10) < (CurSkill + SkillAmount) / 10) //if gone up a level
            {
                //TODO: regenerate automatons weaponskills
                PChar->WorkingSkills.skill[SkillID] += 1;
                PChar->pushPacket(new CCharJobExtraPacket(PChar, PChar->GetMJob() == JOB_PUP));
                PChar->pushPacket(new CMessageBasicPacket(PAutomaton, PAutomaton, SkillID, (CurSkill + SkillAmount) / 10, 53));
            }
            charutils::SaveCharSkills(PChar, SkillID);
        }
    }
}

void CheckAttachmentsForManeuver(CCharEntity* PChar, EFFECT maneuver, bool gain)
{
    CAutomatonEntity* PAutomaton = PChar->PAutomaton;

    if (PAutomaton)
    {
        uint8 element = maneuver - EFFECT_FIRE_MANEUVER;
        for (uint8 i = 0; i < 12; i++)
        {
            if (PAutomaton->getAttachment(i) != 0)
            {
                CItemPuppet* PAttachment = (CItemPuppet*)itemutils::GetItemPointer(0x2100 + PAutomaton->getAttachment(i));

                if (PAttachment && PAttachment->getElementSlots() >> (element * 4))
                {
                    if (gain)
                        luautils::OnManeuverGain(PChar, PAttachment, PChar->StatusEffectContainer->GetEffectsCount(maneuver));
                    else
                        luautils::OnManeuverLose(PChar, PAttachment, PChar->StatusEffectContainer->GetEffectsCount(maneuver));
                }
            }
        }
    }
}

}