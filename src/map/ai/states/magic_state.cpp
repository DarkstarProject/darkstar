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

#include "magic_state.h"
#include "../../entities/mobentity.h"
#include "../../entities/charentity.h"
#include "../../lua/luautils.h"
#include "../../utils/battleutils.h"
#include "../../utils/charutils.h"
#include "../ai_pet_dummy.h"
#include "../../packets/char_update.h"

#include "../../spell.h"

CMagicState::CMagicState(CBattleEntity* PEntity, CTargetFind* PTargetFind, float maxStartDistance, float maxFinishDistance)
: CState(PEntity, PTargetFind)
{
	m_PSpell = nullptr;
	m_enableCasting = true;
	m_maxStartDistance = maxStartDistance;
	m_maxFinishDistance = maxFinishDistance;
}

STATESTATUS CMagicState::CastSpell(CSpell* PSpell, CBattleEntity* PTarget, uint8 flags)
{
	if(!CanCastSpell(PSpell, PTarget, flags))
	{
		return STATESTATUS_ERROR;
	}

	Clear();

	m_PSpell = PSpell;
	m_PTarget = PTarget;
	m_flags = flags;
    m_startPosition = m_PEntity->loc.p;

	m_castTime = CalculateCastTime(PSpell);

	apAction_t action;

	action.ActionTarget = m_PTarget;
	action.reaction   = REACTION_NONE;
	action.speceffect = SPECEFFECT_NONE;
	action.animation  = 0;
	action.param	  = m_PSpell->getID();
	action.messageID  = 327; // starts casting

    m_PEntity->m_ActionList.clear();
	m_PEntity->m_ActionList.push_back(action);
	m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(m_PEntity));

	return STATESTATUS_START;
}

bool CMagicState::CanCastSpell(CSpell* PSpell, CBattleEntity* PTarget, uint8 flags)
{
	if(PSpell == nullptr) return false;

	if(!ValidCast(PSpell, PTarget))
	{
		return false;
	}

    if(m_PEntity->objtype == TYPE_PC)
    {
        float distanceValue = distance(m_PEntity->loc.p, PTarget->loc.p);
        // pc has special messages
        if(distanceValue > 25)
        {
            PushError(MSGBASIC_TOO_FAR_AWAY, PSpell->getID(), 0, PTarget);
            return false;
        }
        else if(distanceValue > m_maxStartDistance)
        {
            PushError(MSGBASIC_OUT_OF_RANGE_UNABLE_CAST, PSpell->getID(), 0, PTarget);
            return false;
        }
    }
    else if(!m_PTargetFind->isWithinRange(&PTarget->loc.p, m_maxStartDistance)){
        return false;
    }

    // player specific
    if(m_PEntity->objtype == TYPE_PC && !ValidCharCast(PSpell))
    {
        return false;
    }


    int32 msgID = luautils::OnMagicCastingCheck(m_PEntity, PTarget, PSpell);
	if(msgID){
        PushError((MSGBASIC_ID)msgID, PSpell->getID(), 0, PTarget);
		return false;
	}

	return true;
}

bool CMagicState::IsInterrupted()
{
	return m_interruptSpell;
}

void CMagicState::ForceInterrupt()
{
	m_interruptSpell = true;
}

CSpell* CMagicState::GetSpell()
{
	return m_PSpell;
}

STATESTATUS CMagicState::Update(uint32 tick)
{
	if(CState::Update(tick) == STATESTATUS_ERROR || !CheckValidTarget(m_PTarget))
	{
		return STATESTATUS_ERROR;
	}

	if(m_startTime == 0) m_startTime = tick;

	if(tick - m_startTime >= m_castTime)
	{
		if(CheckInterrupt())
		{
			return STATESTATUS_INTERRUPT;
		}
		else
		{
			return STATESTATUS_FINISH;
		}
	}

	return STATESTATUS_TICK;
}

void CMagicState::Clear()
{
	CState::Clear();

	m_PSpell = nullptr;
	m_interruptSpell = false;
    m_startTime = 0;
}

