
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
	CalculateCastTime();

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

	if(!ValidCast())
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

void CMagicState::CalculateCastTime()
{
    int8 fastCast = dsp_cap(m_PEntity->getMod(MOD_FASTCAST),-100,50);
    int8 uncappedFastCast = dsp_cap(m_PEntity->getMod(MOD_UFASTCAST),-100,100);
    float sumFastCast = dsp_cap(fastCast + uncappedFastCast, -100, 100);

	m_castTime = m_PSpell->getCastTime()*((100.0f - sumFastCast)/100.0f);
}

bool CMagicState::CheckInterrupt()
{
	if(m_interruptSpell)
	{
		PushMessage(MSGBASIC_IS_INTERRUPTED);
		return true;
	}

	if(TooFar(&m_PTarget->loc.p, m_maxFinishDistance)) return true;

	if(!ValidCast())
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

bool CMagicState::ValidCast()
{
	if(m_disableCasting ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
		m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
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