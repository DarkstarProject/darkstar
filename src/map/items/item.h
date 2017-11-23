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

#ifndef _CITEM_H
#define _CITEM_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

// основной тип предмета m_type

enum ITEM_TYPE
{
    ITEM_BASIC              = 0x00,
    ITEM_GENERAL            = 0x01,
    ITEM_USABLE             = 0x02,
    ITEM_PUPPET             = 0x04,
    ITEM_ARMOR              = 0x08,
    ITEM_WEAPON             = 0x10,
    ITEM_CURRENCY           = 0x20,
    ITEM_FURNISHING         = 0x40,
    ITEM_LINKSHELL          = 0x80
};

// дополнительный тип предмета m_subtype

enum ITEM_SUBTYPE
{
    ITEM_NORMAL             = 0x00,
    ITEM_LOCKED             = 0x01,
    ITEM_CHARGED            = 0x02,
    ITEM_AUGMENTED          = 0x04,
    ITEM_UNLOCKED           = 0xFE
};

// флаги предметов

enum ITEM_FLAG
{
    ITEM_FLAG_WALLHANGING   = 0x0001,
    ITEM_FLAG_01            = 0x0002,
    ITEM_FLAG_MYSTERY_BOX   = 0x0004, // Can be gained from Gobbie Mystery Box
    ITEM_FLAG_MOG_GARDEN    = 0x0008, // Can use in Mog Garden
    ITEM_FLAG_MAIL2ACCOUNT  = 0x0010, // CanSendPOL Polutils Value
    ITEM_FLAG_INSCRIBABLE   = 0x0020,
    ITEM_FLAG_NOAUCTION     = 0x0040,
    ITEM_FLAG_SCROLL        = 0x0080,
    ITEM_FLAG_LINKSHELL     = 0x0100, // Linkshell Polutils Value
    ITEM_FLAG_CANUSE        = 0x0200,
    ITEM_FLAG_CANTRADENPC   = 0x0400,
    ITEM_FLAG_CANEQUIP      = 0x0800,
    ITEM_FLAG_NOSALE        = 0x1000,
    ITEM_FLAG_NODELIVERY    = 0x2000,
    ITEM_FLAG_EX            = 0x4000, // NoTradePC Polutils Value
    ITEM_FLAG_RARE          = 0x8000
};


class CItem
{
public:

    CItem(std::uint16_t id);
    virtual ~CItem();

    std::uint16_t      getID();
    std::uint16_t      getSubID();
    std::uint16_t      getFlag();
    std::uint8_t       getAHCat();
    std::uint32_t      getReserve();
    std::uint32_t      getQuantity();
    std::uint32_t      getStackSize();
    std::uint32_t      getBasePrice();
    std::uint32_t      getCharPrice();
    std::uint8_t       getLocationID();
    std::uint8_t       getSlotID();

    bool        isSent();
    bool        isType(ITEM_TYPE);
    bool        isSubType(ITEM_SUBTYPE);

    void        setID(std::uint16_t );
    void        setSubID(std::uint16_t);
    void        setSubType(std::uint8_t);
    void        setFlag(std::uint16_t);
    void        setAHCat(std::uint8_t);
    void        setReserve(std::uint32_t);
    void        setQuantity(std::uint32_t);
    void        setStackSize(std::uint32_t);
    void        setBasePrice(std::uint32_t);
    void        setCharPrice(std::uint32_t);
    void        setLocationID(std::uint8_t LocationID);
    void        setSlotID(std::uint8_t SlotID);
    void        setSent(bool sent);

    const std::int8_t* getName();
    void        setName(std::int8_t* name);

    const std::int8_t* getSender();
    void        setSender(std::int8_t* sender);

    const std::int8_t* getReceiver();
    void        setReceiver(std::int8_t* receiver);

    virtual const std::int8_t* getSignature();
    virtual void setSignature(std::int8_t* signature);

    std::uint8_t       m_extra[0x18];  // any extra data pertaining to item (augments, furniture location, etc)

protected:

    void        setType(std::uint8_t);

private:

    std::uint16_t      m_id;
    std::uint16_t      m_subid;
    std::uint8_t       m_type;
    std::uint8_t       m_subtype;
    std::uint32_t      m_quantity;     // текущее количество предметов
    std::uint32_t      m_reserve;      // зарезервированное количество предметов
    std::uint32_t      m_stackSize;    // максимальное количество предметов
    std::uint32_t      m_BasePrice;
    std::uint32_t      m_CharPrice;    // стоимость предмета в bazaar
    std::uint8_t       m_ahCat;        // категоряи предмета на укционе
    std::uint16_t      m_flag;

    std::uint8_t       m_slotID;       // ячейка предмета в хранилище
    std::uint8_t       m_locationID;   // номер хранилища предмета

    bool        m_sent;

    string_t    m_name;
    string_t    m_send;
    string_t    m_recv;
};

#endif