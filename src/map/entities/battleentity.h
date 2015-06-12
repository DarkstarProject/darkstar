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

#ifndef _BATTLEENTITY_H
#define _BATTLEENTITY_H

#include <vector>
#include <unordered_map>

#include "../items/item_weapon.h"

#include "baseentity.h"
#include "../trait.h"
#include "../modifier.h"
#include "../party.h"
#include "../status_effect_container.h"
#include "../map.h"


enum ECOSYSTEM
{
    SYSTEM_ERROR = 0,
    SYSTEM_AMORPH = 1,
    SYSTEM_AQUAN = 2,
    SYSTEM_ARCANA = 3,
    SYSTEM_ARCHAICMACHINE = 4,
    SYSTEM_AVATAR = 5,
    SYSTEM_BEAST = 6,
    SYSTEM_BEASTMEN = 7,
    SYSTEM_BIRD = 8,
    SYSTEM_DEMON = 9,
    SYSTEM_DRAGON = 10,
    SYSTEM_ELEMENTAL = 11,
    SYSTEM_EMPTY = 12,
    SYSTEM_HUMANOID = 13,
    SYSTEM_LIZARD = 14,
    SYSTEM_LUMORIAN = 15,
    SYSTEM_LUMINION = 16,
    SYSTEM_PLANTOID = 17,
    SYSTEM_UNCLASSIFIED = 18,
    SYSTEM_UNDEAD = 19,
    SYSTEM_VERMIN = 20,
    SYSTEM_VORAGEAN = 21,
};

enum JOBTYPE
{
    JOB_NON = 0,
    JOB_WAR = 1,
    JOB_MNK = 2,
    JOB_WHM = 3,
    JOB_BLM = 4,
    JOB_RDM = 5,
    JOB_THF = 6,
    JOB_PLD = 7,
    JOB_DRK = 8,
    JOB_BST = 9,
    JOB_BRD = 10,
    JOB_RNG = 11,
    JOB_SAM = 12,
    JOB_NIN = 13,
    JOB_DRG = 14,
    JOB_SMN = 15,
    JOB_BLU = 16,
    JOB_COR = 17,
    JOB_PUP = 18,
    JOB_DNC = 19,
    JOB_SCH = 20,
    JOB_GEO = 21,
    JOB_RUN = 22
};

#define MAX_JOBTYPE		23

enum SKILLTYPE
{
    SKILL_NON = 0,
    SKILL_H2H = 1,
    SKILL_DAG = 2,
    SKILL_SWD = 3,
    SKILL_GSD = 4,
    SKILL_AXE = 5,
    SKILL_GAX = 6,
    SKILL_SYH = 7,
    SKILL_POL = 8,
    SKILL_KAT = 9,
    SKILL_GKT = 10,
    SKILL_CLB = 11,
    SKILL_STF = 12,
    // 13~21 unused
    SKILL_AME = 22,
    SKILL_ARA = 23,
    SKILL_AMA = 24,
    SKILL_ARC = 25,
    SKILL_MRK = 26,
    SKILL_THR = 27,
    SKILL_GRD = 28,
    SKILL_EVA = 29,
    SKILL_SHL = 30,
    SKILL_PAR = 31,
    SKILL_DIV = 32,
    SKILL_HEA = 33,
    SKILL_ENH = 34,
    SKILL_ENF = 35,
    SKILL_ELE = 36,
    SKILL_DRK = 37,
    SKILL_SUM = 38,
    SKILL_NIN = 39,
    SKILL_SNG = 40,
    SKILL_STR = 41,
    SKILL_WND = 42,
    SKILL_BLU = 43,
    SKILL_GEO = 44,
    SKILL_HND = 45,
    // 46~47 unused
    SKILL_FISHING = 48,
    SKILL_WOODWORKING = 49,
    SKILL_SMITHING = 50,
    SKILL_GOLDSMITHING = 51,
    SKILL_CLOTHCRAFT = 52,
    SKILL_LEATHERCRAFT = 53,
    SKILL_BONECRAFT = 54,
    SKILL_ALCHEMY = 55,
    SKILL_COOKING = 56,
    SKILL_SYNERGY = 57,
    SKILL_RID = 58,
    SKILL_DIG = 59
};

