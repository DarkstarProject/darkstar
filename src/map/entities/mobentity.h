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

#include "battleentity.h"
#include "../enmity_container.h"
#include "../utils/mobutils.h"
#include "../mob_modifier.h"

#include "../mob_spell_container.h"
#include "../mob_spell_list.h"

// forward declaration
class CMobSpellContainer;

// this will make mobs walk back to spawn point instead of despawning
#define MOB_NO_DESPAWN false
#define MOB_SOUND_RANGE 8
#define MOB_SIGHT_RANGE 15
#define MOB_LINK_RADIUS 10
#define MOB_TP_USE_CHANCE 30      // 30% chance to use tp if over 100

enum SPAWNTYPE
{
  SPAWNTYPE_NORMAL        = 0x00, // 00:00-24:00
  SPAWNTYPE_ATNIGHT       = 0x01, // 20:00-04:00
  SPAWNTYPE_ATEVENING     = 0x02, // 18:00-06:00
  SPAWNTYPE_WEATHER       = 0x04,
  SPAWNTYPE_FOG           = 0x08, // 02:00-07:00
  SPAWNTYPE_MOONPHASE     = 0x10,
  SPAWNTYPE_LOTTERY       = 0x20,
  SPAWNTYPE_WINDOWED      = 0x40, 
  SPAWNTYPE_SCRIPTED      = 0x80  // scripted spawn
};

enum SPECIALFLAG
{
  SPECIALFLAG_NONE      = 0x0,
  SPECIALFLAG_HIDDEN    = 0x1  // only use special when hidden
};

