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

#ifndef _MOBENTITY_H
#define _MOBENTITY_H

#include <unordered_map>
#include "battleentity.h"

// forward declaration
class CMobSpellContainer;
class CMobSpellList;
class CEnmityContainer;

enum SPAWNTYPE
{
    SPAWNTYPE_NORMAL    = 0x00, // 00:00-24:00
    SPAWNTYPE_ATNIGHT   = 0x01, // 20:00-04:00
    SPAWNTYPE_ATEVENING = 0x02, // 18:00-06:00
    SPAWNTYPE_WEATHER   = 0x04,
    SPAWNTYPE_FOG       = 0x08, // 02:00-07:00
    SPAWNTYPE_MOONPHASE = 0x10,
    SPAWNTYPE_LOTTERY   = 0x20,
    SPAWNTYPE_WINDOWED  = 0x40,
    SPAWNTYPE_SCRIPTED  = 0x80  // scripted spawn
};

enum SPECIALFLAG
{
    SPECIALFLAG_NONE   = 0x0,
    SPECIALFLAG_HIDDEN = 0x1  // only use special when hidden
};

enum ROAMFLAG : std::uint16_t
{
    ROAMFLAG_NONE    = 0x00,
    ROAMFLAG_NONE0   = 0x01,  //
    ROAMFLAG_NONE1   = 0x02,  //
    ROAMFLAG_NONE2   = 0x04,  //
    ROAMFLAG_NONE3   = 0x08,  //
    ROAMFLAG_NONE4   = 0x10,  //
    ROAMFLAG_NONE5   = 0x20,  //
    ROAMFLAG_WORM    = 0x40,  // pop up and down when moving
    ROAMFLAG_AMBUSH  = 0x80,  // stays hidden until someone comes close (antlion)
    ROAMFLAG_EVENT   = 0x100, // calls lua method for roaming logic
    ROAMFLAG_IGNORE  = 0x200, // ignore all hate, except linking hate
    ROAMFLAG_STEALTH = 0x400  // stays name hidden and untargetable until someone comes close (chigoe)
};

enum MOBTYPE
{
    MOBTYPE_NORMAL      = 0x00,
    MOBTYPE_PCSPAWNED   = 0x01,
    MOBTYPE_NOTORIOUS   = 0x02,
    MOBTYPE_FISHED      = 0x04,
    MOBTYPE_CALLED      = 0x08,
    MOBTYPE_BATTLEFIELD = 0x10,
    MOBTYPE_EVENT       = 0x20
};

enum DETECT : std::uint16_t
{
    DETECT_NONE        = 0x00,
    DETECT_SIGHT       = 0x01,
    DETECT_HEARING     = 0x02,
    DETECT_LOWHP       = 0x04,
    DETECT_NONE1       = 0x08,
    DETECT_NONE2       = 0x10,
    DETECT_MAGIC       = 0x20,
    DETECT_WEAPONSKILL = 0x40,
    DETECT_JOBABILITY  = 0x80,
    DETECT_SCENT       = 0x100
};

enum BEHAVIOUR : std::uint16_t
{
    BEHAVIOUR_NONE         = 0x000,
    BEHAVIOUR_NO_DESPAWN   = 0x001, // mob does not despawn on death
    BEHAVIOUR_STANDBACK    = 0x002, // mob will standback forever
    BEHAVIOUR_RAISABLE     = 0x004, // mob can be raised via Raise spells
    BEHAVIOUR_NOHELP       = 0x008, // mob can not be targeted by helpful magic from players (cure, protect, etc)
    BEHAVIOUR_AGGRO_AMBUSH = 0x200, // mob aggroes by ambush
    BEHAVIOUR_NO_TURN      = 0x400  // mob does not turn to face target
};

