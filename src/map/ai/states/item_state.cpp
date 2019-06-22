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

#include "item_state.h"

#include "../ai_container.h"
#include "../../entities/battleentity.h"
#include "../../entities/charentity.h"

#include "../../item_container.h"
#include "../../status_effect_container.h"
#include "../../universal_container.h"

#include "../../packets/action.h"
#include "../../packets/inventory_assign.h"
#include "../../packets/inventory_item.h"
#include "../../packets/inventory_finish.h"

#include "../../utils/battleutils.h"
#include "../../utils/charutils.h"


CItemState::CItemState(CCharEntity* PEntity, uint16 targid, uint8 loc, uint8 slotid) :
    CState(PEntity, targid),
    m_PEntity(PEntity),
    m_PItem(nullptr),
    m_location(loc),
    m_slot(slotid)
{
    auto PItem = dynamic_cast<CItemUsable*>(m_PEntity->getStorage(loc)->GetItem(slotid));
    m_PItem = PItem;

    if (m_PItem && m_PItem->isType(ITEM_USABLE))
    {
        if (m_PItem->isType(ITEM_EQUIPMENT))
        {
            // check if this item is equipped
            bool found = false;
            for (auto equipslot = 0; equipslot < 18; ++equipslot)
            {
                if (m_PEntity->getEquip((SLOTTYPE)equipslot) == m_PItem && m_PItem->getCurrentCharges() > 0)
                {
                    found = true;
                    break;
                }
            }
            if (!found)
                m_PItem = nullptr;
        }
        else if (m_PItem->isSubType(ITEM_LOCKED))
        {
            m_PItem = nullptr;
        }
    }

    if (!m_PItem)
    {
        throw CStateInitException(std::make_unique<CMessageBasicPacket>(m_PEntity, m_PEntity, 0, 0, 56));
    }

    auto PTarget = m_PEntity->IsValidTarget(targid, m_PItem->getValidTarget(), m_errorMsg);

    if (!PTarget || m_errorMsg)
    {
        throw CStateInitException(std::move(m_errorMsg));
    }

    auto [error, param, value] = luautils::OnItemCheck(PTarget, m_PItem, ITEMCHECK::NONE, m_PEntity);
    if (error || m_PEntity->StatusEffectContainer->HasPreventActionEffect())
    {
        if (error == -1)
        {
            throw CStateInitException(nullptr);
        }
        else
        {
            if (value == 0)
            {
                param = m_PItem->getFlag() & ITEM_FLAG_SCROLL ? m_PItem->getSubID() : m_PItem->getID();
            }
            throw CStateInitException(std::make_unique<CMessageBasicPacket>(m_PEntity, PTarget ? PTarget : m_PEntity, param, value, error));
        }
    }

    m_PEntity->UContainer->SetType(UCONTAINER_USEITEM);
    m_PEntity->UContainer->SetItem(0, m_PItem);

    CState::UpdateTarget(m_targid);

    m_startPos = m_PEntity->loc.p;
    m_castTime = std::chrono::milliseconds(m_PItem->getActivationTime());
    m_animationTime = std::chrono::milliseconds(PItem->getAnimationTime());

    action_t action;
    action.id = m_PEntity->id;
    action.actiontype = ACTION_ITEM_START;

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();

    actionTarget.reaction = REACTION_NONE;
    actionTarget.speceffect = SPECEFFECT_NONE;
    actionTarget.animation = 0;
    actionTarget.param = m_PItem->getID();
    actionTarget.messageID = 28;
    actionTarget.knockback = 0;

    m_PEntity->PAI->EventHandler.triggerListener("ITEM_START", PTarget, m_PItem, &action);
    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));

    m_PItem->setSubType(ITEM_LOCKED);

    m_PEntity->pushPacket(new CInventoryAssignPacket(m_PItem, INV_NOSELECT));
    m_PEntity->pushPacket(new CInventoryFinishPacket());
}

