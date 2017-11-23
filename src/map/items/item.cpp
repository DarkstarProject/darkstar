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

#include <string.h>

#include "item.h"
#include "../../common/utils.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItem::CItem(std::uint16_t id)
{
    m_id = id;

    m_subid      = 0;
    m_type       = 0;
    m_subtype    = 0;
    m_reserve    = 0;
    m_quantity   = 0;
    m_stackSize  = 0;
    m_BasePrice  = 0;
    m_CharPrice  = 0;
    m_ahCat      = 0;
    m_flag       = 0;
    m_sent       = false;

    m_slotID     = -1;
    m_locationID = -1;

    memset(m_extra, 0, sizeof m_extra);
}

CItem::~CItem()
{
}

/************************************************************************
*                                                                       *
*  Уникальный номер предмета                                            *
*                                                                       *
************************************************************************/

void CItem::setID(std::uint16_t id)
{
    m_id = id;
}

std::uint16_t CItem::getID()
{
    return m_id;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setSubID(std::uint16_t subid)
{
    m_subid = subid;
}

std::uint16_t CItem::getSubID()
{
    return m_subid;
}

/************************************************************************
*                                                                       *
*  Параметр, определяющий характеристики предмета                       *
*                                                                       *
************************************************************************/

void CItem::setFlag(std::uint16_t flag)
{
    m_flag = flag;
}

std::uint16_t CItem::getFlag()
{
    return m_flag;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setAHCat(uint8 ahCat)
{
    m_ahCat = ahCat;
}

uint8 CItem::getAHCat()
{
    return m_ahCat;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setType(uint8 type)
{
    m_type |= type;
}

bool CItem::isType(ITEM_TYPE type)
{
    return (m_type & type);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setSubType(uint8 subtype)
{
    m_subtype = (subtype > 128 ? m_subtype & subtype : m_subtype | subtype);
}

bool CItem::isSubType(ITEM_SUBTYPE subtype)
{
    return (m_subtype & subtype);
}

/************************************************************************
*                                                                       *
*  Зарезервированное количество предметов в пачке                       *
*                                                                       *
************************************************************************/

void CItem::setReserve(std::uint32_t reserve)
{
    m_reserve = (reserve < m_quantity ? reserve : m_quantity);
}

std::uint32_t CItem::getReserve()
{
    return m_reserve;
}

/************************************************************************
*                                                                       *
*  Текущее количество предметов в пачке                                 *
*                                                                       *
************************************************************************/

void CItem::setQuantity(std::uint32_t quantity)
{
    m_quantity = (quantity < m_stackSize ? quantity : m_stackSize);
}

std::uint32_t CItem::getQuantity()
{
    return m_quantity;
}

/************************************************************************
*                                                                       *
*  Максимальное количество предметов в пачке                            *
*                                                                       *
************************************************************************/

void CItem::setStackSize(std::uint32_t stackSize)
{
    m_stackSize = stackSize;
}

std::uint32_t CItem::getStackSize()
{
    return m_stackSize;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setBasePrice(std::uint32_t BasePrice)
{
    m_BasePrice = BasePrice;
}

std::uint32_t CItem::getBasePrice()
{
    return m_BasePrice;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setCharPrice(std::uint32_t CharPrice)
{
    if (!(m_flag & ITEM_FLAG_EX)) m_CharPrice = CharPrice;
}

std::uint32_t CItem::getCharPrice()
{
    return m_CharPrice;
}

/************************************************************************
*                                                                       *
*  Название предмета                                                    *
*                                                                       *
************************************************************************/

const int8* CItem::getName()
{
    return m_name.c_str();
}

void CItem::setName(int8* name)
{
    m_name.clear();
    m_name.insert(0,name);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

const int8* CItem::getSender()
{
    return m_send.c_str();
}

void CItem::setSender(int8* sender)
{
    m_send.clear();
    m_send.insert(0,sender);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

const int8* CItem::getReceiver()
{
    return m_recv.c_str();
}

void CItem::setReceiver(int8* receiver)
{
    m_recv.clear();
    m_recv.insert(0,receiver);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

const int8* CItem::getSignature()
{
    return (int8*)m_extra+0x0C;
}

void CItem::setSignature(int8* signature)
{
    memcpy(m_extra + 0x0C, signature, sizeof(m_extra) - 0x0C);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CItem::getLocationID()
{
    return m_locationID;
}

void CItem::setLocationID(uint8 locationID)
{
    m_locationID = locationID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CItem::getSlotID()
{
    return m_slotID;
}

void CItem::setSlotID(uint8 slotID)
{
    m_slotID = slotID;
}

/************************************************************************
*                                                                       *
*  Sent (via send/delivery box)                                         *
*                                                                       *
************************************************************************/

void CItem::setSent(bool sent)
{
    m_sent = sent;
}

bool CItem::isSent()
{
    return m_sent;
}