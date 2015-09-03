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

#include "ai_char.h"
#include "states/attack_state.h"
#include "../entities/charentity.h"
#include "../utils/battleutils.h"
#include "../packets/action.h"
#include "../packets/lock_on.h"
#include "../packets/char_update.h"
#include "../packets/message_basic.h"

CAIChar::CAIChar(CBattleEntity* PBattleEntity) :
    CAIBattle(PBattleEntity, nullptr)
{
}

bool CAIChar::Cast(uint16 targetid, uint16 spellid)
{
    auto result = CAIBattle::Cast(targetid, spellid);
    if (!result)
    {
        static_cast<CCharEntity*>(PEntity)->pushPacket(static_cast<CMagicState*>(GetCurrentState())->GetErrorMsg());
    }
    return result;
}

bool CAIChar::Engage(uint16 targid)
{
    //#TODO: check gcd

    auto ret = CAIBattle::Engage(targid);
    auto PChar = static_cast<CCharEntity*>(PEntity);
    auto PTarget = static_cast<CBattleEntity*>(PEntity->GetEntity(targid));

    if (ret)
    {
        PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(true);
        PChar->pushPacket(new CLockOnPacket(PChar, PTarget));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
    }
    return ret;
}

void CAIChar::Disengage()
{
    CAIBattle::Disengage();
    auto PChar = static_cast<CCharEntity*>(PEntity);
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(false);
}

void CAIChar::CastFinished(action_t& action)
{
    CAIBattle::CastFinished(action);

    auto state = static_cast<CMagicState*>(GetCurrentState());
    auto PSpell = state->GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state->GetTarget());

    static_cast<CCharEntity*>(PEntity)->PRecastContainer->Add(RECAST_MAGIC, PSpell->getID(), action.recast);

    for (auto&& actionList : action.actionLists)
    {
        for (auto&& actionTarget : actionList.actionTargets)
        {
            if (actionTarget.param > 0 && PSpell->dealsDamage() && PSpell->getSpellGroup() == SPELLGROUP_BLUE &&
                static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_CHAIN_AFFINITY) &&
                static_cast<CBlueSpell*>(PSpell)->getPrimarySkillchain() != 0)
            {

                SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, static_cast<CBlueSpell*>(PSpell));
                if (effect != SUBEFFECT_NONE)
                {
                    uint16 skillChainDamage = battleutils::TakeSkillchainDamage(static_cast<CBattleEntity*>(PEntity), PTarget, actionTarget.param);

                    actionTarget.addEffectParam = skillChainDamage;
                    actionTarget.addEffectMessage = 287 + effect;
                    actionTarget.additionalEffect = effect;

                }
                if (static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI) ||
                    static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
                {
                    static_cast<CBattleEntity*>(PEntity)->health.tp = (static_cast<CBattleEntity*>(PEntity)->health.tp > 1000 ? static_cast<CBattleEntity*>(PEntity)->health.tp - 1000 : 0);
                }
                else
                {
                    static_cast<CBattleEntity*>(PEntity)->health.tp = 0;
                }

                static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHAIN_AFFINITY);
            }
        }
    }
}

void CAIChar::CastInterrupted(action_t& action, MSGBASIC_ID msg)
{
    CAIBattle::CastInterrupted(action, msg);

    auto container = static_cast<CMagicState*>(GetCurrentState());
    auto message = container->GetErrorMsg();

    if (message)
    {
        static_cast<CCharEntity*>(PEntity)->pushPacket(message);
    }
}
