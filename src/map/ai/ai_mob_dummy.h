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

#ifndef _CAIMOBDUMMY_H
#define _CAIMOBDUMMY_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#include <vector>

#include "../entities/battleentity.h"
#include "ai_general.h"

#define MOB_SPELL_MAX_RANGE 26.8f

// mobs will deaggro if player is out of range for this long
#define MOB_DEAGGRO_TIME 25000

// cool down time after attempting a mob skill or
// after using one
#define MOB_SKILL_COOL 4000

// time a mob is neutral after disengaging
#define MOB_NEUTRAL_TIME 10000

/************************************************************************
*																		*
*  Первая версия поведения монстров, базовая. Монстры наносят только	*
*  физический урон														*
*																		*
************************************************************************/

class CMobEntity;

class CAIMobDummy : public CAIGeneral
{
public:

	virtual void CheckCurrentAction(uint32 tick);

	CAIMobDummy(CMobEntity* PMob);

	virtual void WeatherChange(WEATHER weather, uint8 element);

    // checks if the given target can be aggroed by this mob
    bool CanAggroTarget(CBattleEntity* PTarget);

    void setMobSkillAttack(bool);
    bool getMobSkillAttack();

    bool isActionQueueAttack();
	void Stun(uint32 stunTime);

    // time of day change, update mobs
    // TODO:
    //void TOTDChange();


protected:

	virtual void TransitionBack(bool skipWait = false);

	CMobEntity* m_PMob;
	CMobSkill* m_PSpecialSkill;
	bool m_firstSpell;
	bool m_checkDespawn; // check and despawn if i'm too far from spawn
	uint32 m_SpawnTime;
	uint32 m_LastSpecialTime;
	uint32 m_LastMobSkillTime;
	uint32 m_LastStunTime;
	uint32 m_StunTime;
	uint32 m_DeaggroTime;
	uint32 m_NeutralTime;
	int16 m_skillTP;
	bool m_drawnIn;
	bool m_mobskillattack;
	bool m_actionqueueability;

	bool  m_CanStandback;
	uint32 m_LastStandbackTime;

	void ActionRoaming();
	void ActionEngage();
	void ActionDisengage();

	void ActionFall();
	void ActionDropItems();
	void ActionDeath();
	void ActionFadeOut();
	void ActionSpawn();

	// despawn and go to action none
	void ActionDespawn();

	void ActionAbilityStart();
	void ActionAbilityUsing();
	void ActionAbilityFinish();
	void ActionAbilityInterrupt();

	void ActionAttack();
	void FinishAttack();

	void ActionSleep();
	void ActionStun();

	void ActionMagicStart();
	void ActionMagicCasting();
	void ActionMagicInterrupt();
	void ActionMagicFinish();

	// use its special skill, ranged attack, catapult, jump etc
	void ActionSpecialSkill();

	// helper functions
	bool TryDeaggro();
	void TryLink();
	bool CanCastSpells();
        bool CanDetectTarget(CBattleEntity* PTarget, bool forceSight = false);
	bool TryCastSpell(); // logic for spell casting, returns true if found one to cast
	bool TrySpecialSkill();
	void CastSpell(uint16 spellId, CBattleEntity* PTarget = nullptr); // makes the mob cast a spell
	void SetupEngage(); // setup timers and trigger callbacks

	void FollowPath(); // continues moving

	void Deaggro(); // deaggro targe
	void OnTick();

private:

};

#endif
