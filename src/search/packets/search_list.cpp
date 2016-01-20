﻿/*
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

#include "../../common/showmsg.h"
#include "../../common/socket.h"
#include "../../common/utils.h"

#include "../data_loader.h"

#include <string.h>

#include "search_list.h"


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CSearchListPacket::CSearchListPacket(uint32 Total)
{
    m_count = 0;
    m_offset = 192;

    memset(m_data, 0, sizeof(m_data));

    WBUFB(m_data, (0x0A)) = 0x80;
    WBUFB(m_data, (0x0B)) = 0x80;

    WBUFB(m_data, (0x0E)) = Total; // общее количество найденных персонажей (может отличаться от отправляемого)
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

// в один пакет мождет быть добавлено не более 20-ти персонажей

void CSearchListPacket::AddPlayer(SearchEntity* PPlayer)
{
    uint32 size_offset = m_offset / 8;
    m_offset += 8;

    m_offset = packBitsLE(m_data, SEARCH_NAME, m_offset, 5);
    m_offset = packBitsLE(m_data, strlen((const int8*)PPlayer->name), m_offset, 4);

    for (uint8 c = 0; c < strlen((const int8*)PPlayer->name); ++c)
    {
        m_offset = packBitsLE(m_data, PPlayer->name[c], m_offset, 7);
    }

    m_offset = packBitsLE(m_data, SEARCH_AREA, m_offset, 5);
    m_offset = packBitsLE(m_data, PPlayer->zone, m_offset, 10);

    if (!(PPlayer->flags1 & 0x4000))
    {
        m_offset = packBitsLE(m_data, SEARCH_NATION, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->nation, m_offset, 2);

        m_offset = packBitsLE(m_data, SEARCH_JOB, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->mjob, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->sjob, m_offset, 5);

        m_offset = packBitsLE(m_data, SEARCH_LEVEL, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->mlvl, m_offset, 8);
        m_offset = packBitsLE(m_data, PPlayer->slvl, m_offset, 8);

        m_offset = packBitsLE(m_data, SEARCH_RACE, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->race, m_offset, 4);

        m_offset = packBitsLE(m_data, SEARCH_RANK, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->rank, m_offset, 8);
    }

    m_offset = packBitsLE(m_data, SEARCH_FLAGS1, m_offset, 5);
    m_offset = packBitsLE(m_data, PPlayer->flags1, m_offset, 16);

    m_offset = packBitsLE(m_data, SEARCH_ID, m_offset, 5);
    m_offset = packBitsLE(m_data, PPlayer->id, m_offset, 20);

    //m_offset = packBitsLE(m_data, SEARCH_LINKSHELLRANK,  m_offset, 5);
    //m_offset = packBitsLE(m_data, 0, m_offset,8);

    m_offset = packBitsLE(m_data, SEARCH_UNK0x0E, m_offset, 5);
    m_offset = packBitsLE(m_data, 0, m_offset, 32);

    // TODO: search comments
    if (PPlayer->comment != 0)
    {
        m_offset = packBitsLE(m_data, SEARCH_COMMENT, m_offset, 5);
        m_offset = packBitsLE(m_data, PPlayer->comment, m_offset, 32);
    }

    m_offset = packBitsLE(m_data, SEARCH_FLAGS2, m_offset, 5);
    m_offset = packBitsLE(m_data, PPlayer->flags2, m_offset, 32);

    m_offset = packBitsLE(m_data, SEARCH_LANGUAGE, m_offset, 5);
    m_offset = packBitsLE(m_data, PPlayer->languages, m_offset, 16);

    if (m_offset % 8 > 0) m_offset += 8 - m_offset % 8;                 // побайтное выравнивание данных

    WBUFB(m_data, size_offset) = m_offset / 8 - size_offset - 1;      // размер данных сущности
    WBUFW(m_data, (0x08)) = m_offset / 8;                            // размер отправляемых данных
    delete PPlayer;
}

/************************************************************************
*																		*
*  Возвращаем собранный пакет                                           *
*																		*
************************************************************************/

uint8* CSearchListPacket::GetData()
{
    return m_data;
}

/************************************************************************
*																		*
*  Возвращаем размер отправляемого пакета                               *
*																		*
************************************************************************/

uint16 CSearchListPacket::GetSize()
{
    return m_offset / 8 + 20;
}