#define MAX_SKILLTYPE	64

enum SUBSKILLTYPE
{
    SUBSKILL_XBO = 0,
    SUBSKILL_GUN = 1,
    SUBSKILL_CNN = 2,

    SUBSKILL_ANI = 10,

    SUBSKILL_SHEEP = 21,
    SUBSKILL_HARE = 22,
    SUBSKILL_CRAB = 23,
    SUBSKILL_CARRIE = 24,
    SUBSKILL_HOMUNCULUS = 25,
    SUBSKILL_FLYTRAP = 26,
    SUBSKILL_TIGER = 27,
    SUBSKILL_BILL = 28,
    SUBSKILL_EFT = 29,
    SUBSKILL_LIZARD = 30,
    SUBSKILL_MAYFLY = 31,
    SUBSKILL_FUNGUAR = 32,
    SUBSKILL_BEETLE = 33,
    SUBSKILL_ANTLION = 34,
    SUBSKILL_MITE = 35,
    SUBSKILL_MELODIA = 36,
    SUBSKILL_STEFFI = 37,
    SUBSKILL_BEN = 38,
    SUBSKILL_SIRAVARDE = 39,
    SUBSKILL_COMO = 40,
    SUBSKILL_OROB = 41,
    SUBSKILL_AUDREY = 42,
    SUBSKILL_ALLIE = 43,
    SUBSKILL_LARS = 44,
    SUBSKILL_GALAHAD = 45,
    SUBSKILL_CHUCKY = 46,
    SUBSKILL_SABOTENDER = 47,
    SUBSKILL_CLYVONNE = 49,
    SUBSKILL_SHASRA = 50,
    SUBSKILL_LULUSH = 51,
    SUBSKILL_FARGANN = 52,
    SUBSKILL_LOUISE = 53,
    SUBSKILL_SIEGHARD = 54,
    SUBSKILL_YULY = 55,
    SUBSKILL_MERLE = 56,
    SUBSKILL_NAZUNA = 57,
    SUBSKILL_CETAS = 58,
    SUBSKILL_ANNA = 59,
    SUBSKILL_JULIO = 60,
    SUBSKILL_BRONCHA = 61,
    SUBSKILL_GERARD = 62,
    SUBSKILL_HOBS = 63,
    SUBSKILL_FALCORR = 64,
    SUBSKILL_RAPHIE = 65,
    SUBSKILL_MAC = 66,
    SUBSKILL_SILAS = 67,
    SUBSKILL_TOLOI = 68
};

// ячейки экипировки. монстры используют лишь первые четыре, персонаж использует все

enum SLOTTYPE
{
    SLOT_MAIN = 0x00,
    SLOT_SUB = 0x01,
    SLOT_RANGED = 0x02,
    SLOT_AMMO = 0x03,
    SLOT_HEAD = 0x04,
    SLOT_BODY = 0x05,
    SLOT_HANDS = 0x06,
    SLOT_LEGS = 0x07,
    SLOT_FEET = 0x08,
    SLOT_NECK = 0x09,
    SLOT_WAIST = 0x0A,
    SLOT_EAR1 = 0x0B,
    SLOT_EAR2 = 0x0C,
    SLOT_RING1 = 0x0D,
    SLOT_RING2 = 0x0E,
    SLOT_BACK = 0x0F,
    SLOT_LINK1 = 0x10,
    SLOT_LINK2 = 0x11,
};

// CROSSBOW и GUN - это Piercing, разделение сделано из-за одинакового skilltype
// для возможности различить эти орудия при экипировке и избавиться от ошибки
// использования пуль с арбалетом и арбалетных стрел с огнестрельным оружием (только персонажи)

enum DAMAGETYPE
{
    DAMAGE_NONE = 0,
    DAMAGE_PIERCING = 1,
    DAMAGE_SLASHING = 2,
    DAMAGE_IMPACT = 3,
    DAMAGE_HTH = 4,
    DAMAGE_CROSSBOW = 5,
    DAMAGE_GUN = 6
};