bool CItemState::Update(time_point tick)
{
    if (tick > GetEntryTime() + m_castTime && !IsCompleted())
    {
        m_interrupted = false;
        m_interruptable = false;
        UpdateTarget(m_PEntity->IsValidTarget(m_targid, m_PItem->getValidTarget(), m_errorMsg));

        action_t action;

        // attempt to interrupt
        InterruptItem(action);

        if (!m_interrupted)
        {
            FinishItem(action);
        }
        m_PEntity->PAI->EventHandler.triggerListener("ITEM_USE", m_PEntity, m_PItem, &action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        Complete();
    }
    else if (IsCompleted() && tick > GetEntryTime() + m_castTime + m_animationTime)
    {
        m_PEntity->PAI->EventHandler.triggerListener("ITEM_STATE_EXIT", m_PEntity, m_PItem);
        return true;
    }
    return false;
}

void CItemState::Cleanup(time_point tick)
{
    m_PEntity->UContainer->Clean();

    if ((m_interrupted || !IsCompleted()) && !m_PItem->isType(ITEM_EQUIPMENT))
        m_PItem->setSubType(ITEM_UNLOCKED);

    auto PItem = m_PEntity->getStorage(m_location)->GetItem(m_slot);

    if (PItem && PItem == m_PItem)
        m_PEntity->pushPacket(new CInventoryAssignPacket(m_PItem, INV_NORMAL));
    else
        m_PItem = nullptr;

    m_PEntity->pushPacket(new CInventoryItemPacket(m_PItem, m_location, m_slot));
    m_PEntity->pushPacket(new CInventoryFinishPacket());
}

bool CItemState::CanChangeState()
{
    return false;
}

void CItemState::TryInterrupt(CBattleEntity * PTarget)
{
    // todo: interrupt on being hit

    if (PTarget)
        PTarget = m_PEntity->IsValidTarget(PTarget->targid, m_PItem->getValidTarget(), m_errorMsg);
    else
        PTarget = m_PEntity->IsValidTarget(m_targid, m_PItem->getValidTarget(), m_errorMsg);

    uint16 msg = 445; // you cannot use items at this time

    if (HasMoved() || m_PEntity->StatusEffectContainer->HasPreventActionEffect())
    {
        m_interrupted = true;
    }
    else if (battleutils::IsParalyzed(m_PEntity))
    {
        msg = MSGBASIC_IS_PARALYZED;
        m_interrupted = true;
    }
    else if (!PTarget)
    {
        m_interrupted = true;
    }
    else if (battleutils::IsIntimidated(m_PEntity, static_cast<CBattleEntity*>(PTarget)))
    {
        msg = MSGBASIC_IS_INTIMIDATED;
        m_interrupted = true;
    }

    if (m_interrupted && !m_errorMsg)
        m_errorMsg = std::make_unique<CMessageBasicPacket>(m_PEntity, m_PEntity, m_PItem->getID(), 0, msg);
}

CItemUsable* CItemState::GetItem()
{
    return m_PItem;
}

void CItemState::InterruptItem(action_t& action)
{
    TryInterrupt(static_cast<CBattleEntity*>(GetTarget()));

    if (m_interrupted)
    {
        action.id = m_PEntity->id;
        action.actiontype = ACTION_ITEM_INTERRUPT;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = (m_PEntity->IsValidTarget(m_targid, m_PItem->getValidTarget(), m_errorMsg) ? GetTarget()->id : 0);

        actionTarget_t& actionTarget = actionList.getNewActionTarget();

        actionTarget.reaction = REACTION_NONE;
        actionTarget.speceffect = SPECEFFECT_NONE;
        actionTarget.animation = 54;
        actionTarget.param = 0;
        actionTarget.messageID = 0;
        actionTarget.knockback = 0;

        m_PEntity->pushPacket(m_errorMsg.release());
    }
}

void CItemState::FinishItem(action_t& action)
{
    m_PEntity->OnItemFinish(*this, action);
}

bool CItemState::HasMoved()
{
    return floorf(m_startPos.x * 10 + 0.5f) / 10 != floorf(m_PEntity->loc.p.x * 10 + 0.5f) / 10 ||
        floorf(m_startPos.z * 10 + 0.5f) / 10 != floorf(m_PEntity->loc.p.z * 10 + 0.5f) / 10;
}
