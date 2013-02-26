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

#ifndef _BATTLEENTITY_H
#define _BATTLEENTITY_H

#include <vector>

#include "ai/ai_general.h"

#include "items/item_weapon.h"

#include "baseentity.h"
#include "trait.h"
#include "modifier.h"
#include "party.h"
#include "status_effect_container.h"
#include "map.h"


enum ECOSYSTEM
{
	SYSTEM_ERROR			= 0,
	SYSTEM_AMORPH			= 1,
	SYSTEM_AQUAN			= 2,
	SYSTEM_ARCANA			= 3,
	SYSTEM_ARCHAICMACHINE	= 4,
	SYSTEM_AVATAR			= 5,
	SYSTEM_BEAST			= 6,
	SYSTEM_BEASTMEN			= 7,
	SYSTEM_BIRD				= 8,
	SYSTEM_DEMON			= 9,
	SYSTEM_DRAGON			= 10,
	SYSTEM_ELEMENTAL		= 11,
	SYSTEM_EMPTY			= 12,
	SYSTEM_HUMANOID			= 13,
	SYSTEM_LIZARD			= 14,
	SYSTEM_LUMORIAN			= 15,
	SYSTEM_LUMINION			= 16,
	SYSTEM_PLANTOID			= 17,
	SYSTEM_UNCLASSIFIED		= 18,
	SYSTEM_UNDEAD			= 19,
	SYSTEM_VERMIN			= 20,
	SYSTEM_VORAGEAN			= 21,
};

#define MAX_MOB_FAMILY	900

enum JOBTYPE
{
	JOB_NON				= 0,
	JOB_WAR				= 1,
	JOB_MNK				= 2,
	JOB_WHM				= 3,
	JOB_BLM				= 4,
	JOB_RDM				= 5,
	JOB_THF				= 6,
	JOB_PLD				= 7,
	JOB_DRK				= 8,
	JOB_BST				= 9,
	JOB_BRD				= 10,
	JOB_RNG				= 11,
	JOB_SAM				= 12,
	JOB_NIN				= 13,
	JOB_DRG				= 14,
	JOB_SMN				= 15,
	JOB_BLU				= 16,
	JOB_COR				= 17,
	JOB_PUP				= 18,
	JOB_DNC				= 19,
	JOB_SCH				= 20
};

#define MAX_JOBTYPE		21

enum SKILLTYPE
{
    SKILL_NON           = 0,
	SKILL_H2H			= 1,
	SKILL_DAG			= 2,
	SKILL_SWD			= 3,
	SKILL_GSD			= 4,
	SKILL_AXE			= 5,
	SKILL_GAX			= 6,
	SKILL_SYH			= 7,
	SKILL_POL			= 8,
	SKILL_KAT			= 9,
	SKILL_GKT			= 10,
	SKILL_CLB			= 11,
	SKILL_STF			= 12,

	SKILL_GUN			= 20,
	SKILL_CNN			= 21,
	SKILL_ARC			= 25,
	SKILL_MRK			= 26,
	SKILL_THR			= 27,
	SKILL_GRD			= 28,
	SKILL_EVA			= 29,
	SKILL_SHL			= 30,
	SKILL_PAR			= 31,
	SKILL_DIV			= 32,
	SKILL_HEA			= 33,
	SKILL_ENH			= 34,
	SKILL_ENF			= 35,
	SKILL_ELE			= 36,
	SKILL_DRK			= 37,
	SKILL_SUM			= 38,
	SKILL_NIN			= 39,
	SKILL_SNG			= 40,
	SKILL_STR			= 41,
	SKILL_WND			= 42,
	SKILL_BLU			= 43,

	SKILL_FSH			= 48,
	SKILL_WDW			= 49,
	SKILL_SMT			= 50,
	SKILL_GLD			= 51,
	SKILL_CLT			= 52,
	SKILL_LTH			= 53,
	SKILL_BON			= 54,
	SKILL_ALC			= 55,
	SKILL_COK			= 56,
	SKILL_SYN			= 57,
	SKILL_RID			= 58
};

#define MAX_SKILLTYPE	64

enum SUBSKILLTYPE
{
    SUBSKILL_XBO        = 0,
	SUBSKILL_GUN		= 1,
	SUBSKILL_CNN		= 2
};

#define MAX_SUBSKILLTYPE	4

// ячейки экипировки. монстры используют лишь первые четыре, персонаж использует все

