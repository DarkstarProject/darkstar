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

#ifndef _STATUSEFFECTCONTAINER_H
#define _STATUSEFFECTCONTAINER_H

#include "../common/cbasetypes.h"
#include "../common/taskmgr.h"

#include "status_effect.h"

class CBattleEntity;

class CStatusEffectContainer
{
public:

	uint32	m_Flags;											// биты переполнения байтов m_StatusIcons	
	uint8	m_StatusIcons[32];									// иконки статус-эффектов

	void AddStatusEffect(CStatusEffect* StatusEffect);			
	bool DelStatusEffect(EFFECT StatusID);
	bool DelStatusEffect(EFFECT StatusID, uint16 SubID);
	
	bool HasStatusEffect(EFFECT StatusID, uint16 SubID = 0);	// проверяем наличие стату-эффекта
	CStatusEffect* GetStatusEffect(EFFECT StatusID, uint16 SubID);
	bool EraseStatusEffect (bool RemoveAll = false);			// удаляем первый/все отрицательный эффект
	bool DispelStatusEffect(bool RemoveAll = false);			// удаляем первый/все положительный эффект

	void CheckEffects(uint32 tick);

	void LoadStatusEffects();									// загружаем эффекты персонажа
	void SaveStatusEffects();									// сохраняем эффекты персонажа

	 CStatusEffectContainer(CBattleEntity* PEntity);
	~CStatusEffectContainer();

private:

	CBattleEntity* m_pOwner;

	void RemoveStatusEffect(uint32 id);							// удаляем эффект по его номеру в контейнере

	void AddStatusIcon(EFFECT StatusID);
	void DelStatusIcon(EFFECT StatusID);

	void SetEffectName(CStatusEffect* StatusEffect);			// устанавливаем имя эффекта

	uint32 m_EffectCheckTime;

	// TODO: протестировать возможность замены vector на статический массив из 32 элементов

	std::vector<CStatusEffect*>	m_StatusEffectList;
};

#endif

