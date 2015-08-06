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

#ifndef _CSPELL_H
#define _CSPELL_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "entities/battleentity.h"
#include "entities/charentity.h"

#define CANNOT_USE_SPELL    0
#define MAX_SPELL_ID        847

enum SPELLGROUP
{
    SPELLGROUP_NONE      = 0,
    SPELLGROUP_SONG      = 1,
    SPELLGROUP_BLACK     = 2,
    SPELLGROUP_BLUE      = 3,
    SPELLGROUP_NINJUTSU  = 4,
    SPELLGROUP_SUMMONING = 5,
    SPELLGROUP_WHITE     = 6,
    SPELLGROUP_GEOMANCY  = 7
};

enum SPELLREQ
{
    SPELLCASTTYPE_NORMAL    = 0x00,
    SPELLREQ_MERIT          = 0x01,
    SPELLREQ_ADDENDUM_BLACK = 0x02,
    SPELLREQ_ADDENDUM_WHITE = 0x04,
    SPELLREQ_TABULA_RASA    = 0x08,
    SPELLREQ_UNBRIDLED_LEARNING = 0x10
};

enum SPELLAOE
{
    SPELLAOE_NONE           = 0,
    SPELLAOE_RADIAL         = 1,
    SPELLAOE_CONAL          = 2,
    SPELLAOE_RADIAL_MANI    = 3,  //AOE when under SCH stratagem Manifestation
    SPELLAOE_RADIAL_ACCE    = 4,  //AOE when under SCH stratagem Accession
    SPELLAOE_PIANISSIMO     = 5,  //Single target when under BRD JA Pianissimo
    SPELLAOE_DIFFUSION      = 6   //AOE when under Diffusion
};

enum SPELLFLAG
{
    SPELLFLAG_NONE      = 0,
    SPELLFLAG_HIT_ALL   = 1     // hit all targets in range regardless of party
};

class CSpell
{
public:

    CSpell(uint16 id);

    bool        canTargetEnemy();
    bool        isBuff();
    bool        dealsDamage(); // checks if the spell deals hp damage to target, this is relative to message

    float       getMaxRange();
    uint16      getTotalTargets();
    uint16      getID();
    uint8       getJob(JOBTYPE JobID);
    uint16      getMPCost();
    uint32      getCastTime();
    uint32      getRecastTime();
    uint8       getValidTarget();
    uint16      getAnimationID();
    uint16      getAnimationTime();
    SPELLGROUP  getSpellGroup();
    uint8       getSkillType();
    uint16      getZoneMisc();
    uint8       getAOE();
    uint16      getBase();
    uint16      getElement();
    float       getMultiplier();
    uint16      getMessage();
    uint16      getDefaultMessage();
    uint16      getMagicBurstMessage();
    uint16      getCE();
    uint16      getVE();
    uint32      getModifiedRecast();
    float       getRadius();
    uint16      getAoEMessage(); // returns the single target message for AoE moves
    uint8       getRequirements();
    uint16      getMeritId();
    uint8       getFlag();
    int8*        getExpansionCode();
    bool        tookEffect(); // returns true if the spell landed, not resisted or missed
    bool        hasMPCost(); // checks if spell costs mp to use
    bool        isHeal(); // is a heal spell
    bool        isCure(); // is a Cure spell
    bool        isNa(); // is a -na spell
    bool        canHitShadow(); // check if spell ignores shadows

    void        setRadius(float radius);
    void        setTotalTargets(uint16 total);
    void        setID(uint16 id);
    void        setJob(int8* jobs);
    void        setMPCost(uint16 MP);
    void        setCastTime(uint32 CastTime);
    void        setRecastTime(uint32 RecastTime);
    void        setValidTarget(uint8 ValidTarget);
    void        setAnimationID(uint16 AnimationID);
    void        setAnimationTime(uint16 AnimationTime);
    void        setSpellGroup(SPELLGROUP SpellGroup);
    void        setSkillType(uint8 SkillType);
    void        setZoneMisc(uint16 Misc);
    void        setAOE(uint8 AOE);
    void        setBase(uint16 base);
    void        setElement(uint16 element);
    void        setMultiplier(float multiplier);
    void        setMessage(uint16 message);
    void        setMagicBurstMessage(uint16 message);
    void        setCE(uint16 ce);
    void        setVE(uint16 ve);
    void        setRequirements(uint8 requirements);
    void        setMeritId(uint16 meritId);
    void        setModifiedRecast(uint32 mrec);
    void        setFlag(uint8 flag);
    void        setExpansionCode(int8* expansionCode);

    const int8* getName();
    void        setName(int8* name);

private:

    uint16      m_ID;                                   // spell id
    uint32      m_castTime;                             // time to cast spell
    uint32      m_recastTime;                           // recast time
    uint16      m_animation;                            // animation for spell
    uint16      m_animationTime;
    uint8       m_skillType;
    float       m_radius;
    uint8       m_totalTargets;
    uint16      m_mpCost;                               // mpCost/itemId for ninjitsu tool
    uint8       m_job[MAX_JOBTYPE];                     // job
    uint8       m_ValidTarget;                          // target pc/npc/both
    SPELLGROUP  m_spellGroup;                           // spellgroup
    uint16      m_zoneMisc;                             // условия чтения заклинаний в зонах
    uint8       m_AOE;                                  // aoe or single target spell
    uint16      m_base;                                 // spell base damage
    float       m_multiplier;                           // multiplier for upper tier spells
    uint16      m_element;                              // element of spell
    uint16      m_message;                              // message id
    uint16      m_MagicBurstMessage;                    // Message used for magic bursts.
    uint16      m_CE;                                   // cumulative enmity of spell
    uint16      m_VE;                                   // volatile enmity of spell
    string_t    m_name;                                 // spell name
    uint32      m_modifiedRecastTime;                   // recast time after modifications
    uint8       m_requirements;                         // requirements before being able to cast spell
    uint16      m_meritId;                              // associated merit (if applicable)
    uint8       m_flag;
    int8*       m_expansionCode;
};

//Namestpace to work with spells
namespace spell
{
    void    LoadSpellList();

    CSpell* GetSpellByMonsterSkillId(uint16 SkillID);
    CSpell* GetSpell(uint16 SpellID);
    bool    CanUseSpell(CBattleEntity* PCaster, uint16 SpellID);
    bool    CanUseSpellWith(uint16 spellId, JOBTYPE job, uint8 level);
    float   GetSpellRadius(CSpell* spellId, CBattleEntity* PCaster);
};

#endif