class CMobSkillState;

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CMobEntity : public CBattleEntity
{
public:
    CMobEntity();
    ~CMobEntity();

    uint32    getEntityFlags();                        // Returns the current value in m_flags
    void      setEntityFlags(uint32 EntityFlags);      // Change the current value in m_flags

    bool      hasRageMode();                           // If the mob has the rage mode: true
    void      addRageMode();                           // Rage mode ON:  stat x10
    void      delRageMode();                           // Rage mode OFF: stat /10

    bool      IsFarFromHome();                         // check if mob is too far from spawn
    bool      CanBeNeutral();                          // check if mob can have killing pause

    std::uint8_t     TPUseChance();                           // return % chance to use TP move

    bool      CanDeaggro();
    time_point GetDespawnTime();
    void      SetDespawnTime(duration _duration);
    uint32    GetRandomGil();                          // returns a random amount of gil
    bool      CanRoamHome();                           // is it possible for me to walk back?
    bool      CanRoam();                               // check if mob can walk around

    bool      CanLink(position_t* pos, std::int16_t superLink = 0);

    bool      CanDropGil();                            // mob has gil to drop
    bool      CanStealGil();                           // can steal gil from mob
    void      ResetGilPurse();                         // reset total gil held

    void      setMobMod(std::uint16_t type, std::int16_t value);
    std::int16_t     getMobMod(std::uint16_t type);
    void      addMobMod(std::uint16_t type, std::int16_t value);     // add
    void      defaultMobMod(std::uint16_t type, std::int16_t value); // set value if value has not been already set
    void      resetMobMod(std::uint16_t type);                // resets mob mod to original value
    std::int32_t     getBigMobMod(std::uint16_t type);               // multiplies mod by 1000
    void      saveMobModifiers();                      // save current state of modifiers
    void      restoreMobModifiers();                   // restore to saved state

    void      HideModel(bool hide);                    // hide / show model
    bool      IsModelHidden();
    void      CallForHelp(bool call);
    bool      CalledForHelp();
    void      HideHP(bool hide);
    bool      IsHPHidden();
    void      Untargetable(bool untargetable);
    bool      IsUntargetable();

    void      PostTick() override;
    float     GetRoamDistance();
    float     GetRoamRate();
    virtual bool ValidTarget(CBattleEntity* PInitiator, std::uint16_t targetFlags) override;

    virtual void HandleErrorMessage(std::unique_ptr<CBasicPacket>&) override {}
    virtual void Die() override;

    virtual void OnWeaponSkillFinished(CWeaponSkillState&, action_t&) override;
    virtual void OnMobSkillFinished(CMobSkillState&, action_t&);
    virtual void OnEngage(CAttackState&) override;

    virtual bool OnAttack(CAttackState&, action_t&);
    virtual bool CanAttack(CBattleEntity* PTarget, std::unique_ptr<CBasicPacket>& errMsg) override;
    virtual void OnCastFinished(CMagicState&, action_t&);

    virtual void OnDisengage(CAttackState&) override;
    virtual void OnDeathTimer() override;public:

    virtual void OnDespawn(CDespawnState&) override;

    virtual void Spawn() override;
    virtual void FadeOut() override;

    bool      m_AllowRespawn;             // if true, allow respawn
    uint32    m_RespawnTime;              // respawn time
    uint32    m_DropItemTime;             // time until monster death animation

    uint32    m_DropID;                   // dropid of items to be dropped. dropid in Database (mob_droplist)

    std::uint8_t     m_minLevel;                 // lowest possible level of the mob
    std::uint8_t     m_maxLevel;                 // highest possible level of the mob
    uint32    HPmodifier;                 // HP in Database (mob_groups)
    uint32    MPmodifier;                 // MP in Database (mob_groups)

    float     HPscale;                    // HP boost percentage
    float     MPscale;                    // MP boost percentage

    std::uint16_t    m_roamFlags;                // defines its roaming behaviour
    std::uint8_t     m_specialFlags;             // flags for special skill

    bool      m_StatPoppedMobs;           // true if dyna statue has popped mobs

    std::uint8_t     strRank;
    std::uint8_t     dexRank;
    std::uint8_t     vitRank;
    std::uint8_t     agiRank;
    std::uint8_t     intRank;
    std::uint8_t     mndRank;
    std::uint8_t     chrRank;
    std::uint8_t     attRank;
    std::uint8_t     defRank;
    std::uint8_t     accRank;
    std::uint8_t     evaRank;

    std::uint16_t	  m_dmgMult;

    // aggro ranges
    bool      m_disableScent;             // stop detecting by scent
    float     m_maxRoamDistance;          // maximum distance mob can be from spawn before despawning

    std::uint8_t     m_Type;                     // mob type
    bool	  m_Aggro;
    bool	  m_TrueDetection;   // Has true sight or sound
    std::uint16_t	  m_Detects;                // mobs detection methods, sight, sound, etc
    std::uint8_t     m_Link;                     // link with mobs of it's family
    std::uint16_t    m_Behaviour;                // mob behaviour
    SPAWNTYPE m_SpawnType;                // condition for mob to spawn

    std::int8_t      m_battlefieldID;            // battlefield belonging to
    std::uint16_t    m_bcnmID;                   // belongs to which battlefield
    bool      m_giveExp;                  // prevent exp gain
    bool      m_neutral;                  // stop linking / aggroing

    position_t  m_SpawnPoint;           // spawn point of mob

    std::uint8_t     m_Element;
    std::uint8_t     m_HiPCLvl;                  // Highest Level of Player Character that hit the Monster
    std::uint8_t     m_THLvl;                    // Highest Level of Treasure Hunter that apply to drops
    bool      m_ItemStolen;               // if true, mob has already been robbed. reset on respawn. also used for thf maat fight
    std::uint16_t    m_Family;
    std::uint16_t    m_MobSkillList;             // Mob skill list defined from mob_pools
    uint32    m_Pool;                     // pool the mob came from

    CMobSpellList*        m_SpellListContainer;        // The spells list container for this mob
    std::map<std::uint16_t, std::uint16_t>    m_UsedSkillIds;        // mob skill ids used (key) along with mob level (value)

    uint32    m_flags;                                 // includes the CFH flag and whether the HP bar should be shown or not (e.g. Yilgeban doesnt)
    std::uint8_t     m_name_prefix;                           // The ding bats VS Ding bats
    string_t  packetName;                              // Used for battle allies

    CEnmityContainer* PEnmityContainer;                // система ненависти монстров

    CMobSpellContainer* SpellContainer;                // retrieves spells for the mob
    std::uint8_t     m_HasSpellScript;                        // 1 if they have a spell script to use for working out what to cast.

    static constexpr float sound_range {8.f};
    static constexpr float sight_range {15.f};

protected:

    void DropItems();



private:

    bool      m_RageMode;                              // Mode rage
    time_point    m_DespawnTimer {time_point::min()};  // Despawn Timer to despawn mob after set duration
    std::unordered_map<int, std::int16_t>     m_mobModStat;
    std::unordered_map<int, std::int16_t>     m_mobModStatSave;
    static constexpr float roam_home_distance {60.f};
};

#endif
