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

#ifndef _AI_H
#define _AI_H

#include <memory>
#include <stack>

#include "controllers/controller.h"
#include "helpers/action_queue.h"
#include "helpers/event_handler.h"
#include "helpers/pathfind.h"
#include "helpers/targetfind.h"
#include "states/state.h"
#include "../entities/baseentity.h"
#include "../packets/message_basic.h"

class CBaseEntity;
class CState;
class CPathFind;
class CTargetFind;

class CAIContainer
{
public:
    CAIContainer(CBaseEntity*);
    CAIContainer(CBaseEntity*, std::unique_ptr<CPathFind>&&, std::unique_ptr<CController>&&,
        std::unique_ptr<CTargetFind>&&);

    //no copy construct/assign (only move)
    CAIContainer(const CAIContainer&) = delete;
    CAIContainer& operator=(const CAIContainer&) = delete;

    void Cast(uint16 targid, uint16 spellid);
    void Engage(uint16 targid);
    void ChangeTarget(uint16 targid);
    void Disengage();
    void WeaponSkill(uint16 targid, uint16 wsid);
    void MobSkill(uint16 targid, uint16 wsid);
    void Ability(uint16 targid, uint16 abilityid);
    void RangedAttack(uint16 targid);
    void Trigger(uint16 targid);
    void UseItem(uint16 targid, uint8 loc, uint8 slotid);
    void Inactive(duration _duration, bool canChangeState);

    /* Internal Controller functions */
    bool Internal_Engage(uint16 targetid);
    bool Internal_Cast(uint16 targetid, uint16 spellid);
    void Internal_ChangeTarget(uint16 targetid);
    void Internal_Disengage();
    bool Internal_WeaponSkill(uint16 targid, uint16 wsid);
    bool Internal_MobSkill(uint16 targid, uint16 wsid);
    bool Internal_Ability(uint16 targetid, uint16 abilityid);
    bool Internal_RangedAttack(uint16 targetid);
    void Internal_Die(duration);
    void Internal_Raise();
    void Internal_UseItem(uint16 targetid, uint8 loc, uint8 slotid);
    void Internal_Despawn(duration spawnTime);

    void Reset();
    void Tick(time_point _tick);
    CState* GetCurrentState();
    bool IsStateStackEmpty();
    void ClearStateStack();
    void InterruptStates();
    // Pop the top state if it's the expected state
    template<typename State>
    bool PopState() { if (IsCurrentState<State>()) m_stateStack.pop(); }
    /* Or have each state return a static number/string that Lua can use as well, in case this is not sufficient */
    template<typename State, typename = std::enable_if_t<std::is_base_of<CState, State>::value>>
    bool IsCurrentState() { return dynamic_cast<State*>(GetCurrentState()); }
    bool IsSpawned();
    bool IsRoaming();
    bool IsEngaged();
    //whether AI is currently able to change state from external means
    bool CanChangeState();
    bool CanFollowPath();

    void SetController(std::unique_ptr<CController> controller);
    CController* GetController();

    time_point getTick();
    time_point getPrevTick();

    void Despawn();

    void QueueAction(queueAction_t&&);
    bool QueueEmpty();

    // stores all events and their associated lua callbacks
    CAIEventHandler EventHandler;
    std::unique_ptr<CTargetFind> TargetFind;

    // pathfinder, not guaranteed to be implemented
    std::unique_ptr<CPathFind> PathFind;

protected:
    // input controller
    std::unique_ptr<CController> Controller;
    // current synchronized server time (before AI loop execution)
    time_point m_Tick;
    time_point m_PrevTick;
    //entity who holds this AI
    CBaseEntity* PEntity;

    void CheckCompletedStates();
    template<typename T, typename... Args>
    bool ChangeState(Args&&... args)
    {
        DSP_DEBUG_BREAK_IF(m_stateStack.size() > 10);
        if (CanChangeState())
        {
            try
            {
                CheckCompletedStates();
                m_stateStack.emplace(std::make_unique<T>(std::forward<Args>(args)...));
                return true;
            }
            catch (CStateInitException& e)
            {
                PEntity->HandleErrorMessage(e.packet);
            }
        }
        return false;
    }
    template<typename T, typename... Args>
    bool ForceChangeState(Args&&... args)
    {
        DSP_DEBUG_BREAK_IF(m_stateStack.size() > 10);
        try
        {
            CheckCompletedStates();
            m_stateStack.emplace(std::make_unique<T>(std::forward<Args>(args)...));
            return true;
        }
        catch (CStateInitException& e)
        {
            PEntity->HandleErrorMessage(e.packet);
        }
        return false;
    }

private:
    std::stack<std::unique_ptr<CState>> m_stateStack;
    CAIActionQueue ActionQueue;
};

#endif
