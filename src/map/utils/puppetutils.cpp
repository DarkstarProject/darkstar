/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "puppetutils.h"
#include "petutils.h"
#include "battleutils.h"
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
		int8* attachments = NULL;
		Sql_GetData(SqlHandle,0,&attachments,&length);
		memcpy(&PChar->m_unlockedAttachments, attachments, (length > sizeof(PChar->m_unlockedAttachments) ? sizeof(PChar->m_unlockedAttachments) : length));

        if (PChar->PAutomaton != NULL)
        {
            delete PChar->PAutomaton;
            PChar->PAutomaton = NULL;
        }

        if (PChar->GetMJob() == JOB_PUP || PChar->GetSJob() == JOB_PUP)
        {
            PChar->PAutomaton = new CAutomatonEntity();
            PChar->PAutomaton->name.insert(0,Sql_GetData(SqlHandle, 1));
            automaton_equip_t tempEquip;
		    attachments = NULL;
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
        if (POldFrame == NULL || POldFrame->getEquipSlot() != ITEM_PUPPET_FRAME)
            return;
        for (int i = 0; i < 8; i ++)
        {
            tempElementMax[i] -= (POldFrame->getElementSlots() >> (i * 4)) & 0xF;
        }
    }
    CItemPuppet* PFrame = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + frame);
    if (PFrame == NULL || PFrame->getEquipSlot() != ITEM_PUPPET_FRAME)
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
        if (POldHead == NULL || POldHead->getEquipSlot() != ITEM_PUPPET_HEAD)
            return;
        for (int i = 0; i < 8; i ++)
        {
            tempElementMax[i] -= (POldHead->getElementSlots() >> (i * 4)) & 0xF;
        }
    }
    CItemPuppet* PHead = (CItemPuppet*)itemutils::GetItemPointer(0x2000 + head);
    if (PHead == NULL || PHead->getEquipSlot() != ITEM_PUPPET_HEAD)
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

uint16 getSkillCap(CCharEntity* PChar, SKILLTYPE skill)
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

    return battleutils::GetMaxSkill(rank, PChar->PAutomaton->GetMLevel());

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
    PChar->PPet = NULL; //already saved as PAutomaton, don't need it twice unless it's summoned
    PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
    PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
}

}