uint32 CMagicState::CalculateCastTime(CSpell* PSpell)
{
    if(PSpell == nullptr)
    {
        return 0;
    }

    bool applyArts = true;
    uint32 base = PSpell->getCastTime();
    uint32 cast = base;

    if (PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ALACRITY))
        {
            uint16 bonus = 0;
            //Only apply Alacrity/celerity mod if the spell element matches the weather.
            if(battleutils::WeatherMatchesElement(battleutils::GetWeather(m_PEntity,false),PSpell->getElement()))
            {
                bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            }
            cast -= base * ((100 - (50 + bonus)) / 100.0f);
            applyArts = false;
        }
        else if (applyArts)
        {
            if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_DARK_ARTS) || m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_BLACK))
            {
                // Add any "Grimoire: Reduces spellcasting time" bonuses
                cast = cast * (1.0f + (m_PEntity->getMod(MOD_BLACK_MAGIC_CAST)+m_PEntity->getMod(MOD_GRIMOIRE_SPELLCASTING))/100.0f);
            }
            else
            {
                cast = cast * (1.0f + m_PEntity->getMod(MOD_BLACK_MAGIC_CAST)/100.0f);
            }
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_CELERITY))
        {
            uint16 bonus = 0;
            //Only apply Alacrity/celerity mod if the spell element matches the weather.
            if(battleutils::WeatherMatchesElement(battleutils::GetWeather(m_PEntity,false),PSpell->getElement()))
            {
                bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            }
            cast -= base * ((100 - (50 + bonus)) / 100.0f);
            applyArts = false;
        }
        else if (applyArts)
        {
            if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_LIGHT_ARTS) || m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_WHITE))
            {
                // Add any "Grimoire: Reduces spellcasting time" bonuses
                cast = cast * (1.0f + (m_PEntity->getMod(MOD_WHITE_MAGIC_CAST)+m_PEntity->getMod(MOD_GRIMOIRE_SPELLCASTING))/100.0f);
            }
            else
            {
                cast = cast * (1.0f + m_PEntity->getMod(MOD_WHITE_MAGIC_CAST)/100.0f);
            }
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_SONG)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_PIANISSIMO))
        {
            if (PSpell->getAOE() == SPELLAOE_PIANISSIMO)
            {
                cast = base / 2;
            }
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_NIGHTINGALE))
        {
            if (m_PEntity->objtype == TYPE_PC &&
                dsprand::GetRandomNumber(100) < ((CCharEntity*)m_PEntity)->PMeritPoints->GetMeritValue(MERIT_NIGHTINGALE, (CCharEntity*)m_PEntity) - 25)
            {
                return 0;
            }
            cast = cast * 0.5f;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_TROUBADOUR))
        {
            cast = cast * 1.5f;
        }
        uint16 songcasting = m_PEntity->getMod(MOD_SONG_SPELLCASTING_TIME);
        cast = cast * (1.0f - ((songcasting > 50 ? 50 : songcasting) / 100.0f));
    }

    int16 fastCast = dsp_cap(m_PEntity->getMod(MOD_FASTCAST), -100, 50);
    if (PSpell->isCure()) // Cure cast time reductions
    {
        fastCast += m_PEntity->getMod(MOD_CURE_CAST_TIME);
        if (m_PEntity->objtype == TYPE_PC)
        {
            fastCast += ((CCharEntity*)m_PEntity)->PMeritPoints->GetMeritValue(MERIT_CURE_CAST_TIME, (CCharEntity*)m_PEntity);
        }
        fastCast = dsp_cap(fastCast, -100, 80);
    }
    int16 uncappedFastCast = dsp_cap(m_PEntity->getMod(MOD_UFASTCAST), -100, 100);
    float sumFastCast = dsp_cap(fastCast + uncappedFastCast, -100, 100);

    return cast * ((100.0f - sumFastCast)/100.0f);
}

