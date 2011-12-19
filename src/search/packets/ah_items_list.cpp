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

#include "../../common/blowfish.h"
#include "../../common/md52.h"
#include "../../common/showmsg.h"
#include "../../common/socket.h"

#include "../auction_house.h"

#include "ah_items_list.h"


/************************************************************************
*                                                                       *
*  Если количество отправляемых предметов превышает 20, то отправляем   *
*  их несколькими пакетами, в кажный их коротых записываем смещение     *
*                                                                       *
************************************************************************/

CAHItemsListPacket::CAHItemsListPacket(uint8 offset)
{
    m_count  = 0;
    m_offset = offset;

    memset(m_PData, 0, PACKET_DATA_SIZE);

    WBUFW(m_PData,(0x00)) = PACKET_DATA_SIZE;
    WBUFL(m_PData,(0x04)) = 0x46465849; // "XIFF"

	WBUFB(m_PData,(0x0B)) = 0x95;
}

CAHItemsListPacket::~CAHItemsListPacket()
{
    
}

/************************************************************************
*                                                                       *
*  Добавляем предмет в пакет (по 10 байт на предмер)                    *
*                                                                       *
************************************************************************/

void CAHItemsListPacket::AddItem(ahItem* item) 
{
    WBUFL(m_PData,(0x18 + 0x0A*m_count) + 0) = item->ItemID;
    WBUFL(m_PData,(0x18 + 0x0A*m_count) + 2) = item->SinglAmount;
    WBUFL(m_PData,(0x18 + 0x0A*m_count) + 6) = item->StackAmount;

    m_count++;
    delete item;
}

/************************************************************************
*                                                                       *
*  Устанавливаем общее количество отправляемых предметов                *
*                                                                       *
************************************************************************/

void CAHItemsListPacket::SetItemCount(uint8 count)
{
	WBUFB(m_PData,(0x0E)) = count;

    if ((count - m_offset) < 20)
    {
        WBUFB(m_PData,(0x0A)) = 0x80;
        WBUFW(m_PData,(0x08)) = 0x10 + (count - m_offset)*0x0A + 0x08;
    } 
    else 
    {
        WBUFW(m_PData,(0x08)) = 0x10 + 20*0x0A + 0x08;
    }
}

/************************************************************************
*																		*
*                                                                       *
*																		*
************************************************************************/

void CAHItemsListPacket::SetKey(int8* key) 
{
	memcpy(m_key, key, 24);
}

/************************************************************************
*																		*
*  Возвращаем собранный пакет                                           *
*																		*
************************************************************************/

uint8* CAHItemsListPacket::GetData()
{
    // нужно условие на проверку сборки
    // если пакет не собран, то сначала собираем его

    uint8  hash[16];
	uint8  tmp;
	uint32 P[18];
	uint32 S[4][256];

	md5((uint8*)(m_key), hash, 24);

	blowfish_init((char *)hash,16, P, S[0]);

	md5((uint8*)(m_PData+8), (uint8*)m_PData+PACKET_DATA_SIZE-0x18+4, PACKET_DATA_SIZE-0x18-0x04);

	tmp = (PACKET_DATA_SIZE-12)/4;
	tmp -= tmp%2;

	for(unsigned char i = 0; i < tmp; i += 2) 
    {
		blowfish_encipher((uint32*)m_PData+i+2, (uint32*)m_PData+i+3,P,S[0]);
	}

	memcpy(&m_PData[PACKET_DATA_SIZE]-0x04,m_key+16,4);

    return m_PData;
}

/************************************************************************
*																		*
*  Возвращаем размер отправляемого пакета                               *
*																		*
************************************************************************/

uint16 CAHItemsListPacket::GetSize()
{
    return PACKET_DATA_SIZE;
}