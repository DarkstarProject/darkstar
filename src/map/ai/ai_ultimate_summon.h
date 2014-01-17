/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#ifndef _CAIULTIMATESUMMON_H
#define _CAIULTIMATESUMMON_H

#include "../../common/cbasetypes.h"

#include "ai_pet_dummy.h"
#include "ai_general.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CPetEntity;

class CAIUltimateSummon : public CAIPetDummy
{
public:

	virtual void CheckCurrentAction(uint32 tick);

    CAIUltimateSummon(CPetEntity* PPet);

protected:
	virtual void TransitionBack(bool skipWait = false);

	void preparePetAbility(CBattleEntity* PTarg);
	void ActionRoaming();
	void ActionDisengage();
	void ActionEngage();
	void ActionAttack();
	void ActionSleep();
	void ActionFall();
	void ActionDeath();
	void ActionSpawn();
	void ActionAbilityStart();
	void ActionAbilityUsing();
	void ActionAbilityInterrupt();
	void ActionAbilityFinish();

	void ActionMagicStart();
	void ActionMagicCasting();
	void ActionMagicFinish();
	void ActionMagicInterrupt();

private:
    uint32 m_Timer;
};

#endif