int16 CMagicState::CalculateMPCost(CSpell* PSpell)
{
    if(PSpell == nullptr)
    {
        ShowWarning("CMagicState::CalculateMPCost Spell is NULL\n");
        return 0;
    }

    // ninja tools or bard song
    if(!PSpell->hasMPCost())
    {
        return 0;
    }

    bool applyArts = true;
    uint16 base = PSpell->getMPCost();
    if (PSpell->getID() == 478 || PSpell->getID() == 502) //Embrava/Kaustra
    {
        base = m_PEntity->health.maxmp * 0.2;
    }

    int16 cost = base;

    if (PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        if (PSpell->getAOE() == SPELLAOE_RADIAL_MANI && m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANIFESTATION))
        {
            cost *= 2;
            applyArts = false;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_PARSIMONY))
        {
            cost /= 2;
            applyArts = false;
        }
        else if (applyArts)
        {
            cost += base * (m_PEntity->getMod(MOD_BLACK_MAGIC_COST)/100.0f);
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        if (PSpell->getAOE() == SPELLAOE_RADIAL_ACCE && m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ACCESSION))
        {
            cost *= 2;
            applyArts = false;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_PENURY))
        {
            cost /= 2;
            applyArts = false;
        }
        else if (applyArts)
        {
            cost += base * (m_PEntity->getMod(MOD_WHITE_MAGIC_COST)/100.0f);
        }
    }
    if (dsprand::GetRandomNumber(100) < (m_PEntity->getMod(MOD_NO_SPELL_MP_DEPLETION)))
    {
        cost = 0;
    }
    return dsp_cap(cost, 0, 9999);
}

uint32 CMagicState::CalculateRecastTime(CSpell* PSpell)
{
    if(PSpell == nullptr)
    {
        return 0;
    }

    bool applyArts = true;
    uint32 base = PSpell->getRecastTime();
    uint32 recast = base;

    //apply Fast Cast
    recast *= ((100.0f-dsp_cap((float)m_PEntity->getMod(MOD_FASTCAST)/2.0f,0.0f,25.0f))/100.0f);

    int16 haste = m_PEntity->getMod(MOD_HASTE_MAGIC) + m_PEntity->getMod(MOD_HASTE_GEAR);

    recast *= ((float)(1024-haste)/1024);

    recast = dsp_max(recast, base * 0.2f);

    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_COMPOSURE))
    {
        recast *= 1.25;
    }

    if (PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        if (PSpell->getAOE() == SPELLAOE_RADIAL_MANI && m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANIFESTATION))
        {
            if (m_PEntity->GetMJob() == JOB_SCH)
            {
                recast *= 2;
            }
            else
            {
                recast *= 3;
            }
            applyArts = false;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ALACRITY))
        {
            uint16 bonus = 0;
            //Only apply Alacrity/celerity mod if the spell element matches the weather.
            if (battleutils::WeatherMatchesElement(battleutils::GetWeather(m_PEntity,false), PSpell->getElement()))
            {
                bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            }
            recast *=  ((50 - bonus) / 100.0f);

            applyArts = false;
        }
        if (applyArts)
        {
            if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_DARK_ARTS) || m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_BLACK))
            {
                // Add any "Grimoire: Reduces spellcasting time" bonuses
                recast *= (1.0f + (m_PEntity->getMod(MOD_BLACK_MAGIC_RECAST)+m_PEntity->getMod(MOD_GRIMOIRE_SPELLCASTING))/100.0f);
            }
            else
            {
                recast *= (1.0f + m_PEntity->getMod(MOD_BLACK_MAGIC_RECAST)/100.0f);
            }
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        if (PSpell->getAOE() == SPELLAOE_RADIAL_ACCE && m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ACCESSION))
        {
            if (m_PEntity->GetMJob() == JOB_SCH)
            {
                recast *= 2;
            }
            else
            {
                recast *= 3;
            }
            applyArts = false;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_CELERITY))
        {
            uint16 bonus = 0;
            //Only apply Alacrity/celerity mod if the spell element matches the weather.
            if (battleutils::WeatherMatchesElement(battleutils::GetWeather(m_PEntity, true), PSpell->getElement()))
            {
                bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            }
            recast *=  ((50 - bonus) / 100.0f);

            applyArts = false;
        }
        if (applyArts)
        {
            if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_LIGHT_ARTS) || m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ADDENDUM_WHITE))
            {
                // Add any "Grimoire: Reduces spellcasting time" bonuses
                recast *= (1.0f + (m_PEntity->getMod(MOD_WHITE_MAGIC_RECAST)+m_PEntity->getMod(MOD_GRIMOIRE_SPELLCASTING))/100.0f);
            }
            else
            {
                recast *= (1.0f + m_PEntity->getMod(MOD_WHITE_MAGIC_RECAST)/100.0f);
            }
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_SONG)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_NIGHTINGALE))
        {
            recast *= 0.5f;
        }
    }

    return recast/1000;
}

