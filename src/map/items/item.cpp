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

#include <string.h>

#include "item.h"
#include "../../common/utils.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItem::CItem(uint16 id)
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
	m_wornItem	 = 0;
    m_sent       = false;

    m_slotID     = -1;
    m_locationID = -1;

	m_augments[0] = 0;
	m_augments[1] = 0;
	m_augments[2] = 0;
	m_augments[3] = 0;
	m_augmentvalues[0] = 0;
	m_augmentvalues[1] = 0;
	m_augmentvalues[2] = 0;
	m_augmentvalues[3] = 0;
	m_trialNumber = 0;
}

CItem::~CItem()
{
}

/************************************************************************
*                                                                       *
*  Уникальный номер предмета                                            *
*                                                                       *
************************************************************************/
	
void CItem::setID(uint16 id)
{
	m_id = id;
}

uint16 CItem::getID()
{
	return m_id;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setSubID(uint16 subid)
{
	m_subid = subid;
}

uint16 CItem::getSubID()
{
	return m_subid;
}

/************************************************************************
*                                                                       *
*  Параметр, определяющий характеристики предмета                       *
*                                                                       *
************************************************************************/

void CItem::setFlag(uint16 flag)
{
	m_flag = flag;
}

uint16 CItem::getFlag()
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

uint8 CItem::getType()
{
	return m_type;
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

uint8 CItem::getSubType()
{
	return m_subtype;
}

/************************************************************************
*                                                                       *
*  Зарезервированное количество предметов в пачке                       *
*                                                                       *
************************************************************************/

void CItem::setReserve(uint32 reserve)
{
    m_reserve = (reserve < m_quantity ? reserve : m_quantity);
}

uint32 CItem::getReserve()
{
    return m_reserve;
}

/************************************************************************
*                                                                       *
*  Текущее количество предметов в пачке                                 *
*                                                                       *
************************************************************************/

void CItem::setQuantity(uint32 quantity)
{
	m_quantity = (quantity < m_stackSize ? quantity : m_stackSize);
}

uint32 CItem::getQuantity()
{
	return m_quantity;
}

/************************************************************************
*                                                                       *
*  Максимальное количество предметов в пачке                            *
*                                                                       *
************************************************************************/

void CItem::setStackSize(uint32 stackSize)
{
	m_stackSize = stackSize;
}

uint32 CItem::getStackSize()
{
	return m_stackSize;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setBasePrice(uint32 BasePrice)
{
	m_BasePrice = BasePrice;
}

uint32 CItem::getBasePrice()
{
	return m_BasePrice;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItem::setCharPrice(uint32 CharPrice)
{
    if (!(m_flag & ITEM_FLAG_EX)) m_CharPrice = CharPrice;
}

uint32 CItem::getCharPrice()
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
	return m_sign.c_str();
}

void CItem::setSignature(int8* signature)
{
	m_sign.clear();
	m_sign.insert(0,signature);
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
*  Function for BCNM item of Maat Testimony                             *
*                                                                       *
************************************************************************/
	
void CItem::setWornItem(uint8 mode)
{
	m_wornItem = mode;
}

uint8 CItem::getWornItem()
{
	return m_wornItem;
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

bool CItem::getSent()
{
	return m_sent;
}

/************************************************************************
*                                                                       *
*  Augments                                                             *
*  5 bits for value, 11 bits for augment ID                             *
*                                                                       *
************************************************************************/

void CItem::setAugmentType(uint8 augment, uint16 type)
{
	m_augments[augment] = type;	
}
uint16 CItem::getAugmentType(uint8 augment)
{
    return m_augments[augment];
}

void CItem::setAugmentValue(uint8 augment, uint8 value)
{
	m_augmentvalues[augment] = value;
}
uint8 CItem::getAugmentValue(uint8 augment)
{
	return m_augmentvalues[augment];
}

void CItem::setTrialNumber(uint16 trial)
{
	m_trialNumber = trial;
}
uint16 CItem::getTrialNumber()
{
	return m_trialNumber;
}