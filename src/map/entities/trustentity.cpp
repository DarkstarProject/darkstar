/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

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

#include <string.h>

#include "trustentity.h"
#include "../ability.h"
#include "../mob_spell_container.h"
#include "../trust_spell_container.h"
#include "../mob_spell_list.h"
#include "../trust_spell_list.h"
#include "../trust_weaponskill_list.h"
#include "../packets/char_health.h"
#include "../packets/entity_update.h"
#include "../packets/trust_sync.h"
#include "../ai/ai_container.h"

#include "../ai/controllers/trust_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"

#include "../utils/battleutils.h"
#include "../utils/petutils.h"
#include "../utils/mobutils.h"
#include "../utils/trustutils.h"
#include "../../common/utils.h"
#include "../mob_modifier.h"
#include "../recast_container.h"
#include "../status_effect_container.h"
#include "../ai/states/trustweaponskill_state.h"
#include "../ai/states/trustability_state.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/mobskill_state.h"

CTrustEntity::CTrustEntity()
{
    objtype = TYPE_TRUST;
    m_EcoSystem = SYSTEM_UNCLASSIFIED;
    allegiance = ALLEGIANCE_PLAYER;
    m_MobSkillList = 0;
    PAI = std::make_unique<CAIContainer>(this,
        std::make_unique<CPathFind>(this),
        std::make_unique<CTrustController>(this),
        std::make_unique<CTargetFind>(this));
    m_TrustSpellListContainer = new CTrustSpellList();
    TrustSpellContainer = new CTrustSpellContainer(this);
    m_currentWS = 0;
}

CTrustEntity::~CTrustEntity()
{
}

void CTrustEntity::PostTick()
{
    CBattleEntity::PostTick();
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));

        if (this->PMaster != nullptr)
        {
            if (updatemask & UPDATE_HP)
            {
                if (PMaster->PParty != nullptr)
                {
                    PMaster->ForParty([this](auto PMember)
                    {
                        if (PMember->objtype == TYPE_PC)
                        {
                            static_cast<CCharEntity*>(PMember)->pushPacket(new CCharHealthPacket(this));
                        }
                    });
                }
            }
        }
        updatemask = 0;
    }
}

void CTrustEntity::FadeOut()
{
    CBaseEntity::FadeOut();
    loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_DESPAWN, UPDATE_NONE));
}

void CTrustEntity::Die()
{
    PAI->Internal_Die(0s);
    luautils::OnTrustDeath(this);
    ((CCharEntity*)PMaster)->RemoveTrust(this);
    CBattleEntity::Die();
}

void CTrustEntity::OnDeathTimer()
{
    if (!(m_Behaviour & BEHAVIOUR_RAISABLE))
        PAI->Despawn();
}

void CTrustEntity::OnDespawn(CDespawnState&)
{
    FadeOut();
    PAI->EventHandler.triggerListener("DESPAWN", this);
}

void CTrustEntity::Spawn()
{
    trustutils::GetAvailableSpells(this);
    CBattleEntity::Spawn();
    luautils::OnTrustSpawn(this);
}

void CTrustEntity::addTrait(CTrait* PTrait)
{
    TraitList.push_back(PTrait);
    addModifier(PTrait->getMod(), PTrait->getValue());
}

void CTrustEntity::delTrait(CTrait* PTrait)
{
    delModifier(PTrait->getMod(), PTrait->getValue());
    TraitList.erase(std::remove(TraitList.begin(), TraitList.end(), PTrait), TraitList.end());
}

bool CTrustEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (targetFlags & TARGET_PLAYER && PInitiator->allegiance == allegiance)
    {
        return true;
    }
    if (CBattleEntity::ValidTarget(PInitiator, targetFlags))
    {
        return true;
    }
    if (targetFlags & TARGET_PLAYER_DEAD && (m_Behaviour & BEHAVIOUR_RAISABLE)
        && isDead())
    {
        return true;
    }

    if ((targetFlags & TARGET_PLAYER) && allegiance == PInitiator->allegiance && !isCharmed)
    {
        return true;
    }

    if (targetFlags & TARGET_NPC)
    {
        if (allegiance == PInitiator->allegiance && !(m_Behaviour & BEHAVIOUR_NOHELP) && !isCharmed)
        {
            return true;
        }
    }

    return false;
}

void CTrustEntity::OnDisengage(CAttackState& state)
{
    CBattleEntity::OnDisengage(state);
    luautils::OnTrustDisengage(this);
}

void CTrustEntity::OnEngage(CAttackState& state)
{
    CBattleEntity::OnEngage(state);
    luautils::OnTrustEngaged(this, state.GetTarget());}

void CTrustEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    CBattleEntity::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    PRecastContainer->Add(RECAST_MAGIC, static_cast<uint16>(PSpell->getID()), action.recast);
}

void CTrustEntity::OnTrustSkillFinished(CTrustSkillState& state, action_t& action)
{
    auto PSkill = state.GetMSkill();
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());
    int16 tp = state.GetSpentTP();
    PAI->TargetFind->reset();

    uint16 skillId = PSkill->getID();
    uint8 skillFlag = PSkill->getFlag();
    uint8 findFlags = 0;
    float distance = PSkill->getDistance();
    bool isAoe = PSkill->isAoE();
    bool isConal = PSkill->isConal();
    bool hasMissMsg = PSkill->hasMissMsg();
    uint8 getAoe = PSkill->getAoe();
    float getRadius = PSkill->getRadius();
    uint8 getKnockback = PSkill->getKnockback();
    uint8 getPrimarySkillchain = PSkill->getPrimarySkillchain();
    uint8 getSecondarySkillchain = PSkill->getSecondarySkillchain();
    uint8 getTertiarySkillchain = PSkill->getTertiarySkillchain();
    uint16 msg = 0;
    uint16 msgAoe = PSkill->getAoEMsg();
    uint16 defaultMessage = PSkill->getMsg();
    uint16 animationId = PSkill->getAnimationID();

    if (skillFlag & 0x008) //SKILLFLAG_HIT_ALL
    {
        findFlags |= FINDFLAGS_HIT_ALL;
    }

    action.id = id;
    if (PSkill->getID() < 256)
        action.actiontype = ACTION_WEAPONSKILL_FINISH;
    else
        action.actiontype = ACTION_MOBABILITY_FINISH;
    action.actionid = skillId;

    if (PBattleTarget && PAI->TargetFind->isWithinRange(&PBattleTarget->loc.p, distance))
    {
        if (isAoe)
        {
            PAI->TargetFind->findWithinArea(PBattleTarget, (AOERADIUS)getAoe, getRadius, findFlags);
        }
        else if (isConal)
        {
            float angle = 45.0f;
            PAI->TargetFind->findWithinCone(PBattleTarget, distance, angle, findFlags);
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PBattleTarget, findFlags);
        }
    }

    uint16 targets = (uint16)PAI->TargetFind->m_targets.size();

    if (!PBattleTarget || targets == 0)
    {
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation = skillId;
        return;
    }

    PSkill->setTotalTargets(targets);
    PSkill->setTP(state.GetSpentTP());
    PSkill->setHPP(GetHPP());

    for (auto&& PTarget : PAI->TargetFind->m_targets)
    {
        bool primary = PTarget == PBattleTarget;
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& target = actionList.getNewActionTarget();

        int32 damage;

        target.reaction = REACTION_HIT;
        target.speceffect = SPECEFFECT_HIT;
        target.animation = animationId;
        target.messageID = 0;

        damage = luautils::OnTrustWeaponSkill(PTarget, this, PSkill);

        if (PSkill->getMsg() != 185)
        {
            target.messageID = PSkill->getMsg();
            target.param = damage;
        }


        this->PAI->EventHandler.triggerListener("WEAPONSKILL_USE", this, PTarget, skillId, state.GetSpentTP(), &action);
        PTarget->PAI->EventHandler.triggerListener("WEAPONSKILL_TAKE", PTarget, this, skillId, state.GetSpentTP(), &action);

        if (target.messageID == 0)
        {
            if (msg == 0)
            {
                msg = defaultMessage;
            }
            else
            {
                msg = msgAoe;
            }

            target.messageID = msg;
        }

        if (hasMissMsg)
        {
            target.reaction = REACTION_MISS;
            target.speceffect = SPECEFFECT_NONE;
            if (msg == msgAoe)
                msg = 282;
        }
        else
        {
            target.reaction = REACTION_HIT;
        }

        if (!battleutils::isValidSelfTargetWeaponskill(skillId))
        {
            if (primary && PTarget->objtype == TYPE_MOB)
            {
                luautils::OnWeaponskillHit(PTarget, this, skillId);
                target.param = damage;
            }
        }
        else
        {
            target.messageID = primary ? 224 : 276; //restores mp msg
            target.reaction = REACTION_HIT;
            damage = std::max(damage, 0);
            target.param = addMP(damage);
        }

        if (target.speceffect & SPECEFFECT_HIT)
        {
            target.speceffect = SPECEFFECT_RECOIL;
            target.knockback = getKnockback;
            if (primary && (getPrimarySkillchain != 0))
            {
                if (getPrimarySkillchain)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, getPrimarySkillchain,
                        getSecondarySkillchain, getTertiarySkillchain);
                    if (effect != SUBEFFECT_NONE)
                    {
                        int32 skillChainDamage = battleutils::TakeSkillchainDamage(this, PTarget, target.param, nullptr);
                        if (skillChainDamage < 0)
                        {
                            target.addEffectParam = -skillChainDamage;
                            target.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            target.addEffectParam = skillChainDamage;
                            target.addEffectMessage = 287 + effect;
                        }
                        target.additionalEffect = effect;
                    }
                }
                primary = false;
            }
        }
    }
    m_currentWS = 0;
}

