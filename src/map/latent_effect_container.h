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

#ifndef _LATENTEFFECTCONTAINER_H
#define _LATENTEFFECTCONTAINER_H

#include "../common/cbasetypes.h"
#include "../common/taskmgr.h"

#include "latent_effect.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CBattleEntity;

class CLatentEffectContainer
{
public:

	void CheckLatentsHP();
	void CheckLatentsTP();
	void CheckLatentsMP();
	void CheckLatentsSubjob(uint8 jobId);
	void CheckLatentsWeaponDraw(bool drawn);
	void CheckLatentsStatusEffect();
	void CheckLatentsRollSong();
	void CheckLatentsDay();
	void CheckLatentsPartyMembers(uint8 members);
	void CheckLatentsPartyAvatar();
	void CheckLatentsJobLevel();
	void CheckLatentsPetType();
	void CheckLatentsTime();

	void AddLatentEffect(CLatentEffect* LatentEffect);
	void DelLatentEffect(uint8 slot);   

    CLatentEffect* GetLatentEffect(uint8 slot, uint16 modId);

	 CLatentEffectContainer(CBattleEntity* PEntity);
	~CLatentEffectContainer();

private:

	CBattleEntity* m_POwner;

	std::vector<CLatentEffect*>	m_LatentEffectList;
};

#endif

