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

enum AUTOSPELL
{
    AUTOSPELL_CURE         = 1,
    AUTOSPELL_CURE_II      = 2,
    AUTOSPELL_CURE_III     = 3,
    AUTOSPELL_CURE_IV      = 4,
    AUTOSPELL_CURE_V       = 5,
    AUTOSPELL_CURE_VI      = 6,
    AUTOSPELL_POISONA      = 14,
    AUTOSPELL_PARALYNA     = 15,
    AUTOSPELL_BLINDNA      = 16,
    AUTOSPELL_SILENA       = 17,
    AUTOSPELL_STONA        = 18,
    AUTOSPELL_VIRUNA       = 19,
    AUTOSPELL_CURSNA       = 20,
    AUTOSPELL_DIA          = 23,
    AUTOSPELL_DIA_II       = 24,
    AUTOSPELL_PROTECT      = 43,
    AUTOSPELL_PROTECT_II   = 44,
    AUTOSPELL_PROTECT_III  = 45,
    AUTOSPELL_PROTECT_IV   = 46,
    AUTOSPELL_PROTECT_V    = 47,
    AUTOSPELL_SHELL        = 48,
    AUTOSPELL_SHELL_II     = 49,
    AUTOSPELL_SHELL_III    = 50,
    AUTOSPELL_SHELL_IV     = 51,
    AUTOSPELL_SHELL_V      = 52,
    AUTOSPELL_STONESKIN    = 54,
    AUTOSPELL_SLOW         = 56,
    AUTOSPELL_HASTE        = 57,
    AUTOSPELL_PARALYZE     = 58,
    AUTOSPELL_SILENCE      = 59,
    AUTOSPELL_PHALANX      = 106,
    AUTOSPELL_REGEN        = 108,
    AUTOSPELL_REGEN_II     = 110,
    AUTOSPELL_REGEN_III    = 111,
    AUTOSPELL_PROTECTRA_V  = 129,
    AUTOSPELL_SHELLRA_V    = 134,
    AUTOSPELL_ERASE        = 143,
    AUTOSPELL_FIRE         = 144,
    AUTOSPELL_FIRE_II      = 145,
    AUTOSPELL_FIRE_III     = 146,
    AUTOSPELL_FIRE_IV      = 147,
    AUTOSPELL_FIRE_V       = 148,
    AUTOSPELL_BLIZZARD     = 149,
    AUTOSPELL_BLIZZARD_II  = 150,
    AUTOSPELL_BLIZZARD_III = 151,
    AUTOSPELL_BLIZZARD_IV  = 152,
    AUTOSPELL_BLIZZARD_V   = 153,
    AUTOSPELL_AERO         = 154,
    AUTOSPELL_AERO_II      = 155,
    AUTOSPELL_AERO_III     = 156,
    AUTOSPELL_AERO_IV      = 157,
    AUTOSPELL_AERO_V       = 158,
    AUTOSPELL_STONE        = 159,
    AUTOSPELL_STONE_II     = 160,
    AUTOSPELL_STONE_III    = 161,
    AUTOSPELL_STONE_IV     = 162,
    AUTOSPELL_STONE_V      = 163,
    AUTOSPELL_THUNDER      = 164,
    AUTOSPELL_THUNDER_II   = 165,
    AUTOSPELL_THUNDER_III  = 166,
    AUTOSPELL_THUNDER_IV   = 167,
    AUTOSPELL_THUNDER_V    = 168,
    AUTOSPELL_WATER        = 169,
    AUTOSPELL_WATER_II     = 170,
    AUTOSPELL_WATER_III    = 171,
    AUTOSPELL_WATER_IV     = 172,
    AUTOSPELL_WATER_V      = 173,
    AUTOSPELL_POISON       = 220,
    AUTOSPELL_POISON_II    = 221,
    AUTOSPELL_BIO          = 230,
    AUTOSPELL_BIO_II       = 231,
    AUTOSPELL_DRAIN        = 245,
    AUTOSPELL_ASPIR        = 247,
    AUTOSPELL_ASPIR_II     = 248,
    AUTOSPELL_BLIND        = 254,
    AUTOSPELL_DISPEL       = 260,
    AUTOSPELL_ABSORB_INT   = 270,
    AUTOSPELL_DREAD_SPIKES = 277,
    AUTOSPELL_ADDLE        = 286,
    AUTOSPELL_REGEN_IV     = 477,
    AUTOSPELL_HASTE_II     = 511,
    AUTOSPELL_ABSORB_ATTRI = 847 // There is no spell id for this!
};

struct automaton_equip_t
{
    uint8 Frame{ 0 };
    uint8 Head{ 0 };
    std::array<uint8, 12> Attachments;
};

class CCharEntity;

class CAutomatonEntity : public CPetEntity
{
public:
	 CAutomatonEntity();
	~CAutomatonEntity();

    automaton_equip_t m_Equip;
    std::array<uint8, 8> m_ElementMax;
    std::array<uint8, 8> m_ElementEquip;

    std::unordered_map<uint16, uint32> m_RecastList;

    bool hasSpell(AUTOSPELL spellid);

    void setFrame(AUTOFRAMETYPE frame);
    void setHead(AUTOHEADTYPE head);
    void setAttachment(uint8 slot, uint8 id);

    void setElementMax(uint8 element, uint8 max);
    void addElementCapacity(uint8 element, int8 value);

    AUTOFRAMETYPE getFrame();
    AUTOHEADTYPE getHead();
    uint8 getAttachment(uint8 slot);
    bool hasAttachment(uint8 attachment);

    uint8 getElementMax(uint8 element);
    uint8 getElementCapacity(uint8 element);

    void burdenTick();
    void setInitialBurden();
    uint16 addBurden(uint8 element, int16 burden);

    void PostTick() override;

    virtual void Spawn() override;
    virtual void Die() override;

    virtual bool ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags) override;

    virtual void OnMobSkillFinished(CMobSkillState&, action_t&) override;
    virtual void OnCastFinished(CMagicState&, action_t&) override;

private:
    std::array<uint16, 8> m_Burden;
};

#endif