enum REACTION
{
    REACTION_NONE = 0x00,		// отсутствие реакции
    REACTION_MISS = 0x01,		// промах
    REACTION_PARRY = 0x03,		// блокирование оружием (MISS + PARRY)
    REACTION_BLOCK = 0x04,		// блокирование щитом
    REACTION_HIT = 0x08,		// попадание
    REACTION_EVADE = 0x09,		// уклонение (MISS + HIT)
    REACTION_GUARD = 0x14,		// mnk guard (20 dec)
};

enum SPECEFFECT
{
    SPECEFFECT_NONE = 0x00,
    SPECEFFECT_BLOOD = 0x02,
    SPECEFFECT_HIT = 0x10,
    SPECEFFECT_RAISE = 0x11,
    SPECEFFECT_RECOIL = 0x20,
    SPECEFFECT_CRITICAL_HIT = 0x22
};

enum SUBEFFECT
{
    // ATTACK
    SUBEFFECT_FIRE_DAMAGE = 1,  // 110000     3
    SUBEFFECT_ICE_DAMAGE = 2,  // 1-01000    5
    SUBEFFECT_WIND_DAMAGE = 3,  // 111000     7
    SUBEFFECT_EARTH_DAMAGE = 4,  // 1-00100    9
    SUBEFFECT_LIGHTNING_DAMAGE = 5,  // 110100    11
    SUBEFFECT_WATER_DAMAGE = 6,  // 1-01100   13
    SUBEFFECT_LIGHT_DAMAGE = 7,  // 111100    15
    SUBEFFECT_DARKNESS_DAMAGE = 8,  // 1-00010   17
    SUBEFFECT_SLEEP = 9,  // 110010    19
    SUBEFFECT_POISON = 10, // 1-01010   21
    SUBEFFECT_PARALYSIS = 11,
    SUBEFFECT_BLIND = 12, // 1-00110   25
    SUBEFFECT_SILENCE = 13,
    SUBEFFECT_PETRIFY = 14,
    SUBEFFECT_PLAGUE = 15,
    SUBEFFECT_STUN = 16,
    SUBEFFECT_CURSE = 17,
    SUBEFFECT_DEFENSE_DOWN = 18, // 1-01001   37
    SUBEFFECT_DEATH = 19,
    SUBEFFECT_SHIELD = 20,
    SUBEFFECT_HP_DRAIN = 21, // 1-10101   43  This is retail correct animation
    SUBEFFECT_MP_DRAIN = 22, // This is retail correct animation
    SUBEFFECT_TP_DRAIN = 22, // Pretty sure this is correct, but might use same animation as HP drain.
    SUBEFFECT_HASTE = 23,

    // SPIKES
    SUBEFFECT_BLAZE_SPIKES = 1,  // 01-1000    6
    SUBEFFECT_ICE_SPIKES = 2,  // 01-0100   10
    SUBEFFECT_DREAD_SPIKES = 3,  // 01-1100   14
    SUBEFFECT_CURSE_SPIKES = 4,  // 01-0010   18
    SUBEFFECT_SHOCK_SPIKES = 5,  // 01-1010   22
    SUBEFFECT_REPRISAL = 6,  // 01-0110   26
    SUBEFFECT_WIND_SPIKES = 7,  // Present in client but currently unused.
    SUBEFFECT_STONE_SPIKES = 8,  // Present in client but currently unused.
    SUBEFFECT_DELUGE_SPIKES = 9,  // Present in client but currently unused.
    SUBEFFECT_COUNTER = 63, // Also used by Retaliation

    // SKILLCHAINS
    SUBEFFECT_LIGHT = 1,
    SUBEFFECT_DARKNESS = 2,
    SUBEFFECT_GRAVITATION = 3,
    SUBEFFECT_FRAGMENTATION = 4,
    SUBEFFECT_DISTORTION = 5,
    SUBEFFECT_FUSION = 6,
    SUBEFFECT_COMPRESSION = 7,
    SUBEFFECT_LIQUEFACATION = 8,
    SUBEFFECT_INDURATION = 9,
    SUBEFFECT_REVERBERATION = 10,
    SUBEFFECT_TRANSFIXION = 11,
    SUBEFFECT_SCISSION = 12,
    SUBEFFECT_DETONATION = 13,
    SUBEFFECT_IMPACTION = 14,

