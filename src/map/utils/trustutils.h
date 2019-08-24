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

#ifndef _ITRUSTUTILS_H
#define _ITRUSTUTILS_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"


class CBattleEntity;
class CPetEntity;
class CTrustEntity;
class CCharEntity;

namespace trustutils
{
	void LoadTrustList();
	void FreeTrustList();

    bool isValidSelfTargetWeaponskill(int wsid);
    bool HasTrust(CCharEntity * PMaster, uint32 TrustID);
    void SpawnTrust(CCharEntity * PMaster, uint32 TrustID);
    void DespawnTrust(CBattleEntity* PMaster, CTrustEntity* PMob);
    int16 TrustCheck(CCharEntity * PMaster, uint32 TrustID);
    CTrustEntity* LoadTrust(CCharEntity* PMaster, uint32 TrustID);
    void GetAvailableSpells(CTrustEntity* PMob);
};

#endif
