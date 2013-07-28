
#include "magic_state.h"
#include "../../entities/mobentity.h"
#include "../../lua/luautils.h"
#include "../../utils/battleutils.h"

#include "../../spell.h"

CMagicState::CMagicState(CBattleEntity* PEntity, CTargetFind* PTargetFind, float maxStartDistance, float maxFinishDistance)
: CState(PEntity, PTargetFind)
{
	m_PSpell = NULL;
	m_disableCasting = false;
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

	m_startTime = 0;
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
	if(PSpell == NULL) return false;

	if(!CheckValidTarget(PTarget)) return false;

	if(TooFar(&PTarget->loc.p, m_maxStartDistance)) return false;

    // player specific
    if(m_PEntity->objtype == TYPE_PC && !ValidCharCast(PSpell))
    {
        return false;
    }

	if(!ValidCast(PSpell))
	{
		return false;
	}

	if(luautils::OnMagicCastingCheck(m_PEntity, PTarget, PSpell) != 0){
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

	m_PSpell = NULL;
	m_interruptSpell = false;
}

uint32 CMagicState::CalculateCastTime(CSpell* PSpell)
{
    if(PSpell == NULL)
    {
        ShowWarning("CMagicState::CalculateCastTime Spell is NULL\n");
        return 0;
    }

    bool applyArts = true;
    uint32 base = PSpell->getCastTime();
    uint32 cast = base;

    if (PSpell->getSpellGroup() == SPELLGROUP_BLACK)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ALACRITY))
        {
            uint16 bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            cast -= base * ((100 - (50 + bonus)) / 100.0f);
            applyArts = false;
        }
        else if (applyArts)
        {
            cast = cast * (1.0f + m_PEntity->getMod(MOD_BLACK_MAGIC_CAST)/100.0f);
        }
    }
    else if (PSpell->getSpellGroup() == SPELLGROUP_WHITE)
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_CELERITY))
        {
            uint16 bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            cast -= base * ((100 - (50 + bonus)) / 100.0f);
            applyArts = false;
        }
        else if (applyArts)
        {
            cast = cast * (1.0f + m_PEntity->getMod(MOD_WHITE_MAGIC_CAST)/100.0f);
        }
    }

    int8 fastCast = dsp_cap(m_PEntity->getMod(MOD_FASTCAST),-100,50);
    int8 uncappedFastCast = dsp_cap(m_PEntity->getMod(MOD_UFASTCAST),-100,100);
    float sumFastCast = dsp_cap(fastCast + uncappedFastCast, -100, 100);

    return cast * ((100.0f - sumFastCast)/100.0f);
}

int16 CMagicState::CalculateMPCost(CSpell* PSpell)
{
    if(PSpell == NULL)
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
    return dsp_cap(cost, 0, 9999);
}

uint32 CMagicState::CalculateRecastTime(CSpell* PSpell)
{
    if(PSpell == NULL)
    {
        ShowWarning("CMagicState::CalculateRecastTime Spell is NULL\n");
        return 0;
    }

    bool applyArts = true;
    uint32 base = PSpell->getRecastTime();
    uint32 recast = base;
    uint8 applyHaste = 0;

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
            applyHaste++;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_ALACRITY))
        {
            uint16 bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            recast *=  ((50 + bonus) / 100.0f);

            applyArts = false;
            applyHaste++;
        }
        if (applyArts)
        {
            recast = recast * (1.0f + m_PEntity->getMod(MOD_BLACK_MAGIC_RECAST)/100.0f);
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
            applyHaste++;
        }
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_CELERITY))
        {
            uint16 bonus = m_PEntity->getMod(MOD_ALACRITY_CELERITY_EFFECT);
            recast *=  ((50 + bonus) / 100.0f);

            applyArts = false;
            applyHaste++;
        }
        if (applyArts)
        {
            recast = recast * (1.0f + m_PEntity->getMod(MOD_WHITE_MAGIC_RECAST)/100.0f);
        }
    }
    int16 haste = m_PEntity->getMod(MOD_HASTE_MAGIC) + m_PEntity->getMod(MOD_HASTE_GEAR);

    if ( haste < 0 || applyHaste == 0 || applyHaste == 2)
    {
        recast = recast * ((float)(1024-dsp_cap(haste,-1024,256))/1024);
    }
    return recast * ((100.0f-dsp_cap((float)m_PEntity->getMod(MOD_FASTCAST)/2.0f,0.0f,25.0f))/100.0f);
}