bool CMagicState::CheckInterrupt()
{
	if(m_interruptSpell)
	{
		PushMessage(MSGBASIC_IS_INTERRUPTED);
		return true;
	}

	if(!m_PTargetFind->isWithinRange(&m_PTarget->loc.p, m_maxFinishDistance))
    {
        PushError(MSGBASIC_OUT_OF_RANGE_UNABLE_CAST, m_PSpell->getID());
         return true;
    }

    // check if in same place
    if(m_PEntity->objtype == TYPE_PC && HasMoved())
    {
        PushError(MSGBASIC_IS_INTERRUPTED, m_PSpell->getID());
        return true;
    }

	if(!ValidCast(m_PSpell, m_PTarget))
	{
		return true;
	}

	if(battleutils::IsIntimidated(m_PEntity, m_PTarget))
	{
		PushMessage(MSGBASIC_IS_INTIMIDATED);
		return true;
	}

	if(battleutils::IsParalyzed(m_PEntity))
	{
		PushMessage(MSGBASIC_IS_PARALYZED);
		return true;
	}

	return false;
}

bool CMagicState::ValidCast(CSpell* PSpell, CBattleEntity* PTarget)
{
    if (!CheckValidTarget(PTarget))
    {
        PushError(MSGBASIC_CANNOT_ON_THAT_TARG, 0);
        return false;
    }

	if(!m_enableCasting ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
	{
        PushError(MSGBASIC_UNABLE_TO_CAST_SPELLS, PSpell->getID());
		return false;
	}

    if (PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
    {
        if(m_PEntity->objtype == TYPE_PC && !(m_flags & MAGICFLAGS_IGNORE_TOOLS) && !battleutils::HasNinjaTool(m_PEntity, PSpell, false))
        {
            PushError(MSGBASIC_NO_NINJA_TOOLS, PSpell->getID());
            return false;
        }
    }
    // check has mp available
    else if(!m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT) && !(m_flags & MAGICFLAGS_IGNORE_MP) && CalculateMPCost(PSpell) > m_PEntity->health.mp)
    {
        if(m_PEntity->objtype == TYPE_MOB && m_PEntity->health.maxmp == 0)
        {
            ShowWarning("CMagicState::ValidCast Mob (%u) tried to cast magic with no mp!\n", m_PEntity->id);
        }
        PushError(MSGBASIC_NOT_ENOUGH_MP, PSpell->getID());
        return false;
    }

    if (!spell::CanUseSpell(m_PEntity, PSpell->getID()))
    {
        PushError(MSGBASIC_CANNOT_CAST_SPELL, PSpell->getID());
        return false;
    }

    if(PTarget->isDead() && !(PSpell->getValidTarget() & TARGET_PLAYER_DEAD))
    {
        return false;
    }

    if(!PTarget->isDead() && (PSpell->getValidTarget() & TARGET_PLAYER_DEAD))
    {
        return false;
    }

	return true;
}

void CMagicState::InterruptSpell()
{
    DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
    DSP_DEBUG_BREAK_IF(m_PEntity->PBattleAI->GetCurrentAction() != ACTION_MAGIC_INTERRUPT);

    apAction_t action;
    action.ActionTarget = m_PEntity;
    action.reaction   = REACTION_NONE;
    action.speceffect = SPECEFFECT_NONE;
    action.animation  = m_PSpell->getAnimationID();
    action.param      = 0;
    action.messageID  = 0;

    m_PEntity->m_ActionList.clear();
    m_PEntity->m_ActionList.push_back(action);

    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(m_PEntity));
    Clear();
}

