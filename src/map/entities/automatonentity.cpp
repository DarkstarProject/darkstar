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
#include "../ai/ai_container.h"
#include "../ai/controllers/automaton_controller.h"
#include "../utils/puppetutils.h"
#include "../packets/entity_update.h"
#include "../packets/pet_sync.h"
#include "../packets/char_job_extra.h"
#include "../status_effect_container.h"

CAutomatonEntity::CAutomatonEntity()
    : CPetEntity(PETTYPE_AUTOMATON)
{
    PAI->SetController(nullptr);
}

CAutomatonEntity::~CAutomatonEntity()
{}

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
    m_Equip.Attachments[slotid] = id;
}

uint8 CAutomatonEntity::getAttachment(uint8 slotid)
{
    return m_Equip.Attachments[slotid];
}

bool CAutomatonEntity::hasAttachment(uint8 attachment)
{
    for (auto&& attachmentid : m_Equip.Attachments)
    {
        if (attachmentid == attachment)
        {
            return true;
        }
    }
    return false;
}

void CAutomatonEntity::setElementMax(uint8 element, uint8 max)
{
    m_ElementMax[element] = max;
}

uint8 CAutomatonEntity::getElementMax(uint8 element)
{
    return m_ElementMax[element];
}

void CAutomatonEntity::addElementCapacity(uint8 element, int8 value)
{
    m_ElementEquip[element] += value;
}

uint8 CAutomatonEntity::getElementCapacity(uint8 element)
{
    return m_ElementEquip[element];
}

void CAutomatonEntity::burdenTick()
{
    for (auto&& burden : m_Burden)
    {
        if (burden > 0)
        {
            --burden;
        }
    }
}

void CAutomatonEntity::setInitialBurden()
{
    m_Burden.fill(30);
}

uint8 CAutomatonEntity::addBurden(uint8 element, uint8 burden)
{
    //TODO: tactical processor attachment
    uint8 thresh = 30 + PMaster->getMod(Mod::OVERLOAD_THRESH);
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
    return 0;
}

void CAutomatonEntity::PostTick()
{
    auto pre_mask = updatemask;
    CPetEntity::PostTick();
    if (pre_mask && status != STATUS_DISAPPEAR)
    {
        if (PMaster && PMaster->objtype == TYPE_PC)
        {
            ((CCharEntity*)PMaster)->pushPacket(new CCharJobExtraPacket((CCharEntity*)PMaster, PMaster->GetMJob() == JOB_PUP));
        }
    }
}

void CAutomatonEntity::Die()
{
    PMaster->StatusEffectContainer->RemoveAllManeuvers();
    CPetEntity::Die();
}
