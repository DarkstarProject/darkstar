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

#ifndef _CACTIONPACKET_H
#define _CACTIONPACKET_H

#include "../../common/cbasetypes.h"
#include "basic.h"

#include "../entities/battleentity.h"
#include "../spell.h"

#define MAX_ACTION_TARGETS	16

struct actionTarget_t
{
    REACTION		  reaction;			    //  5 bits
    uint16			  animation;			// 12 bits
    SPECEFFECT		  speceffect;			//  7 bits
    uint8             knockback;            //  3 bits
    int32			  param;				// 17 bits
    uint16			  messageID;			// 10 bits
    SUBEFFECT         additionalEffect;     // 10 bits
    int32             addEffectParam;       // 17 bits
    uint16            addEffectMessage;     // 10 bits
    SUBEFFECT         spikesEffect;         // 10 bits
    uint16            spikesParam;          // 14 bits
    uint16            spikesMessage;        // 10 bits

    actionTarget_t() : reaction(REACTION_NONE), animation(0),
        speceffect(SPECEFFECT_NONE), knockback(0), param(0),
        messageID(0), additionalEffect(SUBEFFECT_NONE),
        addEffectParam(0), addEffectMessage(0),
        spikesEffect(SUBEFFECT_NONE), spikesParam(0),
        spikesMessage(0) {}
    actionTarget_t(const actionTarget_t&) = delete;
    actionTarget_t& operator=(const actionTarget_t&) = delete;

    /* Not automatically generated */
    actionTarget_t(actionTarget_t&&) = default;
    actionTarget_t& operator=(actionTarget_t&&) = default;
};

struct actionList_t
{
    uint32    ActionTargetID;		    // 32 bits
    std::vector<actionTarget_t> actionTargets;

    actionList_t() : ActionTargetID(0) {}
    actionList_t(const actionList_t&) = delete;
    actionList_t& operator=(const actionList_t&) = delete;

    /* Not automatically generated */
    actionList_t(actionList_t&&) = default;
    actionList_t& operator=(actionList_t&&) = default;

    actionTarget_t& getNewActionTarget()
    {
        return *actionTargets.emplace(actionTargets.end());
    }
};

struct action_t
{
    uint32 id;
    ACTIONTYPE actiontype;
    uint16 actionid;
    uint16 recast;
    SPELLGROUP spellgroup;
    std::vector<actionList_t> actionLists;

    action_t() : id(0), actiontype(ACTION_NONE), actionid(0),
        recast(0), spellgroup(SPELLGROUP_NONE) {}

    actionList_t& getNewActionList()
    {
        return *actionLists.emplace(actionLists.end());
    }
};

class CBattleEntity;

class CActionPacket : public CBasicPacket
{
public:

    CActionPacket(action_t&);
	CActionPacket(CBattleEntity* PEntity);
    CActionPacket(uint32 id, uint32 targetid, uint8 ActionType, 
                  uint16 param, uint8 reaction = 0, uint16 animation = 0, uint8 speceffect = 0, 
                  uint8 knockback = 0, uint32 messageparam = 0, uint16 messageID = 0);

};

#endif

