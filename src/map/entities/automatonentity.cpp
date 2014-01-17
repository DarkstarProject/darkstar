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

#include "automatonentity.h"
#include "../utils/puppetutils.h"

CAutomatonEntity::CAutomatonEntity()
    : CPetEntity(PETTYPE_AUTOMATON)
{
    memset(&m_Equip, 0, sizeof m_Equip);
    memset(&m_ElementMax, 0, sizeof m_ElementMax);
    memset(&m_ElementEquip, 0, sizeof m_ElementEquip);
    memset(&m_Burden, 0, sizeof m_Burden);
}

CAutomatonEntity::~CAutomatonEntity()
{

}

void CAutomatonEntity::setFrame(AUTOFRAMETYPE frame)
{
    m_Equip.Frame = frame;
}

AUTOFRAMETYPE CAutomatonEntity::getFrame()
{
    return (AUTOFRAMETYPE)m_Equip.Frame;
}

void CAutomatonEntity::setHead(AUTOHEADTYPE head)
{
    m_Equip.Head = head;
}

AUTOHEADTYPE CAutomatonEntity::getHead()
{
    return (AUTOHEADTYPE)m_Equip.Head;
}

void CAutomatonEntity::setAttachment(uint8 slotid, uint8 id)
{
    if (slotid < 12)
    {
        m_Equip.Attachments[slotid] = id;
    }
}

uint8 CAutomatonEntity::getAttachment(uint8 slotid)
{
    if (slotid < 12)
    {
        return m_Equip.Attachments[slotid];
    }
    return 0;
}

void CAutomatonEntity::setElementMax(uint8 element, uint8 max)
{
    if (element < 8)
        m_ElementMax[element] = max;
}

uint8 CAutomatonEntity::getElementMax(uint8 element)
{
    if (element < 8)
        return m_ElementMax[element];
    return 0;
}

void CAutomatonEntity::addElementCapacity(uint8 element, int8 value)
{
    if (element < 8)
        m_ElementEquip[element] += value;
}

uint8 CAutomatonEntity::getElementCapacity(uint8 element)
{
    if (element < 8)
        return m_ElementEquip[element];
    return 0;
}