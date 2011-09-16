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

#ifndef _CAIPETDUMMY_H
#define _CAIPETDUMMY_H

#include "../../common/cbasetypes.h"

#include "ai_general.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CPetEntity;

class CAIPetDummy : public CAIGeneral
{
public:

	virtual void CheckCurrentAction(uint32 tick);

	CAIPetDummy(CPetEntity* PPet);
	virtual ~CAIPetDummy() {}; 

protected:

	CPetEntity* m_PPet;

	void ActionRoaming();
	void ActionDeath();
	void ActionSpawn();
};

#endif