    SUBEFFECT_NONE = 0,

    // UNKNOWN
    SUBEFFECT_IMPAIRS_EVASION,
    SUBEFFECT_BIND,
    SUBEFFECT_WEIGHT,
    SUBEFFECT_AUSPICE
};

enum TARGETTYPE
{
    TARGET_SELF = 0x01,
    TARGET_PLAYER_PARTY = 0x02,
    TARGET_ENEMY = 0x04,
    TARGET_PLAYER_ALLIANCE = 0x08,
    TARGET_PLAYER = 0x10,
    TARGET_PLAYER_DEAD = 0x20,
    TARGET_NPC = 0x40,		// скорее всего подразумевается mob, выглядящий как npc и воюющий на стороне персонажа
    TARGET_PLAYER_PARTY_PIANISSIMO = 0x80
};

enum SKILLCHAIN_ELEMENT
{
    SC_NONE = 0, // Lv0 None

    SC_TRANSFIXION = 1, // Lv1 Light
    SC_COMPRESSION = 2, // Lv1 Dark
    SC_LIQUEFACTION = 3, // Lv1 Fire
    SC_SCISSION = 4, // Lv1 Earth
    SC_REVERBERATION = 5, // Lv1 Water
    SC_DETONATION = 6, // Lv1 Wind
    SC_INDURATION = 7, // Lv1 Ice
    SC_IMPACTION = 8, // Lv1 Thunder

    SC_GRAVITATION = 9, // Lv2 Dark & Earth
    SC_DISTORTION = 10, // Lv2 Water & Ice
    SC_FUSION = 11, // Lv2 Fire & Light
    SC_FRAGMENTATION = 12, // Lv2 Wind & Thunder

    SC_LIGHT = 13, // Lv3 Fire, Light, Wind, Thunder
    SC_DARKNESS = 14, // Lv3 Dark, Earth, Water, Ice
    SC_LIGHT_II = 15, // Lv4 Light
    SC_DARKNESS_II = 16, // Lv4 Darkness
};

#define MAX_SKILLCHAIN_LEVEL (4)
#define MAX_SKILLCHAIN_COUNT (5)

enum IMMUNITY : uint16
{
    IMMUNITY_NONE = 0x00,
    IMMUNITY_SLEEP = 0x01,
    IMMUNITY_GRAVITY = 0x02,
    IMMUNITY_BIND = 0x04,
    IMMUNITY_STUN = 0x08,
    IMMUNITY_SILENCE = 0x10,  // 16
    IMMUNITY_PARALYZE = 0x20,  // 32
    IMMUNITY_BLIND = 0x40,  // 64
    IMMUNITY_SLOW = 0x80,  // 128
    IMMUNITY_POISON = 0x100, // 256
    IMMUNITY_ELEGY = 0x200, // 512
    IMMUNITY_REQUIEM = 0x400, // 1024
};

struct apAction_t
{
    CBattleEntity*    ActionTarget;		    // 32 bits
    REACTION		  reaction;			    //  5 bits
    uint16			  animation;			// 12 bits
    SPECEFFECT		  speceffect;			// 7 bits
    uint8             knockback;            // 3 bits
    int32			  param;				// 17 bits
    uint16			  messageID;			// 10 bits
    SUBEFFECT         additionalEffect;     // 10 bits
    int32             addEffectParam;       // 17 bits
    uint16            addEffectMessage;     // 10 bits
    SUBEFFECT         spikesEffect;         // 10 bits
    uint16            spikesParam;          // 14 bits
    uint16            spikesMessage;        // 10 bits

    apAction_t()
    {
        ActionTarget = nullptr;
        reaction = REACTION_NONE;
        animation = 0;
        speceffect = SPECEFFECT_NONE;
        param = 0;
        messageID = 0;
        additionalEffect = SUBEFFECT_NONE;
        addEffectParam = 0;
        addEffectMessage = 0;
        spikesEffect = SUBEFFECT_NONE;
        spikesParam = 0;
        spikesMessage = 0;
        knockback = 0;
    }

};

