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

#ifndef _CLUABASEENTITY_H
#define _CLUABASEENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"
#include "../charentity.h"

class CBaseEntity;

class CLuaBaseEntity
{
	CBaseEntity* m_PBaseEntity;
public:

	static const int8 className[];
	static Lunar<CLuaBaseEntity>::Register_t methods[];

	CLuaBaseEntity(lua_State*);
	CLuaBaseEntity(CBaseEntity*);

	CBaseEntity* GetBaseEntity()const
	{
		return m_PBaseEntity;
	}

	int32 warp(lua_State*);					// отправляет персонажа к его точке возрождения
	int32 leavegame(lua_State*);			// персонаж покидает игру

	int32 getHP(lua_State*);				// получаем текущее количество очков жизней
	int32 addHP(lua_State*);				// добавляем очки жизней
	int32 delHP(lua_State*);				// удаляем очки жизней
	int32 setHP(lua_State*);				// устанавливаем количество очков жизней
	int32 getMP(lua_State*);				// получаем текущее количество очков маны
	int32 addMP(lua_State*);				// добавляем очки маны
	int32 delMP(lua_State*);				// удаляем очки маны
	int32 setMP(lua_State*);				// устанавливаем количество очков маны
	int32 getTP(lua_State*);				// получаем текущее количество тактических очков
	int32 addTP(lua_State*);				// добавляем тактические очки
	int32 delTP(lua_State*);				// удаляем тактические очки
	int32 setTP(lua_State*);				// устанавливаем текущее количество тактических очков

	int32 getMaxHP(lua_State*);				// получаем максимальное количество очков жизней
	int32 getMaxMP(lua_State*);				// получаем максимальное количесвто очнов маны
	
	int32 getXPos(lua_State*);				// получение позиции по X координате
	int32 getYPos(lua_State*);				// получение позиции по Y координате ("высота над уровнем моря")
	int32 getZPos(lua_State*);				// получение позиции по Z координате
	int32 getZone(lua_State*);				// получение значения текущей зоны
	int32 setPos(lua_State*);				// устанавка позиции

	int32 getAnimation(lua_State*);			// получаем анимацию сущности
	int32 setAnimation(lua_State*);			// устанавливаем анимацию сущности

	int32 addItem(lua_State*);				// добавляем предмет в инвентарь персонажа
	int32 hasItem(lua_State*);				// проверяем наличие предмета в выбранном хранилище
	int32 getFreeSlotsCount(lua_State*);	// получаем количество свободных ячеек в хранилище
	int32 getRace(lua_State*);				// получение расы персонажа
	int32 getNation(lua_State*);			// получение нации персонажа

	int32 addQuest(lua_State*);				// добавление квеста
	int32 delQuest(lua_State*);				// удаляем квест (метод, необходимый для отладки скриптов)
	int32 getQuestStatus(lua_State*);		// получение текущего состояния квеста
	int32 completeQuest(lua_State*);		// установка квеста в соостояние "завершен"

	int32 addMission(lua_State*);			// Add Mission
	int32 delMission(lua_State*);			// Delete Mission from Mission Log
	int32 hasCurrentMission(lua_State*);	// Checks to see if the user has accepted a mission
	int32 hasCompletedMission(lua_State*);	// Checks if mission has been completed
	int32 getCurrentMission(lua_State*);	// Gets the current mission
	int32 completeMission(lua_State*);		// Complete Mission

	int32 getRank(lua_State*);				// Get Current Rank
	int32 setRank(lua_State*);				// Set Rank
	
	int32 getRankPoints(lua_State*);		// Get Current Rank points	
	int32 setRankPoints(lua_State*);		// Set Current Rank points
	int32 addRankPoints(lua_State*);		// Add rank points to existing rank point total

	int32 addKeyItem(lua_State*);			// добавляем ключевой предмет
	int32 seenKeyItem(lua_State*);			// проверяем, было ли описание ключевого предмета прочитано
	int32 unseenKeyItem(lua_State*);		// Attempt to remove the keyitem from the seen list
	int32 hasKeyItem(lua_State*);			// проверяем наличие ключевого предмета
	int32 delKeyItem(lua_State*);			// удаляем ключевой предмет

	int32 addSpell(lua_State*);				// добавляем заклинание в список выученых
	int32 canLearnSpell(lua_State*);		// проверяем, может ли персонаж выучить заклинание (0 - может, остальные - код сообщения об ошибке)
	int32 delSpell(lua_State*);				// удаляем заклинание из списка выученых

