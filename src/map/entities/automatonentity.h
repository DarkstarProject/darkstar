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

#ifndef _CAUTOMATONENTITY_H
#define _CAUTOMATONENTITY_H

#include "petentity.h"

enum AUTOFRAMETYPE
{
    FRAME_HARLEQUIN  = 0x20,
    FRAME_VALOREDGE  = 0x21,
    FRAME_SHARPSHOT  = 0x22,
    FRAME_STORMWAKER = 0x23
};

enum AUTOHEADTYPE
{
    HEAD_HARLEQUIN    = 0x01,
    HEAD_VALOREDGE    = 0x02,
    HEAD_SHARPSHOT    = 0x03,
    HEAD_STORMWAKER   = 0x04,
    HEAD_SOULSOOTHER  = 0x05,
    HEAD_SPIRITREAVER = 0x06
};

struct automaton_equip_t
{
    uint8 Frame;
    uint8 Head;
    uint8 Attachments[12];
};

class CCharEntity;

class CAutomatonEntity : public CPetEntity
{
public:
	 CAutomatonEntity();
	~CAutomatonEntity();        	                

    automaton_equip_t m_Equip;
    uint8 m_ElementMax[8];
    uint8 m_ElementEquip[8];

    void setFrame(AUTOFRAMETYPE frame);
    void setHead(AUTOHEADTYPE head);
    void setAttachment(uint8 slot, uint8 id);

    void setElementMax(uint8 element, uint8 max);
    void addElementCapacity(uint8 element, int8 value);

    AUTOFRAMETYPE getFrame();
    AUTOHEADTYPE getHead();
    uint8 getAttachment(uint8 slot);

    uint8 getElementMax(uint8 element);
    uint8 getElementCapacity(uint8 element);

private:

    uint16 m_Burden[8];
};

#endif