/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CAIGENERAL_H
#define _CAIGENERAL_H

#include "../../common/cbasetypes.h"


enum ACTIONTYPE
{
	ACTION_NONE					= 0,
	ACTION_ATTACK				= 1,
	ACTION_RANGED_FINISH		= 2,
	ACTION_WEAPONSKILL_FINISH	= 3,
	ACTION_MAGIC_FINISH			= 4,
	ACTION_ITEM_FINISH			= 5,
	ACTION_JOBABILITY_FINISH	= 6,
	ACTION_WEAPONSKILL_START	= 7,
	ACTION_MAGIC_START			= 8,
	ACTION_ITEM_START			= 9,
	ACTION_JOBABILITY_START		= 10,
	ACTION_MOBABILITY_FINISH	= 11,
	ACTION_RANGED_START			= 12,
	ACTION_UNKNOWN_13			= 13,
	ACTION_DANCE				= 14,
	ACTION_UNKNOWN_15			= 15,
	ACTION_ROAMING,	
	ACTION_ENGAGE,
	ACTION_DISENGAGE,
	ACTION_CHANGE_BATTLE_TARGET,
	ACTION_FALL,
	ACTION_DROPITEMS,
	ACTION_DEATH,
	ACTION_FADE_OUT,
	ACTION_SPAWN,
	ACTION_ITEM_USING,
	ACTION_ITEM_INTERRUPT,
	ACTION_MAGIC_CASTING,
	ACTION_MAGIC_INTERRUPT,
	ACTION_RANGED_INTERRUPT
};

/************************************************************************
*																		*
*  Данную конструкцию нельзя использовать напрямую, только из потомков	*
*																		*
************************************************************************/

class CZone;
class CSpell;
class CItemUsable;
class CBattleEntity;
class CAbility;
class CWeaponSkill;
class CMobSkill;
class CAIGeneral
{
public:

	ACTIONTYPE		GetCurrentAction();
	CSpell*			GetCurrentSpell();
	CBattleEntity*	GetBattleTarget();
	CAbility*		GetCurrentJobAbility();
	CWeaponSkill*	GetCurrentWeaponSkill();
	CMobSkill*		GetCurrentMobSkill();


	void			SetCurrentSpell(uint16 SpellID);
	void			SetCurrentWeaponSkill(uint16 WSkillID);
	void			SetCurrentJobAbility(uint16 JobAbilityID);
	void			SetCurrentMobSkill(uint16 SkillID);
	void			SetCurrentZone(CZone* Zone);
	void			SetLastActionTime(uint32 time);
	void			SetCurrentAction(ACTIONTYPE Action, uint16 TargetID = 0);

	virtual void	CheckCurrentAction(uint32 tick) = 0;

	CAIGeneral();
	virtual ~CAIGeneral() {};

protected:

	ACTIONTYPE		m_ActionType;			// текущее действие (состояние)
	uint16			m_ActionTargetID;		// дополнительная цель, участвующая в действии
	uint32			m_LastActionTime;		// время начала любого действия
	uint32			m_Tick;					// текущее значение времени

	CZone*			m_PZone;				// указатель на зону, в которой находится сущность
	CSpell*			m_PSpell;				// читаемое заклинание
	CItemUsable*	m_PItemUsable;			// используемый предмет
	CBattleEntity*	m_PBattleTarget;		// боевая цель - основная
	CBattleEntity*	m_PBattleSubTarget;		// боевая цель - дополнительная
	CWeaponSkill*   m_PWeaponSkill;
	CAbility*		m_PJobAbility;
	CMobSkill*		m_PMobSkill;
};

#endif