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
#include "controllers/player_controller.h"
#include "states/attack_state.h"
#include "../entities/charentity.h"
#include "../utils/battleutils.h"
#include "../packets/action.h"
#include "../packets/lock_on.h"
#include "../packets/char_update.h"
#include "../packets/message_basic.h"

CAIChar::CAIChar(CCharEntity* PChar) :
    CAIBattle(PChar, nullptr, std::make_unique<CPlayerController>(PChar))
{
}

CBattleEntity* CAIChar::IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PTarget = CAIBattle::IsValidTarget(targid, validTargetFlags, errMsg);
    if (PTarget)
    {
        if (static_cast<CCharEntity*>(PEntity)->IsMobOwner(PTarget))
        {
            return PTarget;
        }
        else
        {
            errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);
        }
    }
    else
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PEntity, 0, 0, MSGBASIC_CANNOT_ATTACK_TARGET);
    }
    return nullptr;
}

void CAIChar::OnChangeTarget(CBattleEntity* PNewTarget)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    PChar->pushPacket(new CLockOnPacket(PChar, PNewTarget));
}

void CAIChar::PostDisengage()
{
    CAIBattle::PostDisengage();
    auto PChar = static_cast<CCharEntity*>(PEntity);
    auto state = PChar->PAIBattle()->GetCurrentState();
    if (state && state->HasErrorMsg())
    {
        PChar->pushPacket(state->GetErrorMsg());
    }
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(false);
}

bool CAIChar::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PBattleEntity = static_cast<CBattleEntity*>(PEntity);

    float dist = distance(PEntity->loc.p, PTarget->loc.p);

    if (dist > 30)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
        PBattleEntity->PAIBattle()->Disengage();
        return false;
    }
    else if (!isFaceing(PEntity->loc.p, PTarget->loc.p, 40))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG);
    }
    else if (dist > PTarget->m_ModelSize)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE);
    }
    return true;
}

bool CAIChar::Attack(action_t& action)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    if (GetCurrentState()->HasErrorMsg())
    {
        if (m_errMsgTime + std::chrono::milliseconds(PChar->GetWeaponDelay(false)) < getTick())
        {
            m_errMsgTime = getTick();
            PChar->pushPacket(GetCurrentState()->GetErrorMsg());
        }
        return false;
    }
    static_cast<CPlayerController*>(Controller.get())->setLastAttackTime(server_clock::now());
    return CAIBattle::Attack(action);
}

void CAIChar::CastFinished(action_t& action)
{
    CAIBattle::CastFinished(action);

    auto state = static_cast<CMagicState*>(GetCurrentState());
    auto PSpell = state->GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state->GetTarget());

    static_cast<CPlayerController*>(Controller.get())->setLastActionTime(server_clock::now());
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
