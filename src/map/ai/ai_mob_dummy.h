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

#ifndef _CAIMOBDUMMY_H
#define _CAIMOBDUMMY_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#include <vector>

#include "../battleentity.h"
#include "ai_general.h"

/************************************************************************
*																		*
*  Первая версия поведения монстров, базовая. Монстры наносят только	*
*  физический урон														*
*																		*
************************************************************************/

enum AOERANGE
{
    AOE_PARTY  = 0x01,
    AOE_ALLIANCE = 0x02,
    AOE_ZONE   = 0x04
};

class CMobEntity;

class CAIMobDummy : public CAIGeneral
{
public:

	virtual void CheckCurrentAction(uint32 tick);

	CAIMobDummy(CMobEntity* PMob);

protected:

	CMobEntity* m_PMob;
  bool m_firstSpell;
  uint32 m_LastRangedTime;
  uint32 m_LastWaitTime;
  uint32 m_WaitTime;
  uint8 m_skillTP;

	void ActionRoaming();
	void ActionEngage();
	void ActionDisengage();

	void ActionFall();
	void ActionDropItems();
	void ActionDeath();
	void ActionFadeOut();
	void ActionSpawn();

	void ActionAbilityStart();
	void ActionAbilityUsing();
	void ActionAbilityFinish();
    void ActionAbilityInterrupt();

	void ActionAttack();
    void ActionSleep();
    void ActionWait();

	void ActionMagicStart();
	void ActionMagicCasting();
	void ActionMagicInterrupt();
    void ActionMagicFinish();

    void ActionRangedAttack();

	void processTwoHour();
    bool TryCastSpell(); // logic for spell casting, returns true if found one to cast
    void CastSpell(uint16 spellId);

    std::vector<CBattleEntity*> GetAdditionalTargets(AOERANGE AoeRange, position_t radiusAround, float radius);

private:

};

#endif