/************************************************************************
*																		*
*  TP хранится то пому же принципу, что и skill, т.е. 6,4% = 64			*
*																		*
************************************************************************/

struct health_t
{
    int16   tp;                 // текущее значение
    int32   hp, mp;             // текущие значения
    int32   maxhp, maxmp;       // максимальные значения
    int32   modhp, modmp;       // модифицированные максимальные значения
};

typedef std::vector<apAction_t> ActionList_t;
class CPetEntity;
class CBattleEntity : public CBaseEntity
{
public:

    health_t	    health;						// hp,mp,tp
    stats_t		    stats;						// атрибуты STR,DEX,VIT,AGI,INT,MND,CHR
    skills_t	    WorkingSkills;				// структура всех доступных сущности умений, ограниченных уровнем
    uint16		    m_Immunity;					// Mob immunity
    uint16			m_magicEvasion;		        // store this so it can be removed easily
    uint8			m_enmityRange;              // only get enmity from entities this close
    bool            m_unkillable;               //entity is not able to die (probably until some action removes this flag)

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
    uint16          RATT(uint8 skill, uint16 bonusSkill = 0);
    uint16          RACC(uint8 skill, uint16 bonusSkill = 0);

    uint8           GetSpeed();

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

    virtual int16	addTP(int16 tp);			// увеличиваем/уменьшаем количество tp
    virtual int32	addHP(int32 hp);			// увеличиваем/уменьшаем количество hp
    virtual int32 	addMP(int32 mp);			// увеличиваем/уменьшаем количество mp

    int16		    getMod(uint16 modID);		// величина модификатора

    bool            CanRest(); // checks if able to heal
    bool			Rest(float rate); // heal an amount of hp / mp

    void		    addModifier(uint16 type, int16 amount);
    void		    setModifier(uint16 type, int16 amount);
    void		    delModifier(uint16 type, int16 amount);
    void		    addModifiers(std::vector<CModifier*> *modList);
    void            addEquipModifiers(std::vector<CModifier*> *modList, uint8 itemLevel, uint8 slotid);
    void		    setModifiers(std::vector<CModifier*> *modList);
    void		    delModifiers(std::vector<CModifier*> *modList);
    void            delEquipModifiers(std::vector<CModifier*> *modList, uint8 itemLevel, uint8 slotid);
    void 		    saveModifiers(); // save current state of modifiers
    void 		    restoreModifiers(); // restore to saved state

    void            addPetModifier(uint16 type, int16 amount);
    void            setPetModifier(uint16 type, int16 amount);
    void            delPetModifier(uint16 type, int16 amount);
    void            addPetModifiers(std::vector<CModifier*> *modList);
    void            delPetModifiers(std::vector<CModifier*> *modList);
    void            applyPetModifiers(CPetEntity* PPet);
    void            removePetModifiers(CPetEntity* PPet);

    void            ForParty(std::function<void(CBattleEntity*)>);
    void            ForAlliance(std::function<void(CBattleEntity*)>);

    virtual void    addTrait(CTrait*);
    virtual void    delTrait(CTrait*);

    uint8			m_ModelSize;			    // размер модели сущности, для расчета дальности физической атаки
    ECOSYSTEM		m_EcoSystem;			    // эко-система сущности
    CItemWeapon*	m_Weapons[4];			    // четыре основных ячейки, используемыж для хранения оружия (только оружия)

    TraitList_t       TraitList;                    // список постянно активных способностей в виде указателей

    EntityID_t	    m_OwnerID;				    // ID атакующей сущности (после смерти будет хранить ID сущности, нанесщей последний удар)

    ActionList_t	m_ActionList;			    // список совершенных действий за одну атаку (нужно будет написать структуру, включающую ActionList в которой будут категории анимации и т.д.)

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

    std::unordered_map<uint16, int16>		m_modStat;	// массив модификаторов
    std::unordered_map<uint16, int16>		m_modStatSave;	// saved state
    std::unordered_map<uint16, int16>       m_petMod;
};

#endif