enum SLOTTYPE
{
	SLOT_MAIN	= 0x00,
	SLOT_SUB	= 0x01,
	SLOT_RANGED	= 0x02,
	SLOT_AMMO	= 0x03,
	SLOT_HEAD	= 0x04,
	SLOT_BODY	= 0x05,
	SLOT_HANDS	= 0x06,
	SLOT_LEGS	= 0x07,
	SLOT_FEET	= 0x08,
	SLOT_NECK	= 0x09,
	SLOT_WAIST	= 0x0A,
	SLOT_EAR1	= 0x0B,
	SLOT_EAR2	= 0x0C,
	SLOT_RING1	= 0x0D,
	SLOT_RING2	= 0x0E,
	SLOT_BACK	= 0x0F,
	SLOT_LINK	= 0x10
};

// CROSSBOW и GUN - это Piercing, разделение сделано из-за одинакового skilltype
// для возможности различить эти орудия при экипировке и избавиться от ошибки
// использования пуль с арбалетом и арбалетных стрел с огнестрельным оружием (только персонажи)

enum DAMAGETYPE
{
	DAMAGE_NONE				= 0,
	DAMAGE_PIERCING			= 1,
	DAMAGE_SLASHING			= 2,
	DAMAGE_IMPACT			= 3,
	DAMAGE_HTH				= 4,
	DAMAGE_CROSSBOW			= 5,
	DAMAGE_GUN				= 6
};

enum REACTION
{
	REACTION_NONE			= 0x00,		// отсутствие реакции
	REACTION_MISS			= 0x01,		// промах
	REACTION_PARRY			= 0x03,		// блокирование оружием (MISS + PARRY)
	REACTION_BLOCK			= 0x04,		// блокирование щитом
	REACTION_HIT			= 0x08,		// попадание
	REACTION_EVADE			= 0x09,		// уклонение (MISS + HIT)
	REACTION_GUARD			= 0x14,		// mnk guard (20 dec)
};

enum SPECEFFECT
{
	SPECEFFECT_NONE			= 0x00,
	SPECEFFECT_BLOOD		= 0x02,
	SPECEFFECT_HIT			= 0x10,
	SPECEFFECT_RAISE		= 0x11,
	SPECEFFECT_RECOIL		= 0x20,
	SPECEFFECT_CRITICAL_HIT	= 0x22
};

enum SUBEFFECT
{
    //ATTACK

	//flag 1
	SUBEFFECT_ICE_DAMAGE		 = 1,	// 101000	 5
	SUBEFFECT_EARTH_DAMAGE		 = 2,	// 100100	 9
	SUBEFFECT_WATER_DAMAGE		 = 3,	// 101100	13
	SUBEFFECT_DARKNESS_DAMAGE	 = 4,	// 100010	17
	SUBEFFECT_POISON			 = 5,	// 101010	21
	SUBEFFECT_BLIND				 = 6,	// 100110	25
	SUBEFFECT_PETRIFY			 = 7,
	//8 paralyze?
	SUBEFFECT_DEFENSE_DOWN		 = 9,	// 101001	37
	SUBEFFECT_SHIELD			 = 10,
	SUBEFFECT_BLOOD_WEAPON		 = 11,

	//flag 2
	SUBEFFECT_BLAZE_SPIKES		= 1,	// 011000	 6
	SUBEFFECT_ICE_SPIKES		= 2,	// 010100	10
	SUBEFFECT_DREAD_SPIKES		= 3,	// 011100	14
	SUBEFFECT_CURSE_SPIKES		= 4,	// 010010	18
	SUBEFFECT_SHOCK_SPIKES		= 5, 	// 011010	22
	SUBEFFECT_REPRISAL		 	= 6,	// 010110	26

	//flag 3
	SUBEFFECT_FIRE_DAMAGE		= 0,	// 110000	 3
	SUBEFFECT_WIND_DAMAGE		= 1,	// 111000	 7
	SUBEFFECT_LIGHTNING_DAMAGE	= 2,	// 110100	11
	SUBEFFECT_LIGHT_DAMAGE		= 3,	// 111100	15
	SUBEFFECT_SLEEP				= 4,	// 110010	19
	// 5 dark?
	SUBEFFECT_STUN = 6,
	SUBEFFECT_CURSE = 7,
	SUBEFFECT_IMPAIRS_EVASION = 8,
	// 9 weight? or evasion down?
	SUBEFFECT_HP_DRAIN			= 10,	// 110101	43
	// 11 drain tp or attribute drain

	//SKILLCHAINS

	//flag 1
	SUBEFFECT_DARKNESS          = 1,
	SUBEFFECT_FRAGMENTATION     = 2,
	SUBEFFECT_FUSION            = 3,
	SUBEFFECT_LIQUEFACATION     = 4,
	SUBEFFECT_REVERBERATION     = 5,
	SUBEFFECT_SCISSION			= 6,
	SUBEFFECT_IMPACTION			= 7,

