/*
===========================================================================

  Copyright (c) 2018 Darkstar Dev Teams

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

#ifndef _CTRUSTENTITY_H
#define _CTRUSTENTITY_H

#include "mobentity.h"

class CCharEntity;
class CTrustEntity : public CMobEntity
{
public:
    CTrustEntity(CCharEntity*);
	~CTrustEntity();
	uint8 m_Element;
	uint32 m_PetID;

    virtual void PostTick() override;
    virtual void FadeOut() override;
    virtual void Die() override;
    virtual void Spawn() override;
    virtual bool ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags) override;
};

#endif
