
#include "state.h"
#include "../../entities/battleentity.h"
#include "../helpers/targetfind.h"
#include "../../entities/charentity.h"
#include "../../packets/action.h"

CState::CState(CBattleEntity* PEntity, CTargetFind* PTargetFind)
{
	DSP_DEBUG_BREAK_IF(PEntity == NULL);
	DSP_DEBUG_BREAK_IF(PTargetFind == NULL);
	m_PEntity = PEntity;
	m_PTargetFind = PTargetFind;
	m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE);

	Clear();
}

CState::~CState()
{

}

void CState::PushMessage(MSGBASIC_ID msgID, int32 param, int32 value, bool personal)
{
	if(personal && m_PEntity->objtype == TYPE_PC)
	{
		CCharEntity* PChar = (CCharEntity*)m_PEntity;

		PChar->pushPacket(new CMessageBasicPacket(PChar,m_PTarget,param,value,msgID));
	}
	else
	{
		m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PEntity,m_PTarget,param,value,msgID));
	}
}

STATESTATUS CState::Update(uint32 tick)
{
	if(m_PEntity->isDead())
	{
		return STATESTATUS_ERROR;
	}

	return STATESTATUS_TICK;
}

bool CState::CheckValidTarget(CBattleEntity* PTarget)
{
	if(PTarget == NULL)
	{
		ShowWarning("CState::CheckValidTarget Null target sent\n");
		return false;
	}

	return !(PTarget->isDead() || m_PEntity->loc.zone == NULL || PTarget->getZone() != m_PEntity->getZone());
}

void CState::Clear()
{
	m_flags = 0;
	m_PTarget = NULL;
}

CBattleEntity* CState::GetTarget()
{
	return m_PTarget;
}

bool CState::TooFar(position_t* point, float maxDistance)
{
	return distance(m_PEntity->loc.p, *point) > maxDistance;
}