void CMagicState::FinishSpell()
{
    DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
	DSP_DEBUG_BREAK_IF(m_PEntity->PBattleAI->GetCurrentAction() != ACTION_MAGIC_FINISH);

	luautils::OnSpellPrecast(m_PEntity, m_PSpell);

	SpendCost(m_PSpell);
	SetRecast(m_PSpell);

	// remove effects based on spell cast first
    int16 effectFlags = EFFECTFLAG_INVISIBLE | EFFECTFLAG_MAGIC_BEGIN;

	if (m_PSpell->canTargetEnemy())
    {
    	effectFlags |= EFFECTFLAG_DETECTABLE;
    }

    m_PEntity->StatusEffectContainer->DelStatusEffectsByFlag(effectFlags);

    m_PTargetFind->reset();
    m_PEntity->m_ActionList.clear();

    // setup special targeting flags
    // can this spell target the dead?

    uint8 flags = FINDFLAGS_NONE;
	if (m_PSpell->getValidTarget() & TARGET_PLAYER_DEAD)
    {
        flags |= FINDFLAGS_DEAD;
    }
	if (m_PSpell->getFlag() & SPELLFLAG_HIT_ALL)
	{
		flags |= FINDFLAGS_HIT_ALL;
	}
	uint8 aoeType = battleutils::GetSpellAoEType(m_PEntity, m_PSpell);

	if (aoeType == SPELLAOE_RADIAL) {
		float distance = spell::GetSpellRadius(m_PSpell, m_PEntity);

        m_PTargetFind->findWithinArea(m_PTarget, AOERADIUS_TARGET, distance, flags);

    }
    else if (aoeType == SPELLAOE_CONAL)
    {
        //TODO: actual radius calculation
		float radius = spell::GetSpellRadius(m_PSpell, m_PEntity);

        m_PTargetFind->findWithinCone(m_PTarget, radius, 45, flags);
	}
	else
	{
		// only add target
		m_PTargetFind->findSingleTarget(m_PTarget, flags);
	}

    uint16 totalTargets = m_PTargetFind->m_targets.size();

	m_PSpell->setTotalTargets(totalTargets);

	apAction_t action;
	action.ActionTarget = m_PTarget;
	action.reaction   = REACTION_NONE;
	action.speceffect = SPECEFFECT_NONE;
	action.animation  = m_PSpell->getAnimationID();
	action.param      = 0;
	action.messageID  = 0;

	uint16 msg = 0;
    int16 ce = 0;
    int16 ve = 0;

	for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin() ; it != m_PTargetFind->m_targets.end(); ++it)
	{

        CBattleEntity* PTarget = *it;

        action.ActionTarget = PTarget;

		ce = m_PSpell->getCE();
		ve = m_PSpell->getVE();

        // take all shadows
		if (m_PSpell->canTargetEnemy() && aoeType > 0)
        {
        	PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
        	PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }

        // TODO: this is really hacky and should eventually be moved into lua
		if (m_PSpell->canHitShadow() && aoeType == SPELLAOE_NONE && battleutils::IsAbsorbByShadow(PTarget))
        {
        	// take shadow
        	msg = 31;
        	action.param = 1;
            ve = 0;
            ce = 0;
        }
        else
        {
			action.param = luautils::OnSpellCast(m_PEntity, PTarget, m_PSpell);

            // remove effects from damage
			if (m_PSpell->canTargetEnemy() && action.param > 0 && m_PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);

                // Check for bind breaking
                battleutils::BindBreakCheck(m_PEntity, PTarget);
            }

            if(msg == 0)
            {
				msg = m_PSpell->getMessage();
            }
            else
            {
				msg = m_PSpell->getAoEMessage();
            }

        }

        if (action.animation == 122 && msg == 283) // teleport spells don't target unqualified members
            continue;

        action.messageID = msg;

        if (PTarget->objtype == TYPE_MOB && msg != 31) // If message isn't the shadow loss message, because I had to move this outside of the above check for it.
        {
            luautils::OnMagicHit(m_PEntity, PTarget, m_PSpell);
        }

		if (m_PSpell->getID() != 305) //I hate to do this, but there really is no other spell like Odin
            CharOnTarget(&action, ce, ve);

        m_PEntity->m_ActionList.push_back(action);
    }

    CharAfterFinish();

    m_PEntity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END);

    DSP_DEBUG_BREAK_IF(m_PEntity->PBattleAI->GetCurrentAction() != ACTION_MAGIC_FINISH);
	m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(m_PEntity));

	Clear();
}

