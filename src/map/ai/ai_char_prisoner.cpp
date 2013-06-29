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

#include "ai_char_prisoner.h"

#include "../charentity.h"

#include "../packets/message_basic.h"

/************************************************************************
*                                                                       *  
*  Инициализируем владельца интеллекта                                  *
*                                                                       *
************************************************************************/

CAICharPrisoner::CAICharPrisoner(CCharEntity* PChar)
{
    DSP_DEBUG_BREAK_IF(PChar == NULL);
    DSP_DEBUG_BREAK_IF(PChar->objtype != TYPE_PC);

    m_PChar = PChar;
}

/************************************************************************
*                                                                       *
*  Основная часть интеллекта - главный цикл                             *
*                                                                       *
************************************************************************/

void CAICharPrisoner::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;
    
    if(m_ActionType != ACTION_NONE)
    {
        Reset();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 316));
    }
}

void CAICharPrisoner::WeatherChange(WEATHER weather, uint8 element)
{

}

void CAICharPrisoner::TransitionBack(bool skipWait)
{
}
