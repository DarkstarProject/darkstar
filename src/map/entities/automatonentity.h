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

#ifndef _CAUTOMATONENTITY_H
#define _CAUTOMATONENTITY_H

#include "petentity.h"
#include <array>

enum AUTOFRAMETYPE
{
    FRAME_HARLEQUIN  = 0x20,
    FRAME_VALOREDGE  = 0x21,
    FRAME_SHARPSHOT  = 0x22,
    FRAME_STORMWAKER = 0x23
};

enum AUTOHEADTYPE
{
    HEAD_HARLEQUIN    = 0x01,
    HEAD_VALOREDGE    = 0x02,
    HEAD_SHARPSHOT    = 0x03,
    HEAD_STORMWAKER   = 0x04,
    HEAD_SOULSOOTHER  = 0x05,
    HEAD_SPIRITREAVER = 0x06
};

struct automaton_equip_t
{
    std::uint8_t Frame{ 0 };
    std::uint8_t Head{ 0 };
    std::array<std::uint8_t, 12> Attachments {};
};

class CCharEntity;

class CAutomatonEntity : public CPetEntity
{
public:
	 CAutomatonEntity();
	~CAutomatonEntity();

    automaton_equip_t m_Equip;
    std::array<std::uint8_t, 8> m_ElementMax {};
    std::array<std::uint8_t, 8> m_ElementEquip {};

    void setFrame(AUTOFRAMETYPE frame);
    void setHead(AUTOHEADTYPE head);
    void setAttachment(std::uint8_t slot, std::uint8_t id);

    void setElementMax(std::uint8_t element, std::uint8_t max);
    void addElementCapacity(std::uint8_t element, int8 value);

    AUTOFRAMETYPE getFrame();
    AUTOHEADTYPE getHead();
    std::uint8_t getAttachment(std::uint8_t slot);
    bool hasAttachment(std::uint8_t attachment);

    std::uint8_t getElementMax(std::uint8_t element);
    std::uint8_t getElementCapacity(std::uint8_t element);

    void burdenTick();
    void setInitialBurden();
    std::uint8_t addBurden(std::uint8_t element, int8 burden);

    void PostTick() override;

    virtual void Spawn() override;
    virtual void Die() override;

    virtual bool ValidTarget(CBattleEntity* PInitiator, std::uint16_t targetFlags) override;

    virtual void OnMobSkillFinished(CMobSkillState&, action_t&) override;
    virtual void OnCastFinished(CMagicState&, action_t&) override;

private:
    std::array<std::uint8_t, 8> m_Burden {};
};

#endif