	//flag 3
	SUBEFFECT_LIGHT				= 10,   // 0
	SUBEFFECT_GRAVITATION		= 11,   // 1
	SUBEFFECT_DISTORTION		= 12,   // 2
	SUBEFFECT_COMPRESSION		= 13,   // 3
	SUBEFFECT_INDURATION		= 14,   // 4
	SUBEFFECT_TRANSFIXION		= 15,   // 5
	SUBEFFECT_DETONATION		= 16,   // 6

    SUBEFFECT_NONE				= 255,

    //UNKNOWN

	SUBEFFECT_MP_DRAIN,
	SUBEFFECT_TP_DRAIN, //100
	SUBEFFECT_SILENCE,
	SUBEFFECT_PARALYSIS,
	SUBEFFECT_BIND,
	SUBEFFECT_WEIGHT,
	SUBEFFECT_WEAKENS_ATTACKS,
	SUBEFFECT_AUSPICE,
};

enum TARGETTYPE
{
	TARGET_SELF				= 0x01,
	TARGET_PLAYER_PARTY		= 0x02,
	TARGET_ENEMY			= 0x04,
	TARGET_PLAYER_ALLIANCE	= 0x08,
	TARGET_PLAYER			= 0x10,
	TARGET_PLAYER_DEAD		= 0x20,
	TARGET_NPC				= 0x40		// скорее всего подразумевается mob, выглядящий как npc и воюющий на стороне персонажа
};

enum SKILLCHAIN_ELEMENT
{
    SC_NONE          =  0, // Lv0 None

    SC_TRANSFIXION   =  1, // Lv1 Light
    SC_COMPRESSION   =  2, // Lv1 Dark
    SC_LIQUEFACTION  =  3, // Lv1 Fire
    SC_SCISSION      =  4, // Lv1 Earth
    SC_REVERBERATION =  5, // Lv1 Water
    SC_DETONATION    =  6, // Lv1 Wind
    SC_INDURATION    =  7, // Lv1 Ice
    SC_IMPACTION     =  8, // Lv1 Thunder

    SC_GRAVITATION   =  9, // Lv2 Dark & Earth
    SC_DISTORTION    = 10, // Lv2 Water & Ice
    SC_FUSION        = 11, // Lv2 Fire & Light
    SC_FRAGMENTATION = 12, // Lv2 Wind & Thunder

    SC_LIGHT         = 13, // Lv3 Fire, Light, Wind, Thunder
    SC_DARKNESS      = 14, // Lv3 Dark, Earth, Water, Ice
    SC_LIGHT_II      = 15, // Lv4 Light
    SC_DARKNESS_II   = 16, // Lv4 Darkness
};

enum IMMUNITY
{
	IMMUNITY_NONE		= 0x00,
	IMMUNITY_SLEEP		= 0x01,
	IMMUNITY_GRAVITY	= 0x02,
	IMMUNITY_BIND		= 0x04,
	IMMUNITY_STUN		= 0x08,
	IMMUNITY_SILENCE	= 0x10, // 16
	IMMUNITY_PARALYZE	= 0x20, // 32
	IMMUNITY_BLIND		= 0x40, // 64
	IMMUNITY_SLOW		= 0x80, // 128
	IMMUNITY_POISON		= 0x100, // 256
	IMMUNITY_ELEGY		= 0x200, // 512
};

#define MAX_SKILLCHAIN_LEVEL (4)
#define MAX_SKILLCHAIN_COUNT (5)

struct apAction_t
{
	CBattleEntity*	ActionTarget;		// 32 bits
	REACTION		reaction;			//  5 bits
	uint16			animation;			// 10 bits
	SPECEFFECT		speceffect;			//  9 bits
	uint16			param;				// 16 bits
	uint16			messageID;			// 10 bits
  //...
	uint8			flag;				//  2 bits
	SUBEFFECT		subeffect;			//	9 bits
	uint16			subparam;			// 14 bits
	uint16			submessageID;		// 10 bits
};

/************************************************************************
*																		*
*  TP хранится то пому же принципу, что и skill, т.е. 6,4% = 64			*
*																		*
************************************************************************/

struct health_t
{
    float   tp;                 // текущее значение
    int32   hp, mp;             // текущие значения
    int32   maxhp, maxmp;       // максимальные значения
    int32   modhp, modmp;       // модифицированные максимальные значения
};

typedef std::vector<apAction_t> ActionList_t;

class CBattleEntity : public CBaseEntity
{
public:

	health_t	    health;						// hp,mp,tp
	stats_t		    stats;						// атрибуты STR,DEX,VIT,AGI,INT,MND,CHR
	skills_t	    WorkingSkills;				// структура всех доступных сущности умений, ограниченных уровнем
	IMMUNITY		m_Immunity;					// Mob immunity
	uint16			m_magicEvasion;		// store this so it can be removed easily