bool CMagicState::CheckInterrupt()
{
	if(m_interruptSpell)
	{
		PushMessage(MSGBASIC_IS_INTERRUPTED);
		return true;
	}

	if(TooFar(&m_PTarget->loc.p, m_maxFinishDistance)) return true;

	if(!ValidCast(m_PSpell))
	{
		return true;
	}

	if(battleutils::IsIntimidated(m_PEntity, m_PTarget))
	{
		PushMessage(MSGBASIC_IS_INTIMIDATED);
		return true;
	}

	if(battleutils::IsParalised(m_PEntity))
	{
		PushMessage(MSGBASIC_IS_PARALYZED);
		return true;
	}

	return false;
}

bool CMagicState::ValidCast(CSpell* PSpell)
{
	if(m_disableCasting ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
	{
		return false;
	}

    // check has mp available
    if(!m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT) && CalculateMPCost(PSpell) > m_PEntity->health.mp)
    {
        return false;
    }

	return true;
}

void CMagicState::InterruptSpell()
{

	apAction_t action;
	action.ActionTarget = m_PEntity;
	action.reaction   = REACTION_NONE;
	action.speceffect = SPECEFFECT_NONE;
	action.animation  = m_PSpell->getAnimationID();
	action.param	  = 0;
	action.messageID  = 0;

    m_PEntity->m_ActionList.clear();
	m_PEntity->m_ActionList.push_back(action);

	m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(m_PEntity));
	Clear();
}

void CMagicState::FinishSpell()
{
	DSP_DEBUG_BREAK_IF(m_PSpell == NULL);

    SpendCost(m_PSpell);

	// remove effects based on spell cast first
    int16 effectFlags = EFFECTFLAG_INVISIBLE;

    if(m_PSpell->canTargetEnemy())
    {
    	effectFlags |= EFFECTFLAG_DETECTABLE;
    }

    m_PEntity->StatusEffectContainer->DelStatusEffectsByFlag(effectFlags);
    m_PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

    m_PTargetFind->reset();
    m_PEntity->m_ActionList.clear();

    uint8 aoeType = battleutils::GetSpellAoEType(m_PEntity, m_PSpell);

	if (aoeType == SPELLAOE_RADIAL) {
		float distance = spell::GetSpellRadius(m_PSpell, m_PEntity);

        m_PTargetFind->findWithinArea(m_PTarget, AOERADIUS_TARGET, distance);

    }
    else if (aoeType == SPELLAOE_CONAL)
    {
        //TODO: actual radius calculation
        float radius = spell::GetSpellRadius(m_PSpell, m_PEntity);

        m_PTargetFind->findWithinCone(m_PTarget, radius, 45);
	}
	else
	{
		// only add target
		m_PTargetFind->findSingleTarget(m_PTarget);
	}

    uint16 actionsLength = m_PTargetFind->m_targets.size();

	m_PSpell->setTotalTargets(actionsLength);

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

		m_PSpell->resetMessage();
        ce = m_PSpell->getCE();
        ve = m_PSpell->getVE();

        // take all shadows
        if(m_PSpell->canTargetEnemy() && aoeType > 0)
        {
        	PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
        	PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }

        // TODO: this is really hacky and should eventually be moved into lua
        if(m_PSpell->canTargetEnemy() && aoeType == SPELLAOE_NONE && battleutils::IsAbsorbByShadow(PTarget))
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

	    action.messageID = msg;

        m_PEntity->m_ActionList.push_back(action);
    }

    m_PEntity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END);

	m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(m_PEntity));

	Clear();
}

bool CMagicState::TryHitInterrupt(CBattleEntity* PAttacker)
{

    if (!IsCasting() || IsInterrupted() || m_PSpell->getSpellGroup() == SPELLGROUP_SONG)
    {
    	return false;
    }

    return battleutils::TryInterruptSpell(PAttacker, m_PEntity);
}

bool CMagicState::IsCasting()
{
	return m_PSpell != NULL;
}

bool CMagicState::ValidCharCast(CSpell* SpendCost)
{

    // has spell and can use it

    // check recast

    // can use msic

    // check summoning

    // valid target

    // is owner

    // cannot cast magic on on battlefield targets

    // has tool
}

void CMagicState::SpendCost(CSpell* PSpell)
{

    if (PSpell->hasMPCost() && !m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
    {
        int16 cost = CalculateMPCost(PSpell);
        m_PEntity->addMP(-cost);
    }

    // handle ninja tools

}