void CMagicState::CharOnTarget(apAction_t* action, int16 ce, int16 ve)
{
    if(m_PEntity->objtype != TYPE_PC)
    {
        return;
    }

    CBattleEntity* PTarget = action->ActionTarget;
    bool enmityApplied = false;

    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_TRANQUILITY) && m_PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        m_PEntity->addModifier(MOD_ENMITY, -m_PEntity->StatusEffectContainer->GetStatusEffect(EFFECT_TRANQUILITY)->GetPower());
    }
    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_EQUANIMITY) && m_PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        m_PEntity->addModifier(MOD_ENMITY, -m_PEntity->StatusEffectContainer->GetStatusEffect(EFFECT_EQUANIMITY)->GetPower());
    }

    if (PTarget->objtype == TYPE_MOB && PTarget->allegiance != m_PEntity->allegiance)
    {
        if (PTarget->isDead())
        {
            ((CMobEntity*)PTarget)->m_DropItemTime = m_PSpell->getAnimationTime();
        }

        if (!(m_PSpell->isHeal()) || m_PSpell->tookEffect())  //can't claim mob with cure unless it does damage
        {
            ((CMobEntity*)PTarget)->m_OwnerID.id = m_PEntity->id;
            ((CMobEntity*)PTarget)->m_OwnerID.targid = m_PEntity->targid;
            ((CMobEntity*)PTarget)->updatemask |= UPDATE_STATUS;
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmity(m_PEntity, ce, ve);
            enmityApplied = true;
        }
    }
    else if (PTarget->allegiance == m_PEntity->allegiance)
    {
        battleutils::GenerateInRangeEnmity(m_PEntity, ce, ve);
        enmityApplied = true;
    }

    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_TRANQUILITY) && m_PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        m_PEntity->delModifier(MOD_ENMITY, -m_PEntity->StatusEffectContainer->GetStatusEffect(EFFECT_TRANQUILITY)->GetPower());
        if (enmityApplied)
            m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_TRANQUILITY);
    }
    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_EQUANIMITY) && m_PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        m_PEntity->delModifier(MOD_ENMITY, -m_PEntity->StatusEffectContainer->GetStatusEffect(EFFECT_EQUANIMITY)->GetPower());
        if (enmityApplied)
            m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_EQUANIMITY);
    }

    if(action->param > 0 && m_PSpell->dealsDamage() && m_PSpell->getSpellGroup() == SPELLGROUP_BLUE &&
        m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_CHAIN_AFFINITY) && ((CBlueSpell*)m_PSpell)->getPrimarySkillchain() != 0)
    {

        SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, (CBlueSpell*)m_PSpell);
        if (effect != SUBEFFECT_NONE)
        {
            uint16 skillChainDamage = battleutils::TakeSkillchainDamage(m_PEntity, PTarget, action->param);


            action->addEffectParam = skillChainDamage;
            action->addEffectMessage = 287 + effect;
            action->additionalEffect = effect;

        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI) || m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
        {
            m_PEntity->health.tp = (m_PEntity->health.tp > 1000 ? m_PEntity->health.tp - 1000 : 0);
        }
        else
        {
            m_PEntity->health.tp = 0;
        }

        m_PEntity->StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHAIN_AFFINITY);
    }
}

