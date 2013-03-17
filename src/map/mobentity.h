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

#ifndef _MOBENTITY_H
#define _MOBENTITY_H

#include "battleentity.h"
#include "enmity_container.h"
#include "mobutils.h"

#include "mob_spell_container.h"
#include "mob_spell_list.h"

// forward declaration
class CMobSpellContainer;

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

enum BEHAVIOUR
{
	BEHAVIOUR_NONE				= 0x00,
	BEHAVIOUR_AGGRO_SIGHT		= 0x01,
	BEHAVIOUR_AGGRO_HEARING		= 0x02,
	BEHAVIOUR_AGGRO_LOWHP		= 0x04,
	BEHAVIOUR_AGGRO_TRUEHEARING	= 0x08,
	BEHAVIOUR_AGGRO_TRUESIGHT	= 0x10,
	BEHAVIOUR_AGGRO_MAGIC		= 0x20,
	BEHAVIOUR_AGGRO_WEAPONSKILL	= 0x40,
	BEHAVIOUR_AGGRO_JOBABILITY	= 0x80,
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
    uint32      m_MagicRecastTime;                  // Amount of time between casts.
	uint32		m_RangedCoolDown;					// Amount of time between ranged attacks.

	uint32		m_DropID;							// номер группы оставляемых монстром предметов после смерти

	uint8		m_minLevel;							// минимально-возможный  уровень монстра
	uint8		m_maxLevel;							// максимально-возможный уровень монстра
    uint32      HPmodifier;							// HP in Database (mob_groups)
    uint32      MPmodifier;							// MP in Database (mob_groups)

    float       HPstat;								// HP boost percentage
    float       MPstat;								// MP boost percentage
    uint8       linkRadius;                         // mobs have different link radiuses

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

    // not used
    uint8        evaRank;

	uint8		m_Type;								// тип монстра
    uint8       m_Link;								// взаимопомощь монстрам своего семейства
	uint16		m_Behaviour;						// поведение монстра в различных ситуациях
	SPAWNTYPE	m_SpawnType;						// условие появления монстра
	uint32		m_extraVar;							// extra variable to store combat related variables from scripts

	uint8		m_CallForHelp;						// в перспективе желательно объединить эту переменную с CNpc->unknown

	position_t	m_SpawnPoint;						// точка возрождения монстра
	uint8       m_Element;
	uint8       m_HiPCLvl;							// Highest Level of Player Character that hit the Monster
	uint8       m_THLvl;							// Highest Level of Treasure Hunter that apply to drops
	uint32		m_THPCID;							// ID of last PC that hit the NPC and apply TH onto the NPC
	uint16		m_Family;
	uint8		m_SkillStatus;						// status of skills (used 2h/used epic tp move/etc)
	CMobSpellList*      m_SpellListContainer;				// The spells list container for this mob
	std::map<uint16, uint16>	m_UsedSkillIds;		// mob skill ids used (key) along with mob level (value)

    uint32      m_unknown;							// includes the CFH flag and whether the HP bar should be shown or not (e.g. Yilgeban doesnt)
    uint8       m_name_prefix;						// The ding bats VS Ding bats

	CEnmityContainer* PEnmityContainer;				// система ненависти монстров

    bool        hasRageMode();						// If the mob has the rage mode: true
    void        addRageMode();						// Rage mode ON:  stat x10
    void        delRageMode();						// Rage mode OFF: stat /10

	void		SetMainSkin(uint32 mobid);			// Set base skin for the mob (if mob or player dieing)
	void		SetNewSkin(uint8 skinid);			// Set new skin for the mob
	uint32		GetSkinID();						// Get the last skinid (0 for base skin)

    uint8       TPUseChance(); // return % chance to use TP move
    bool        HasRanged(); // check if mob has ranged weapon
    void        ChangeMJob(uint16 job); // this will change jobs and update traits, stats, spells
    bool        CanDeaggro();
    uint32      GetDespawnTimer();
    void        SetDespawnTimer(uint32 duration);
    uint32      GetRandomGil(); // returns a random amount of gil

    CMobSpellContainer* SpellContainer;   // retrieves spells for the mob
	uint8		m_HasSpellScript;					// 1 if they have a spell script to use for working out what to cast.

    CMobEntity();
   ~CMobEntity();

private:

    bool        m_RageMode;             // Mode rage
	bool		m_NewSkin;				// True if skin has changed
	uint32		m_SkinID;				// Skinid
    uint32      m_DespawnTimer;         // Despawn Timer to despawn mob after set duration

};

#endif