enum ROAMFLAG : uint16
{
  ROAMFLAG_NONE     = 0x00,
  ROAMFLAG_NONE0    = 0x01,  // move around less than 5
  ROAMFLAG_NONE1    = 0x02,  // move around 10-20
  ROAMFLAG_NONE2    = 0x04,  // move around 15-25
  ROAMFLAG_WANDER   = 0x08,  // roam to multiple points in a row
  ROAMFLAG_SCOUT    = 0x10,  // move around more often
  ROAMFLAG_GUARD    = 0x20,  // move less often
  ROAMFLAG_WORM     = 0x40,  // pop up and down when moving
  ROAMFLAG_AMBUSH   = 0x80,  // stays hidden until someone comes close (antlion)
  ROAMFLAG_EVENT    = 0x100, // calls lua method for roaming logic
  ROAMFLAG_IGNORE   = 0x200, // ignore all hate, except linking hate
  ROAMFLAG_STEALTH  = 0x400  // stays name hidden and untargetable until someone comes close (chigoe)
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

enum AGGRO : uint16
{
	AGGRO_NONE					= 0x00,
	AGGRO_DETECT_SIGHT			= 0x01,
	AGGRO_DETECT_HEARING		= 0x02,
	AGGRO_DETECT_LOWHP			= 0x04,
	AGGRO_DETECT_TRUEHEARING	= 0x08,
	AGGRO_DETECT_TRUESIGHT		= 0x10,
	AGGRO_DETECT_MAGIC			= 0x20,
	AGGRO_DETECT_WEAPONSKILL	= 0x40,
	AGGRO_DETECT_JOBABILITY		= 0x80,
	AGGRO_SCENT					= 0x100
};

enum BEHAVIOUR : uint16
{
	BEHAVIOUR_NONE				= 0x000,
	BEHAVIOUR_NO_DESPAWN		= 0x001, // mob does not despawn on death
	BEHAVIOUR_STANDBACK			= 0x002, // mob will standback forever
	BEHAVIOUR_RAISABLE			= 0x004, // mob can be raised via Raise spells
    BEHAVIOUR_NOHELP            = 0x008, // mob can not be targeted by helpful magic from players (cure, protect, etc)
	BEHAVIOUR_AGGRO_AMBUSH		= 0x200, // mob aggroes by ambush
	BEHAVIOUR_NO_TURN           = 0x400  // mob does not turn to face target
};


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CMobEntity : public CBattleEntity
{
public:

  bool      m_AllowRespawn;             // if true, allow respawn
  uint32    m_RespawnTime;              // respawn time
  uint32    m_DropItemTime;             // time until monster death animation

  uint32    m_DropID;                   // dropid of items to be dropped. dropid in Database (mob_droplist)

  uint8     m_minLevel;                 // lowest possible level of the mob
  uint8     m_maxLevel;                 // highest possible level of the mob
  uint32    HPmodifier;                 // HP in Database (mob_groups)
  uint32    MPmodifier;                 // MP in Database (mob_groups)

  float     HPscale;                    // HP boost percentage
  float     MPscale;                    // MP boost percentage

  uint16    m_roamFlags;                // defines its roaming behaviour
  uint8     m_specialFlags;             // flags for special skill

  bool      m_StatPoppedMobs;           // true if dyna statue has popped mobs
  
  // stat ranks
  uint8     strRank;
  uint8     dexRank;
  uint8     vitRank;
  uint8     agiRank;
  uint8     intRank;
  uint8     mndRank;
  uint8     chrRank;
  uint8     attRank;
  uint8     defRank;
  uint8     accRank;
  uint8     evaRank; // not used

  uint16	m_dmgMult;

  // aggro ranges
  bool      m_disableScent;             // stop detecting by scent
  float     m_maxRoamDistance;          // maximum distance mob can be from spawn before despawning
  float     m_roamDistance;          // distance allowed to roam from spawn

  uint8     m_Type;                     // mob type
  uint16	m_Aggro;					// mob aggro type
  uint8     m_Link;                     // link with mobs of it's family
  uint16    m_Behaviour;                // mob behaviour
  SPAWNTYPE m_SpawnType;                // condition for mob to spawn

  int8      m_battlefieldID;            // battlefield belonging to
  uint16    m_bcnmID;                   // belongs to which battlefield
  bool      m_giveExp;                  // prevent exp gain
  bool      m_neutral;                  // stop linking / aggroing

  position_t    m_SpawnPoint;           // spawn point of mob

  uint8     m_Element;
  uint8     m_HiPCLvl;                  // Highest Level of Player Character that hit the Monster
  uint8     m_THLvl;                    // Highest Level of Treasure Hunter that apply to drops
  bool      m_ItemStolen;               // if true, mob has already been robbed. reset on respawn. also used for thf maat fight
  uint16    m_Family;
  uint32    m_Pool;                     // pool the mob came from

  CMobSpellList*        m_SpellListContainer;        // The spells list container for this mob
  std::map<uint16, uint16>    m_UsedSkillIds;        // mob skill ids used (key) along with mob level (value)

  uint32    m_flags  ;                               // includes the CFH flag and whether the HP bar should be shown or not (e.g. Yilgeban doesnt)
  void      setMobFlags(uint32 MobFlags);            // Change the current value in m_flags
  uint8     m_name_prefix;                           // The ding bats VS Ding bats

  CEnmityContainer* PEnmityContainer;                // система ненависти монстров

  bool      hasRageMode();                           // If the mob has the rage mode: true
  void      addRageMode();                           // Rage mode ON:  stat x10
  void      delRageMode();                           // Rage mode OFF: stat /10

  bool      IsFarFromHome();                         // check if mob is too far from spawn
  bool      CanBeNeutral();                          // check if mob can have killing pause

  void      SetMainSkin(uint32 mobid);               // Set base skin for the mob (if mob or player dieing)
  void      SetNewSkin(uint8 skinid);                // Set new skin for the mob
  uint32    GetSkinID();                             // Get the last skinid (0 for base skin)

  uint8     TPUseChance();                           // return % chance to use TP move

  void      ChangeMJob(uint16 job);                  // this will change jobs and update traits, stats, spells

  bool      CanDeaggro();
  uint32    GetDespawnTimer();
  void      SetDespawnTimer(uint32 duration);
  uint32    GetRandomGil();                          // returns a random amount of gil
  bool      CanRoamHome();                           // is it possible for me to walk back?
  bool      CanRoam();                               // check if mob can walk around

  bool      CanLink(position_t* pos, int16 superLink = 0);

  bool      CanDropGil();                            // mob has gil to drop

  CMobSpellContainer* SpellContainer;                // retrieves spells for the mob
  uint8     m_HasSpellScript;                        // 1 if they have a spell script to use for working out what to cast.

  void      setMobMod(uint16 type, int16 value);
  int16     getMobMod(uint16 type);
  void      addMobMod(uint16 type, int16 value);     // add 
  void      defaultMobMod(uint16 type, int16 value); // set value if value has not been already set
  void      resetMobMod(uint16 type);                // resets mob mod to original value
  int32     getBigMobMod(uint16 type);               // multiplies mod by 1000
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

  void      UpdateEntity() override;

  CMobEntity();
  ~CMobEntity();

private:

  bool      m_RageMode;                              // Mode rage
  uint32    m_DespawnTimer;                          // Despawn Timer to despawn mob after set duration
  int16     m_mobModStat[MAX_MOBMODIFIER];           // mob specific mods
  int16     m_mobModStatSave[MAX_MOBMODIFIER];       // saved state
};

#endif
