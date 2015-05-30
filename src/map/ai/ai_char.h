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

#ifndef _AI_CHAR
#define _AI_CHAR

#include "ai_base.h"

class CAIChar : CAIBase
{
public:
    CAIChar(CBaseEntity* PEntity);
    ~CAIChar();
protected:

    // Inherited via CAIBase
    virtual bool MoveAction(aiEventMove*) override;
    virtual bool AttackAction(aiEventAttack*) override;
    virtual bool MagicStartAction(aiEventMagicStart*) override;
    virtual bool MagicFinishAction(aiEventMagicFinish*) override;
    virtual bool RangedStartAction(aiEventRangedStart*) override;
    virtual bool RangedFinishAction(aiEventRangedFinish*) override;
    virtual bool WeaponskillStartAction(aiEventWeaponskillStart*) override;
    virtual bool WeaponskillFinishAction(aiEventWeaponskillFinish*) override;
    virtual bool JobabilityStartAction(aiEventJobAbilityStart*) override;
    virtual bool JobabilityFinishAction(aiEventJobAbilityFinish*) override;
    virtual bool ItemStartAction(aiEventItemStart*) override;
    virtual bool ItemFinishAction(aiEventItemFinish*) override;

    CTargetFind m_TargetFind;
    CMagicState m_MagicState;

};

#endif