uint8 CTrustEntity::TPUseChance()
{
    CTrustWSList* TrustSkillList = trustWSList::GetTrustWSList(m_TrustID - 895);

    if (health.tp < 1000 || TrustSkillList == nullptr || !static_cast<CTrustController*>(PAI->GetController())->IsWeaponSkillEnabled())
    {
        return 0;
    }

    if (health.tp >= 1000 || (GetHPP() <= 25 && health.tp >= 1000))
    {
        return 100;
    }

    return (uint8)getMobMod(MOBMOD_TP_USE_CHANCE);
}

void CTrustEntity::setMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] = value;
}

int16 CTrustEntity::getMobMod(uint16 type)
{
    return m_mobModStat[type];
}

void CTrustEntity::addMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] += value;
}

void CTrustEntity::defaultMobMod(uint16 type, int16 value)
{
    if (m_mobModStat[type] == 0)
    {
        m_mobModStat[type] = value;
    }
}

void CTrustEntity::OnAbility(CAbilityState& state, action_t& action)
{
    auto PAbility = state.GetAbility();

    CAbility* ability = ability::GetAbility(PAbility->getID());

    if (this->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId(), 0))
    {
        return;
    }
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)) {
        return;
    }

    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    std::unique_ptr<CBasicPacket> errMsg;

    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            return;
        }
        if (battleutils::IsParalyzed(this)) {
            // display paralyzed
            loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        if (PAbility->getID() == ABILITY_LIGHT_ARTS || PAbility->getID() == ABILITY_DARK_ARTS || PAbility->getRecastId() == 231) //stratagems
        {
            if (this->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                action.recast = 0;
        }

        action.id = this->id;
        action.actiontype = PAbility->getActionType();
        action.recast = 0;
        //#TODO: unoffset this
        action.actionid = PAbility->getID() + 16;

        if (ability->getRecastTime() > 0)
        {
            action.recast = ability->getRecastTime();
        }

        //#TODO: make this generic enough to not require an if
        if (PAbility->isAoE() && this->PParty != nullptr)
        {
            PAI->TargetFind->reset();

            float distance = PAbility->getRange();

            PAI->TargetFind->findWithinArea(this, AOERADIUS_ATTACKER, distance);

            uint16 msg = 0;
            for (auto&& PTarget : PAI->TargetFind->m_targets)
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_NONE;
                actionTarget.animation = PAbility->getAnimationID();
                actionTarget.messageID = PAbility->getMessage();

                if (msg == 0) {
                    msg = PAbility->getMessage();
                }
                else {
                    msg = PAbility->getAoEMsg();
                }

                if (actionTarget.param < 0)
                {
                    msg = ability::GetAbsorbMessage(msg);
                    actionTarget.param = -actionTarget.param;
                }

                actionTarget.messageID = msg;
                actionTarget.param = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            }
        }
        else
        {
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_RECOIL;
            actionTarget.animation = PAbility->getAnimationID();
            actionTarget.param = 0;
            auto prevMsg = actionTarget.messageID;

            int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            if (prevMsg == actionTarget.messageID) actionTarget.messageID = PAbility->getMessage();
            if (actionTarget.messageID == 0) actionTarget.messageID = MSGBASIC_USES_JA;
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param = -value;
            }

            state.ApplyEnmity();
        }
        PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), action.recast);
        //pushPacket(new CCharRecastPacket(this));
    }
}

bool CTrustEntity::Rest(float rate)
{
    if (health.hp != health.maxhp || health.mp != health.maxmp) {
        // recover 20% HP
        uint32 recoverHP = (uint32)(health.maxhp * rate);
        uint32 recoverMP = (uint32)(health.maxmp * rate);
        addHP(recoverHP);
        addMP(recoverMP);
        return true;
    }

    return false;
}

void CTrustEntity::setLastWs(uint32 value)
{
    m_currentWS = value;
}

uint32 CTrustEntity::getLastWs()
{
    return m_currentWS;
}