/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "../../common/showmsg.h"
#include "../../common/socket.h"

#include "../auction_house.h"

#include "auction_history.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CAHHistoryPacket::CAHHistoryPacket(uint16 ItemID)
{
    m_count  = 0;

    memset(m_PData, 0, AHHISTORYPACKET_SIZE);

    WBUFW(m_PData,(0x00)) = AHHISTORYPACKET_SIZE;       // packet size
    WBUFL(m_PData,(0x04)) = 0x46465849;                 // "XIFF"

    WBUFB(m_PData,(0x0B)) = 0x85;                       // packe type
    WBUFW(m_PData,(0x10)) = ItemID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAHHistoryPacket::AddItem(ahHistory* item) 
{
    if (m_count < 10)
    {
        WBUFL(m_PData,(0x1A + 40*m_count)+ 0x00) = item->Price;
        WBUFL(m_PData,(0x1A + 40*m_count)+ 0x04) = item->Data;

        memcpy(m_PData + 0x1A + 40*m_count + 0x08, item->Name1, 15);
        memcpy(m_PData + 0x1A + 40*m_count + 0x18, item->Name2, 15);

        m_count++;
    }
    delete item;
}

/************************************************************************
*                                                                       *
*  Устанавливаем общее количество отправляемых предметов и номер пакета *
*                                                                       *
************************************************************************/

void CAHHistoryPacket::SetItemCount()
{
    DSP_DEBUG_BREAK_IF(m_count > 10);

    WBUFB(m_PData,(0x0A)) = 0x80;
    WBUFW(m_PData,(0x0E)) = 1;

    WBUFW(m_PData,(0x08)) = 0x12 + 0x28*m_count + 0x08;
}

/************************************************************************
*																		*
*  Возвращаем собранный пакет                                           *
*																		*
************************************************************************/

uint8* CAHHistoryPacket::GetData()
{
    SetItemCount();
    return m_PData;
}

/************************************************************************
*																		*
*  Возвращаем размер отправляемого пакета                               *
*																		*
************************************************************************/

uint16 CAHHistoryPacket::GetSize()
{
    return AHHISTORYPACKET_SIZE;
}