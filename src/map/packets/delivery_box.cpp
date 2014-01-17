/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "../../common/socket.h"

#include "../utils/itemutils.h"

#include <string.h>

#include "delivery_box.h"


CDeliveryBoxPacket::CDeliveryBoxPacket(uint8 action, uint8 count) 
{
	this->type = 0x4B;
	this->size = 0x0A;

	memset(data, 0xFF, 12);

	WBUFB(data,(0x04)-4) = action;

	if (action == 0x05)
	{
		WBUFB(data,(0x05)-4) = 0x01;		
		WBUFB(data,(0x0E)-4) = count;
	}
	WBUFB(data,(0x0C)-4) = 0x01;
}

CDeliveryBoxPacket::CDeliveryBoxPacket(uint8 action, CItem* PItem, uint8 count, uint8 message)
{
	this->type = 0x4B;
	this->size = 0x2C;

	memset(data, 0xFF, 12);

    WBUFB(data,(0x04)-4) = action;                          // тип действия	
    WBUFB(data,(0x05)-4) = 0x01;	                            // тип почтового ящика - 0x01 окно приема почты, 0x02 окно отправки почты 
    WBUFB(data,(0x06)-4) = PItem->getSlotID();              // номер ячейки, в которой находится предмет
    WBUFB(data,(0x0C)-4) = message;	                        // сообщение об ошибке, либо 0x01 в случае успеха
    WBUFB(data,(0x0D)-4) = count;                           // общее количество предметов, которые мы передадим в delivery box

    if ((action != 0x0A && action != 0x0B && action != 0x09) || message > 1)
    {
        WBUFB(data,(0x10)-4) = 0x0B;	                        // назначение неизвестно
        memcpy(data + 0x14-4, PItem->getSender(), 15);      // имя отправителя или название аукциона. Если имя начинается на AH, то клиент отключает кнопку "вернуть"	
    }

    WBUFW(data,(0x2C)-4) = PItem->getSubID();               // предмет, за продажу которого прислали деньги с аукциона
    WBUFW(data,(0x30)-4) = PItem->getID();                  // передаваемый предмет
    WBUFL(data,(0x38)-4) = PItem->getQuantity();            // количество предметов или сумма денег
}