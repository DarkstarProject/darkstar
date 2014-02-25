/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#define MOB_TP_USE_CHANCE 30 // 30% chance to use tp if over 100

enum SPAWNTYPE
{
	SPAWNTYPE_NORMAL		= 0x00,     // 00:00-24:00
	SPAWNTYPE_ATNIGHT		= 0x01,     // 20:00-04:00
	SPAWNTYPE_ATEVENING		= 0x02,     // 18:00-06:00
	SPAWNTYPE_WEATHER		= 0x04,
	SPAWNTYPE_FOG			= 0x08,     // 02:00-07:00
	SPAWNTYPE_MOONPHASE		= 0x10,
	SPAWNTYPE_LOTTERY		= 0x20,
	SPAWNTYPE_WINDOWED		= 0x40,     // понятия не имею, что это ^^
	SPAWNTYPE_SCRIPTED		= 0x80
};

enum SPECIALFLAG
{
  SPECIALFLAG_NONE = 0x0,
  SPECIALFLAG_HIDDEN = 0x1 // only use special when hidden
};

enum ROAMFLAG : uint16
{
  ROAMFLAG_NONE = 0x0,
  ROAMFLAG_SMALL = 0x01, // move around less than 5
  ROAMFLAG_MEDIUM = 0x02, // move around 10-20
  ROAMFLAG_LARGE = 0x04, // move around 15-25
  ROAMFLAG_WANDER = 0x08, // roam to multiple points in a row
  ROAMFLAG_SCOUT = 0x10, // move around more often
  ROAMFLAG_GUARD = 0x20, // move less often
  ROAMFLAG_WORM = 0x40, // pop up and down when moving
  ROAMFLAG_AMBUSH = 0x80, // stays hidden until someone comes close (antlion)
  ROAMFLAG_EVENT = 0x100, // calls lua method for roaming logic
  ROAMFLAG_IGNORE = 0x200 // ignore all hate, except linking hate
};

enum MOBTYPE
{
	MOBTYPE_NORMAL			= 0x00,
	MOBTYPE_PCSPAWNED		= 0x01,
	MOBTYPE_NOTORIOUS		= 0x02,
	MOBTYPE_FISHED			= 0x04,
	MOBTYPE_CALLED			= 0x08,
	MOBTYPE_BATTLEFIELD		= 0x10,
	MOBTYPE_EVENT			= 0x20
};

