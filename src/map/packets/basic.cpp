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
#include <string.h>

#include "basic.h"


/************************************************************************
*																		*
*  Инициализация всех пакетов. Обнуляем данные, избавляя разработчиков	*
*  от использования этой строчки в каждом пакете.						*
*																		*
************************************************************************/

CBasicPacket::CBasicPacket() 
{
	this->type = 0;
	this->size = 0;
	this->code = 0;

	memset(data, 0, sizeof(data));
}

CBasicPacket::~CBasicPacket()
{

}

/************************************************************************
*																		*
*  Возвращаем реальный размер пакета, который может быть только четным,	*
*  т.к. первый бит зарезервирован для type								*
*																		*
************************************************************************/

uint8 CBasicPacket::getSize() 
{
	return (this->size & 0xFE);
}

uint8 CBasicPacket::getType() 
{
	return this->type;
}

void CBasicPacket::setCode(uint16 code)
{
	this->code = code;
}
