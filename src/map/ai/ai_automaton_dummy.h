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

#ifndef _CAIAUTODUMMY_H
#define _CAIAUTODUMMY_H

#include "../../common/cbasetypes.h"

#include "ai_pet_dummy.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CPetEntity;
class CAutomatonEntity;

class CAIAutomatonDummy : public CAIPetDummy
{
public:
    virtual void CheckCurrentAction(uint32 tick);

    CAIAutomatonDummy(CPetEntity* PPet);

protected:


private:
    CAutomatonEntity* m_PPet;

    uint32 m_magicRecast;
    uint32 m_magicEnfeebleRecast;
    uint32 m_magicElementalRecast;
    uint32 m_magicHealRecast;
    uint32 m_magicEnhanceRecast;
    uint32 m_magicStatusRecast;

    uint32 m_LastRangedTime;

    void ActionFall();
    void ActionAttack();

    bool CheckSpellcast();
    bool CheckTPMove();
    bool CheckRangedAttack();

    virtual void TransitionBack(bool skipWait = false) override;

};

#endif
