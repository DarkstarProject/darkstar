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

namespace puppetutils
{

void LoadAutomaton(CCharEntity* PChar)
{
	const int8* Query =
        "SELECT name, unlocked_attachments FROM "
            "char_pet LEFT JOIN pet_name ON automatonid = id "
            "WHERE charid = %u;";

    int32 ret = Sql_Query(SqlHandle,Query,PChar->id);

    if (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        PChar->m_AutomatonName.insert(0,Sql_GetData(SqlHandle, 0));

		size_t length = 0;
		int8* attachments = NULL;
		Sql_GetData(SqlHandle,1,&attachments,&length);
		memcpy(&PChar->m_unlockedAttachments, attachments, (length > sizeof(PChar->m_unlockedAttachments) ? sizeof(PChar->m_unlockedAttachments) : length));
    }
	//TODO: PUP only: Create Automaton member, populate stats/head/frame/attachments
}

void SaveAutomaton(CCharEntity* PChar)
{
	const int8* Query =
        "UPDATE char_pet SET "
            "unlocked_attachments = '%s' "
        "WHERE charid = %u;";

	int8 attachmentsEscaped[sizeof(PChar->m_unlockedAttachments)*2+1];
	int8 attachments[sizeof(PChar->m_unlockedAttachments)];
	memcpy(attachments, &PChar->m_unlockedAttachments, sizeof(attachments));
	Sql_EscapeStringLen(SqlHandle,attachmentsEscaped,attachments,sizeof(attachments));

	Sql_Query(SqlHandle,Query,
        attachmentsEscaped,
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
			return true;
		}
		return false;
	}
	else if (slot == 2) //automaton frame
	{
		if (addBit(id & 0x0F, &PChar->m_unlockedAttachments.frames, sizeof(PChar->m_unlockedAttachments.frames)))
		{
			SaveAutomaton(PChar);
			return true;
		}
		return false;
	}
	else if (slot == 1) //automaton head
	{
		if (addBit(id & 0x0F, &PChar->m_unlockedAttachments.heads, sizeof(PChar->m_unlockedAttachments.heads)))
		{
			SaveAutomaton(PChar);
			return true;
		}
		return false;
	}
    return false;
}

}