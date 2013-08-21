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

#include "puppetutils.h"
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

        if (PChar->GetMJob() == JOB_PUP || PChar->GetSJob() == JOB_PUP)
        {
            //TODO: populate stats
            PChar->PAutomaton = new CAutomatonEntity();
            PChar->PAutomaton->name.insert(0,Sql_GetData(SqlHandle, 1));

		    attachments = NULL;
		    Sql_GetData(SqlHandle,2,&attachments,&length);
		    memcpy(&PChar->PAutomaton->m_Equip, attachments, (length > sizeof(PChar->PAutomaton->m_Equip) ? sizeof(PChar->PAutomaton->m_Equip) : length));
        }

    }
}

void SaveAutomaton(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE char_pet SET "
            "unlocked_attachments = '%s', "
            "equipped_attachments = '%s' "
        "WHERE charid = %u;";

	int8 unlockedAttachmentsEscaped[sizeof(PChar->m_unlockedAttachments)*2+1];
	int8 unlockedAttachments[sizeof(PChar->m_unlockedAttachments)];
	memcpy(unlockedAttachments, &PChar->m_unlockedAttachments, sizeof(unlockedAttachments));
	Sql_EscapeStringLen(SqlHandle,unlockedAttachmentsEscaped,unlockedAttachments,sizeof(unlockedAttachments));

	int8 equippedAttachmentsEscaped[sizeof(PChar->PAutomaton->m_Equip)*2+1];
	int8 equippedAttachments[sizeof(PChar->PAutomaton->m_Equip)];
	memcpy(equippedAttachments, &PChar->PAutomaton->m_Equip, sizeof(equippedAttachments));
	Sql_EscapeStringLen(SqlHandle,equippedAttachmentsEscaped,equippedAttachments,sizeof(equippedAttachments));

	Sql_Query(SqlHandle,Query,
        unlockedAttachmentsEscaped,
        equippedAttachmentsEscaped,
        PChar->id);

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

void setAttachment(CCharEntity* PChar, uint8 slotId, uint8 attachment)
{
    if (PChar->PAutomaton->getAttachment(slotId) != 0x00)
    {
        //unequip previous attachment
    }

    //TODO: validity checks
    PChar->PAutomaton->setAttachment(slotId, attachment);

}

void setFrame(CCharEntity* PChar, uint8 frame)
{
    //TODO: validate attachments with new elemental capacities
    PChar->PAutomaton->setFrame((AUTOFRAMETYPE)frame);
}

void setHead(CCharEntity* PChar, uint8 head)
{
    //TODO: validate attachments with new elemental capacities
    PChar->PAutomaton->setHead((AUTOHEADTYPE)head);
}

}