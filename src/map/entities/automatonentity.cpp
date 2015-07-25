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

#include "automatonentity.h"
#include "../utils/puppetutils.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"
#include "../packets/char_job_extra.h"

CAutomatonEntity::CAutomatonEntity()
    : CPetEntity(PETTYPE_AUTOMATON)
{
    memset(&m_Equip, 0, sizeof m_Equip);
    memset(&m_ElementMax, 0, sizeof m_ElementMax);
    memset(&m_ElementEquip, 0, sizeof m_ElementEquip);
    memset(&m_Burden, 40, sizeof m_Burden);
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

void CAutomatonEntity::burdenTick()
{
    for (int i = 0; i < 8; i++)
    {
        if (m_Burden[i] > 0)
        {
            //TODO: heat sink attachment
            m_Burden[i]--;
        }
    }
}

uint8 CAutomatonEntity::addBurden(uint8 element, uint8 burden)
{
    //TODO: tactical processor attachment
    uint8 thresh = 30 + PMaster->getMod(MOD_OVERLOAD_THRESH);
    if (element < 8)
    {
        m_Burden[element] += burden;
        //check for overload
        if (m_Burden[element] > thresh)
        {
            if (dsprand::GetRandomNumber(100) < (m_Burden[element] - thresh + 5))
            {
                //return overload duration
                return m_Burden[element] - thresh;
            }
        }
    }
    return 0;
}

void CAutomatonEntity::UpdateEntity()
{
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        if (PMaster && PMaster->PPet == this)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)PMaster));
        }
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
        updatemask = 0;
        if (PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CCharJobExtraPacket((CCharEntity*)PMaster, PMaster->GetMJob() == JOB_PUP));
        }
        updatemask = 0;
    }
}