void CMagicState::CharAfterFinish()
{
    if(m_PEntity->objtype != TYPE_PC)
    {
        return;
    }

    CCharEntity* PChar = (CCharEntity*)m_PEntity;

    charutils::RemoveStratagems(PChar, m_PSpell);

    charutils::UpdateHealth(PChar);

    // only skill up if the effect landed
    if(m_PSpell->tookEffect()){
        charutils::TrySkillUP(PChar, (SKILLTYPE)m_PSpell->getSkillType(), m_PTarget->GetMLevel());
        if (m_PSpell->getSkillType() == SKILL_SNG)
        {
            CItemWeapon* PItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
            if (PItem && PItem->isType(ITEM_ARMOR))
            {
				SKILLTYPE Skilltype = (SKILLTYPE)PItem->getSkillType();
				if (Skilltype == SKILL_STR || Skilltype == SKILL_WND || Skilltype == SKILL_SNG)
				{
					charutils::TrySkillUP(PChar, Skilltype, m_PTarget->GetMLevel());
				}
            }
        }
    }

    PChar->pushPacket(new CCharUpdatePacket(PChar));

    // make wyvern use breath
    if(PChar->PPet!=nullptr && ((CPetEntity*)PChar->PPet)->getPetType() == PETTYPE_WYVERN)
    {
        ((CAIPetDummy*)PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_HEALING_BREATH;
        PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
    }

    SetHiPCLvl(m_PTarget, PChar->GetMLevel());
}

bool CMagicState::TryHitInterrupt(CBattleEntity* PAttacker)
{

    if (!IsCasting() || IsInterrupted() || m_PSpell->getSpellGroup() == SPELLGROUP_SONG)
    {
    	return false;
    }

    if(battleutils::TryInterruptSpell(PAttacker, m_PEntity))
    {
        ForceInterrupt();
        return true;
    }

    return false;
}

bool CMagicState::IsCasting()
{
	return m_PSpell != nullptr;
}

bool CMagicState::ValidCharCast(CSpell* PSpell)
{
    CCharEntity* PChar = (CCharEntity*)m_PEntity;

    // has spell and can use it
    int16 spellID = PSpell->getID();

    if (!charutils::hasSpell(PChar, spellID) || !spell::CanUseSpell(PChar, spellID))
    {
        PushError(MSGBASIC_CANNOT_CAST_SPELL, spellID);
        return false;
    }

    // check recast
    if (PChar->PRecastContainer->Has(RECAST_MAGIC, spellID))
    {
        PushError(MSGBASIC_UNABLE_TO_CAST, spellID);
        return false;
    }

    // can use msic
    if (!m_PEntity->loc.zone->CanUseMisc(PSpell->getZoneMisc()))
    {
        PushError(MSGBASIC_CANNOT_USE_IN_AREA, spellID);
        return false;
    }

    // check summoning
    if (PSpell->getSpellGroup() == SPELLGROUP_SUMMONING && PChar->PPet != nullptr)
    {
        PushError(MSGBASIC_ALREADY_HAS_A_PET, spellID);
        return false;
    }

    return true;
}

void CMagicState::SpendCost(CSpell* PSpell)
{
    if(m_PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
    {
        if(!(m_flags & MAGICFLAGS_IGNORE_TOOLS))
        {
            // handle ninja tools
            battleutils::HasNinjaTool(m_PEntity, PSpell, true);
        }
    }
    else if (PSpell->hasMPCost() && !m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT) && !(m_flags & MAGICFLAGS_IGNORE_MP))
    {
        int16 cost = CalculateMPCost(PSpell);

        // conserve mp
        int16 rate = m_PEntity->getMod(MOD_CONSERVE_MP);

        if (dsprand::GetRandomNumber(100) < rate)
        {
            cost = ConserveMP(cost);
        }

        m_PEntity->addMP(-cost);
    }

}

int16 CMagicState::ConserveMP(int16 cost)
{
    return cost * (dsprand::GetRandomNumber(8.f,16.f) / 16.0f);
}

void CMagicState::SetRecast(CSpell* PSpell)
{

    // only applies to pcs
    if(m_PEntity->objtype != TYPE_PC)
    {
        return;
    }

    CCharEntity* PChar = (CCharEntity*)m_PEntity;

    uint32 RecastTime = 3;

    if (!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL) &&
		!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SPONTANEITY))
    {
        RecastTime = CalculateRecastTime(PSpell);
    }

    //needed so the client knows of the reduced recast time!
    PSpell->setModifiedRecast(RecastTime);
    PChar->PRecastContainer->Add(RECAST_MAGIC, PSpell->getID(), RecastTime);
}