enum BEHAVIOUR : uint16
{
	BEHAVIOUR_NONE				= 0x00,
	BEHAVIOUR_AGGRO_SIGHT		= 0x01,
	BEHAVIOUR_AGGRO_HEARING		= 0x02,
	BEHAVIOUR_AGGRO_LOWHP		= 0x04,
	BEHAVIOUR_AGGRO_TRUEHEARING	= 0x08,
	BEHAVIOUR_AGGRO_TRUESIGHT	= 0x10,
	BEHAVIOUR_AGGRO_MAGIC		= 0x20,
	BEHAVIOUR_AGGRO_WEAPONSKILL	= 0x40,
    BEHAVIOUR_AGGRO_JOBABILITY  = 0x80,
    BEHAVIOUR_SCENT             = 0x100,
    BEHAVIOUR_AGGRO_AMBUSH      = 0x200,
    BEHAVIOUR_NO_TURN           = 0x400
};


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CMobEntity : public CBattleEntity
{
public:

  bool        m_AllowRespawn;						// монстру разрешено возрождаться
  uint32		m_RespawnTime;						// отрезок времени, через который монстр возрождается после смерти
  uint32      m_DropItemTime;						// время анимации смерти монстра

  uint32    m_DropID;             // номер группы оставляемых монстром предметов после смерти

  uint8   m_minLevel;             // минимально-возможный  уровень монстра
  uint8   m_maxLevel;             // максимально-возможный уровень монстра
  uint32      HPmodifier;             // HP in Database (mob_groups)
  uint32      MPmodifier;             // MP in Database (mob_groups)

  float       HPscale;                // HP boost percentage
  float       MPscale;                // MP boost percentage

  uint16 m_roamFlags; // defines its roaming behaviour
  uint8 m_specialFlags; // flags for special skill

  bool m_StatPoppedMobs; // true if dyna statue has popped mobs
  
  // stat ranks
  uint8        strRank;
  uint8        dexRank;
  uint8        vitRank;
  uint8        agiRank;
  uint8        intRank;
  uint8        mndRank;
  uint8        chrRank;
  uint8        attRank;
  uint8        defRank;
  uint8        accRank;
  uint8        evaRank; // not used

  // aggro ranges
  bool  m_disableScent; // stop detecting by scent
  float m_maxRoamDistance; // maximum distance mob can be from spawn

  uint8   m_Type;               // тип монстра
  uint8       m_Link;               // взаимопомощь монстрам своего семейства
  uint16    m_Behaviour;            // поведение монстра в различных ситуациях
  SPAWNTYPE m_SpawnType;            // условие появления монстра
  uint32    m_extraVar;             // extra variable to store combat related variables from scripts

	uint8		m_CallForHelp;						// в перспективе желательно объединить эту переменную с CNpc->unknown

  int8        m_instanceID; // instance belonging to
  uint16      m_bcnmID;  // belongs to which battlefield
  bool        m_giveExp; // prevent exp gain
  bool        m_neutral; // stop linking / aggroing
	position_t	m_SpawnPoint;						// точка возрождения монстра
	uint8       m_Element;
	uint8       m_HiPCLvl;							// Highest Level of Player Character that hit the Monster
	uint8       m_THLvl;							// Highest Level of Treasure Hunter that apply to drops
	uint32		m_THPCID;							// ID of last PC that hit the NPC and apply TH onto the NPC
	bool        m_ItemStolen;                       // if true, mob has already been robbed. reset on respawn. also used for thf maat fight
	uint16		m_Family;
  uint32    m_Pool;               // pool the mob came from
	CMobSpellList*      m_SpellListContainer;				// The spells list container for this mob
	std::map<uint16, uint16>	m_UsedSkillIds;		// mob skill ids used (key) along with mob level (value)

  uint32      m_unknown;							// includes the CFH flag and whether the HP bar should be shown or not (e.g. Yilgeban doesnt)
  uint8       m_name_prefix;						// The ding bats VS Ding bats

	CEnmityContainer* PEnmityContainer;				// система ненависти монстров

  bool        hasRageMode();						// If the mob has the rage mode: true
  void        addRageMode();						// Rage mode ON:  stat x10
  void        delRageMode();						// Rage mode OFF: stat /10

  bool  IsFarFromHome(); // check if mob is too far from spawn
  bool  CanBeNeutral(); // check if mob can have killing pause
  bool  CanDetectTarget(CBattleEntity* PTarget, bool forceSight = false); // can I detect the target?

	void		SetMainSkin(uint32 mobid);			// Set base skin for the mob (if mob or player dieing)
	void		SetNewSkin(uint8 skinid);			// Set new skin for the mob
	uint32		GetSkinID();						// Get the last skinid (0 for base skin)

  uint8       TPUseChance(); // return % chance to use TP move

  void        ChangeMJob(uint16 job); // this will change jobs and update traits, stats, spells

  bool        CanDeaggro();
  uint32      GetDespawnTimer();
  void        SetDespawnTimer(uint32 duration);
  uint32      GetRandomGil(); // returns a random amount of gil
  bool        CanRoamHome(); // is it possible for me to walk back?
  bool        CanRoam(); // check if mob can walk around
  bool        CanLink(position_t* pos, int16 superLink = 0);
  bool        CanDropGil(); // mob has gil to drop

  CMobSpellContainer* SpellContainer;   // retrieves spells for the mob
  uint8		m_HasSpellScript;					// 1 if they have a spell script to use for working out what to cast.

  void setMobMod(uint16 type, int16 value);
  int16 getMobMod(uint16 type);
  void addMobMod(uint16 type, int16 value);
  void defaultMobMod(uint16 type, int16 value); // set value if value has not been already set
  void resetMobMod(uint16 type); // resets mob mod to original value
  int32 getBigMobMod(uint16 type); // multiplies mod by 1000
  void        saveMobModifiers(); // save current state of modifiers
  void        restoreMobModifiers(); // restore to saved state

  void      HideModel(bool hide); // hide / show model
  bool      IsModelHidden();

  CMobEntity();
  ~CMobEntity();

private:

  bool        m_RageMode;             // Mode rage
  bool		m_NewSkin;				// True if skin has changed
  uint32		m_SkinID;				// Skinid
  uint32      m_DespawnTimer;         // Despawn Timer to despawn mob after set duration
  int16   m_mobModStat[MAX_MOBMODIFIER];  // mob specific mods
  int16   m_mobModStatSave[MAX_MOBMODIFIER];  // saved state
};

#endif
