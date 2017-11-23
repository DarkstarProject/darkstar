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

#ifndef _CMOBSKILL_H
#define _CMOBSKILL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

enum SKILLFLAG
{
    SKILLFLAG_NONE           = 0x000,
    SKILLFLAG_TWO_HOUR       = 0x002,
    // Special skill (ranged attack / call beast)
    SKILLFLAG_SPECIAL        = 0x004,
    SKILLFLAG_HIT_ALL        = 0x008,
    SKILLFLAG_REPLACE_ATTACK = 0x010,
    SKILLFLAG_DRAW_IN        = 0x020
};

class CMobSkill
{
public:

    CMobSkill(std::uint16_t id);

    bool        hasMissMsg() const;
    bool        isAoE() const;
    bool        isConal() const;
    bool        isSingle() const;
    bool        isTwoHour() const;
    bool        isSpecial() const;
    bool        isTpSkill() const;

    std::uint16_t      getID() const;
    std::uint16_t      getAnimationID() const;
    std::uint16_t      getPetAnimationID() const;
    std::uint8_t       getAoe() const;
    float       getDistance() const;
    std::uint8_t       getFlag() const;
    std::uint16_t      getAnimationTime() const;
    std::uint16_t      getActivationTime() const;
    std::uint16_t      getMsg() const;
    std::uint16_t      getAoEMsg() const;
    std::uint16_t      getValidTargets() const;
    std::int16_t       getTP() const;
    std::uint8_t       getHPP() const;
    std::uint16_t      getTotalTargets() const;
    std::uint16_t      getMsgForAction() const;
    float       getRadius() const;
    std::int16_t       getParam() const;
    std::uint8_t       getKnockback() const;
    std::uint8_t       getPrimarySkillchain() const;
    std::uint8_t       getSecondarySkillchain() const;
    std::uint8_t       getTertiarySkillchain() const;

    bool        isDamageMsg();

    void        setID(std::uint16_t id);
    void        setAnimationID(std::uint16_t aid);
    void        setAoe(std::uint8_t aoe);
    void        setDistance(float distance);
    void        setFlag(std::uint8_t flag);
    void        setAnimationTime(std::uint16_t AnimationTime);
    void        setActivationTime(std::uint16_t ActivationTime);
    void        setMsg(std::uint16_t msg);
    void        setValidTargets(std::uint16_t targ);
    void        setTP(std::int16_t tp);
    void        setHPP(std::uint8_t hpp);
    void        setTotalTargets(std::uint16_t targets);
    void        setParam(std::int16_t value);
    void        setKnockback(std::uint8_t knockback);
    void        setPrimarySkillchain(std::uint8_t skillchain);
    void        setSecondarySkillchain(std::uint8_t skillchain);
    void        setTertiarySkillchain(std::uint8_t skillchain);

    const std::int8_t* getName() const;
    void        setName(std::int8_t* name);

private:

    std::uint16_t      m_ID;
    std::uint16_t      m_TotalTargets;
    std::int16_t       m_Param;
    std::uint16_t      m_AnimID;           //animation id
    std::uint8_t       m_Aoe;              // не используется
    float       m_Distance;         // не используется
    std::uint8_t       m_Flag;             // не используется
    std::uint16_t      m_ValidTarget;      //same as
    std::uint16_t      m_AnimationTime;    //how long the tp animation lasts for in ms
    std::uint16_t      m_ActivationTime;   //how long the mob prepares the tp move for
    std::uint16_t      m_Message;          //message param, scripters can edit this depending on self/resist/etc.
    std::int16_t       m_TP;               //the tp at the time of finish readying (for scripts)
    std::uint8_t       m_HPP;              // HPP at the time of using mob skill (for scripts)
    std::uint8_t       m_knockback;        //knockback value (0-7)
    std::uint8_t       m_primarySkillchain;       //weaponskill ID of skillchain properties
    std::uint8_t       m_secondarySkillchain;
    std::uint8_t       m_tertiarySkillchain;

    string_t    m_name;
};

#endif