    uint16          STR();
    uint16          DEX();
    uint16          VIT();
    uint16          AGI();
    uint16          INT();
    uint16          MND();
    uint16          CHR();
    uint16          DEF();
    uint16          ATT();
	uint16			ACC(uint8 attackNumber, uint8 offsetAccuracy);
    uint16          EVA();
	uint16          RATT(uint8 skill);

	uint32			charmTime;					// to hold the time entity is charmed
	bool			isCharmed;					// is the battle entity charmed?

	bool		    isDead();					// проверяем, мертва ли сущность
	bool			isInDynamis();
	bool			hasImmunity(uint32 imID);
	bool			isAsleep();

	JOBTYPE		    GetMJob();					// главная профессия
	JOBTYPE		    GetSJob();					// дополнительная профессия
	uint8		    GetMLevel();				// уровень главной профессии
	uint8		    GetSLevel();				// уровень дополнительной профессии

	void		    SetMJob(uint8 mjob);		// главная профессия
	void		    SetSJob(uint8 sjob);		// дополнительная профессия
	void		    SetMLevel(uint8 mlvl);		// уровень главной профессии
	void		    SetSLevel(uint8 slvl);		// уровень дополнительной профессии

	uint8		    GetHPP();					// количество hp в процентах
    int32           GetMaxHP();                 // максимальное количество hp
	uint8		    GetMPP();					// количество mp в процентах
    int32           GetMaxMP();                 // максимальное количество mp
    void            UpdateHealth();             // пересчет максимального количества hp и mp, а так же корректировка их текущих значений

	int16			GetWeaponDelay(bool tp);		//returns delay of combined weapons
	int16			GetRangedWeaponDelay(bool tp);	//returns delay of ranged weapon + ammo where applicable
	int16			GetAmmoDelay(bool tp);			//returns delay of ammo (for cooldown between shots)
	uint16			GetMainWeaponDmg();				//returns total main hand DMG
	uint16			GetSubWeaponDmg();				//returns total sub weapon DMG
	uint16			GetRangedWeaponDmg();			//returns total ranged weapon DMG
	uint16			GetMainWeaponRank();			//returns total main hand DMG Rank
	uint16			GetSubWeaponRank();				//returns total sub weapon DMG Rank
	uint16			GetRangedWeaponRank();			//returns total ranged weapon DMG Rank

	uint16		    GetSkill(uint16 SkillID);	// текущая величина умения (не максимальная, а ограниченная уровнем)

	virtual uint16	addTP(float tp);			// увеличиваем/уменьшаем количество tp
	virtual int32	addHP(int32 hp);			// увеличиваем/уменьшаем количество hp
	virtual int32 	addMP(int32 mp);			// увеличиваем/уменьшаем количество mp

	int16		    getMod(uint16 modID);		// величина модификатора

	void		    addModifier(uint16 type, int16 amount);
	void		    setModifier(uint16 type, int16 amount);
	void		    delModifier(uint16 type, int16 amount);
	void		    addModifiers(std::vector<CModifier*> *modList);
	void		    setModifiers(std::vector<CModifier*> *modList);
	void		    delModifiers(std::vector<CModifier*> *modList);

	uint8			m_ModelSize;			    // размер модели сущности, для расчета дальности физической атаки
	ECOSYSTEM		m_EcoSystem;			    // эко-система сущности
	CItemWeapon*	m_Weapons[4];			    // четыре основных ячейки, используемыж для хранения оружия (только оружия)

    TraitList_t       TraitList;                    // список постянно активных способностей в виде указателей

	EntityID_t	    m_OwnerID;				    // ID атакующей сущности (после смерти будет хранить ID сущности, нанесщей последний удар)

	ActionList_t	m_ActionList;			    // список совершенных действий за одну атаку (нужно будет написать структуру, включающую ActionList в которой будут категории анимации и т.д.)

	CAIGeneral*		PBattleAI;				    // интеллект боевой сущности
    CParty*			PParty;					    // описание группы, в которой состоит сущность
	CBattleEntity*	PPet;					    // питомец сущности
	CBattleEntity*	PMaster;				    // владелец/хозяин сущности (распространяется на все боевые сущности)

	CStatusEffectContainer* StatusEffectContainer;

	CBattleEntity();						// конструктор
	virtual ~CBattleEntity();						// деструктор

private:

	JOBTYPE		m_mjob;						// главная профессия
	JOBTYPE		m_sjob;						// дополнительная профессия
	uint8		m_mlvl;						// ТЕКУЩИЙ уровень главной профессии
	uint8		m_slvl;						// ТЕКУЩИЙ уровень дополнительной профессии

	int16		m_modStat[MAX_MODIFIER];	// массив модификаторов
};

#endif