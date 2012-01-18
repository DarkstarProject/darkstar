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

#ifndef _CITEMARMOR_H
#define _CITEMARMOR_H

#include "../../common/cbasetypes.h"

#include <vector>

#include "item_usable.h"

#include "../modifier.h"
#include "../status_effect.h"

// типы событий, в которых участвует логика предмета

enum SCRIPTTYPE : uint16
{
	SCRIPT_NONE			= 0x0000,
	SCRIPT_EQUIP		= 0x0001,
	SCRIPT_CHANGESJOB	= 0x0002,
	SCRIPT_CHANGEZONE	= 0x0004,
	SCRIPT_TIME_DAWN	= 0x0008,
	SCRIPT_TIME_DAY		= 0x0010,
	SCRIPT_TIME_DUSK	= 0x0020,
	SCRIPT_TIME_EVENING	= 0x0040
	//...
};


class CItemArmor : public CItemUsable
{
public:

	CItemArmor(uint16);
	virtual ~CItemArmor();

	uint8	getReqLvl();
	uint32	getJobs();
	uint16	getModelId();
	uint16	getScriptType();
	uint8	getShieldSize();
	uint16	getEquipSlotId();
	uint8	getRemoveSlotId();

	void	setReqLvl(uint8 lvl);
	void	setJobs(uint32 jobs);
	void	setModelId(uint16 mdl);
	void	setShieldSize(uint8 shield);
	void	setScriptType(uint16 isScripted);
	void	setEquipSlotId(uint16 equipSlot);
	void	setRemoveSlotId(uint8 removSlot);

	std::vector<CModifier*> modList;			// список модификаторов
	
private:

	uint8	m_reqLvl;
	uint32  m_jobs;
	uint16	m_modelID;
	uint16	m_scriptType;
	uint8	m_shieldSize;
	uint16	m_equipSlotID;
	uint8	m_removeSlotID;
};

#endif