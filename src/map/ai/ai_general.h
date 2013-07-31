/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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
#include "../packets/weather.h"
#include "helpers/targetfind.h"
#include "helpers/pathfind.h"
#include "states/magic_state.h"

enum MASTERCOMMAND //master as in pet's master
{
	MASTERCOMMAND_NONE = 0,
	MASTERCOMMAND_ELEMENTAL_BREATH = 1,
	MASTERCOMMAND_HEALING_BREATH = 2,
	MASTERCOMMAND_SIC = 3
};

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
	ACTION_RAISE_MENU_SELECTION	= 13,
	ACTION_DANCE				= 14,
	ACTION_UNKNOWN_15			= 15,
	ACTION_ROAMING,
	ACTION_ENGAGE,
	ACTION_DISENGAGE,
	ACTION_CHANGE_TARGET,
	ACTION_FALL,
	ACTION_DROPITEMS,
	ACTION_DEATH,
	ACTION_FADE_OUT,
	ACTION_DESPAWN,
	ACTION_SPAWN,
    ACTION_STUN,
    ACTION_SLEEP,
	ACTION_ITEM_USING,
	ACTION_ITEM_INTERRUPT,
	ACTION_MAGIC_CASTING,
	ACTION_MAGIC_INTERRUPT,
    ACTION_RANGED_INTERRUPT,
    ACTION_MOBABILITY_START,
    ACTION_MOBABILITY_USING,
    ACTION_MOBABILITY_INTERRUPT,
    ACTION_LEAVE
};

/************************************************************************
*																		*
*  Данную конструкцию нельзя использовать напрямую, только из потомков	*
*																		*
************************************************************************/

class CSpell;
class CItemUsable;
class CBattleEntity;
class CAbility;
class CWeaponSkill;
class CMobSkill;

class CAIGeneral
{
public:

    void            Reset();

	ACTIONTYPE		GetCurrentAction();
	CSpell*			GetCurrentSpell();
	CBattleEntity*	GetBattleTarget();
	CBattleEntity*  GetBattleSubTarget();
	CAbility*		GetCurrentJobAbility();
	CWeaponSkill*	GetCurrentWeaponSkill();
	CMobSkill*		GetCurrentMobSkill();
	uint16			GetLastCorsairRoll();
	bool			GetAutoAttackEnabled();
	bool			GetMagicCastingEnabled();
    bool            GetMobAbilityEnabled();
    bool            MoveTo(position_t* pos); // move entity to position. Doesn't pathfind
    void			Wait(int32 waitTime);

    uint32          GetBattleTime();

	void			SetBattleTarget(CBattleEntity* PEntity); //used for pets mainly
	void			SetBattleSubTarget(CBattleEntity* PEntity); //used for pets mainly
	void			SetCurrentSpell(uint16 SpellID);
	void			SetCurrentWeaponSkill(uint16 WSkillID);
	void			SetCurrentJobAbility(uint16 JobAbilityID);
	void			SetCurrentMobSkill(CMobSkill* skill); // DEBUG
    void            SetLastActionTime(uint32 time);
	void			SetLastMagicTime(uint32 time);
	void			SetCurrentAction(ACTIONTYPE Action, uint16 TargetID = 0);
	void			SetLastCorsairRoll(uint16 ability);
	void			SetAutoAttackEnabled(bool enabled);
	void			SetMagicCastingEnabled(bool enabled);
	void			SetMobAbilityEnabled(bool enabled);

	virtual void	CheckCurrentAction(uint32 tick) = 0;
	virtual void	WeatherChange(WEATHER weather, uint8 element) = 0;

    CAIGeneral();
	~CAIGeneral();

    CPathFind*       m_PPathFind; // finds paths
    bool			 m_interruptSpell; // forces interrupt of current spell being cast

    // states
    CMagicState*     m_PMagicState;

private:

    //uint32			m_StartBattle;			// Battle start time

protected:

	virtual void			TransitionBack(bool skipWait) = 0; // transition back to correct state (usually attack or roaming)

	ACTIONTYPE		m_ActionType;			// текущее действие (состояние)
	uint16			m_ActionTargetID;		// дополнительная цель, участвующая в действии
	uint32			m_LastActionTime;		// время начала любого действия
	uint32			m_LastMeleeTime;		// Last time melee hit occurred
	uint32			m_LastMagicTime;		// Last time magic spell was -attempted-
    uint32			m_Tick;					// текущее значение времени
    uint32			m_StartBattle;			// Battle start time
	uint16			m_CorsairDoubleUp;		// Last used corsair roll eligible for DU
	bool			m_AutoAttackEnabled;    // Flag to enable/disable auto attack
	bool			m_MobAbilityEnabled;		// Flag to enable/disable mob skills

	CSpell*			m_PSpell;				// читаемое заклинание
	CItemUsable*	m_PItemUsable;			// используемый предмет
	CBattleEntity*	m_PBattleTarget;		// боевая цель - основная
	CBattleEntity*	m_PBattleSubTarget;		// боевая цель - дополнительная
	CWeaponSkill*   m_PWeaponSkill;
	CAbility*		m_PJobAbility;
	CMobSkill*		m_PMobSkill;
    CTargetFind*  m_PTargetFind; // finds targets for AoEs

	uint32 m_WaitTime;
	uint32 m_LastWaitTime;

};

#endif
