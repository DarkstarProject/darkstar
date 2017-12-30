﻿/*
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

#include "../../common/socket.h"

#include "../utils/itemutils.h"

#include <string.h>

#include "delivery_box.h"


CDeliveryBoxPacket::CDeliveryBoxPacket(uint8 action, uint8 boxid, uint8 count, uint8 param)
{
    this->type = 0x4B;
    this->size = 0x0A;

    memset(data + 4, 0xFF, 12);

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = boxid;

    if (action == 0x05)
    {
        if (boxid == 0x01)
            ref<uint8>(0x0E) = count;
        else
            ref<uint8>(0x0F) = count;
    }
    else if (action == 0x0C)
    {
        ref<uint8>(0x0D) = count;
    }
    ref<uint8>(0x0C) = param;
}

CDeliveryBoxPacket::CDeliveryBoxPacket(uint8 action, uint8 boxid, CItem* PItem, uint8 slotid, uint8 count, uint8 message)
{
    this->type = 0x4B;
    this->size = 0x2C;

    memset(data + 4, 0xFF, 12);

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = boxid;
    ref<uint8>(0x06) = slotid;
    ref<uint8>(0x0C) = message;	    // success: 0x01, else error message
    ref<uint8>(0x0D) = count;

    if (PItem)
    {
        if ((action != 0x0A && action != 0x0B && action != 0x09) || message > 1)
        {
            if (boxid == 1)
            {
                ref<uint8>(0x10) = 0x07;
                memcpy(data + 0x14 , PItem->getSender(), strlen((const char*)PItem->getSender()));        // Sender's name.  Client disables "Return" if it starts with "AH"
            }
            else
            {
                ref<uint8>(0x10) = PItem->isSent() ? 0x03 : 0x05;    // 0x05 in send: canceled. other values are unknown 
                memcpy(data + 0x14 , PItem->getReceiver(), strlen((const char*)PItem->getReceiver()));    // Receiver's name.  Client disables "Return" if it starts with "AH"
            }
        }
        if (action == 0x02)
        {
            ref<uint8>(0x10) = 0x01;
            ref<uint8>(0x07) = PItem->getSlotID();
        }
        else if (action == 0x03)
        {
            ref<uint8>(0x07) = PItem->getSlotID();
        }
        else if (action == 0x04)
        {
            if (message == 0x01)
            {
                ref<uint8>(0x10) = 0x05;
            }
            else if (message == 0x02)
            {
                ref<uint8>(0x10) = 0x04;
            }
        }

        ref<uint16>(0x2C) = PItem->getSubID();               // Only used to display which item was sold on the AH
        ref<uint16>(0x30) = PItem->getID();
        ref<uint32>(0x38) = PItem->getQuantity();
        memcpy(data + 0x3C , PItem->m_extra, sizeof(PItem->m_extra));
    }
}