	int32 getMainJob(lua_State*);			// получение основной профессии
	int32 getMainLvl(lua_State*);			// получение уровня основной профессии
	int32 getSubJob(lua_State*);			// получение дополнительной профессии
	int32 getSubLvl(lua_State*);			// получение уровня дополнительной профессии
	int32 unlockJob(lua_State*);			// разблокирование профессий и использования дополнительной профессии
	int32 levelRestriction(lua_State*);		// устанавливаем/узнаем временное ограничение уровня

	int32 showText(lua_State*);				// отображение текстовых диалогов без старта события
	int32 messageSpecial(lua_State*);		// отправляем персонажу специальное сообщение
	int32 messageSystem(lua_State*);		// отправляем персонажу системное сообщение

	int32 release(lua_State*);				// прерывание события
	int32 startEvent(lua_State*);			// запуск созданного события
	int32 updateEvent(lua_State*);			// обновление параметров события

	int32 sendMenu(lua_State*);				// отправляем персонажу меню (AH,Raise,Tractor,MH etc)
	int32 sendGuild(lua_State*);			// отправляем персонажу меню магазина гильдии

	int32 getVar(lua_State*);				// сохраняем временные переменные  
	int32 setVar(lua_State*);				// получаем значения временных переменных

	int32 setHomePoint(lua_State*);			// устанавливаем точку возрождения (home point) 
	int32 tradeComplete(lua_State*);		// завершаем обмен с npc

	int32 getTitle(lua_State*);				// получаем текущий титул пероснажа (title)
	int32 setTitle(lua_State*);				// устанавливаем текущий титул персонажа (title)

	int32 getGil(lua_State*);				// получаем текущее количество gil
	int32 addGil(lua_State*);				// добавляем количество gil
	int32 delGil(lua_State*);				// удаляем количество gil
	int32 setGil(lua_State*);				// устанавливаем количество gil

	int32 getEquipID(lua_State*);			// получаем ID экипированного предмета в указанной ячейке

	int32 createShop(lua_State*);			// подготавливаем контейнер для работы магазина
	int32 addShopItem(lua_State*);			// добавляем предмет в контейнер (на прилавок магазина ^^) максимум 16 предметов

	int32 getFame(lua_State*);				// получаем известность персонажа
	int32 setFame(lua_State*);				// устанавливаем известность персонажа
	int32 addFame(lua_State*);				// увеличиваем известность персонажа
	int32 getFameLevel(lua_State*);			// получаем уровень известности персонажа

	int32 setStatus(lua_State*);			// устанавливаем статус сущности (с ним нужно быть аккурантее, изменения могут привести к неожиданным результатам)

	int32 sendRaise(lua_State*);			// send raise request to char
	int32 sendTractor(lua_State*);			// send tractor request to char

	int32 updateEnmity(lua_State*);			// обновляем ненависть монстров к указанной цели

	int32 addStatusEffect(lua_State*);		// добавляем статус эффект
	int32 hasStatusEffect(lua_State*);		// проверяем наличие статус эффекта
	int32 delStatusEffect(lua_State*);		// удаляем статус эффект
	int32 eraseStatusEffect(lua_State*);	// удаляем первый отрицательный эффект
	int32 dispelStatusEffect(lua_State*);	// удаляем первый положительный эффект
	int32 addPartyEffect(lua_State*);		// Adds Effect to all party members
	int32 removePartyEffect(lua_State*);	// Removes Effect from all party members



	int32 addMod(lua_State*);				// дабавляем модификатор
	int32 getMod(lua_State*);				// получаем значение модификатора
	int32 delMod(lua_State*);				// удаляем модификатор

	int32 addExp(lua_State*);				// добавляем персонажу опыт (других функций для работы с опытом не будет)

	int32 spawnPet(lua_State*);				// призыв питомца
	int32 despawnPet(lua_State*);			// освобождение питомца

	int32 needToZone(lua_State*);			// проверяем, покидал ли персонаж зону после поднятия флага необходимости ее покинуть

	int32 showPosition(lua_State*);			// отображаем местоположение персонажа
	int32 injectPacket(lua_State*);			// отправляем персонажу пакет, сохраненный в файле (функция необходима на этапе разработки)
	
	int32 getContainerSize(lua_State*);     // Gets the current capacity of a container
	int32 increaseContainerSize(lua_State*);// Increase container size
	int32 decreaseContainerSize(lua_State*);// Decreases a containers size -- Should be used for testing only

	int32 sendToJail(lua_State*); 

	void UpdateHealth(CCharEntity* PChar, CZone* PZone);
};

#endif