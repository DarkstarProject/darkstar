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

#ifndef _CHARENTITY_H
#define _CHARENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

#include <map>
#include <deque>
#include <mutex>
#include <bitset>

#include "battleentity.h"
#include "petentity.h"

#define MAX_QUESTAREA	 11
#define MAX_QUESTID     256
#define MAX_MISSIONAREA	 15
#define MAX_MISSIONID    226

struct jobs_t
{
    std::uint32_t unlocked;				// битовая маска профессий, доступных персонажу (первый бит - дополнительная профессия)
    std::uint8_t  job[MAX_JOBTYPE];		// текущий уровень для каждой из профессий
    std::uint16_t exp[MAX_JOBTYPE];		// текущее количество опыта для каждой из профессий
    std::uint8_t  genkai;					// максимальный уровень профессий персонажа
};


struct event_t
{
    std::int32_t EventID;                  // номер события
    std::int32_t Option;                   // фиктивный возвращаемый результат

    CBaseEntity* Target;            // инициатор события

    string_t Script;                // путь к файлу, отвечающему за обработку события
    string_t Function;              // не используется

    void reset()
    {
        EventID = -1;
        Option = 0;
        Target = 0;
        Script.clear();
        Function.clear();
    }
};

struct profile_t
{
    std::uint8_t	   nation;			// принадлежность к государству
    std::uint8_t	   mhflag;			// флаг выхода из MogHouse
    std::uint16_t	   title;			// звание
    std::uint16_t     fame[15];		// известность
    std::uint8_t 	   rank[3];			// рагн в трех государствах
    std::uint32_t	   rankpoints;	    // очки ранга в трех государствах
    location_t home_point;		// точка возрождения персонажа
    std::uint8_t      campaign_allegiance;
};


struct expChain_t
{
    std::uint16_t chainNumber;
    std::uint32_t chainTime;
};

struct NationTP_t
{
    std::uint32_t		sandoria;
    std::uint32_t		bastok;
    std::uint32_t		windurst;
    std::uint32_t		ahturhgan;
    std::uint32_t		maw;
    std::uint32_t		pastsandoria;
    std::uint32_t		pastbastok;
    std::uint32_t		pastwindurst;
};


struct PetInfo_t
{
    bool		respawnPet;		// used for spawning pet on zone
    std::uint8_t		petID;			// id as in wyvern(48) , carbuncle(8) ect..
    PETTYPE		petType;		// type of pet being transfered
    std::int16_t		petHP;			// pets hp
    std::int16_t       petMP;
    float		petTP;			// pets tp
};

struct AuctionHistory_t
{
    std::uint16_t		itemid;
    std::uint8_t		stack;
    std::uint32_t		price;
    std::uint8_t		status; //e.g. if sold/not sold/on market
};

struct UnlockedAttachments_t
{
    std::uint8_t heads;
    std::uint8_t frames;
    std::uint32_t attachments[8];
};

struct GearSetMod_t
{
    std::uint8_t	modNameId;
    Mod  	modId;
    std::uint16_t	modValue;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CBasicPacket;
class CLinkshell;
class CMeritPoints;
class CCharRecastContainer;
class CLatentEffectContainer;
class CTradeContainer;
class CItemContainer;
class CUContainer;
class CItemArmor;
class CAutomatonEntity;
class CAbilityState;
class CRangeState;
class CItemState;
class CItemUsable;

typedef std::deque<CBasicPacket*> PacketList_t;
typedef std::map<std::uint32_t, CBaseEntity*> SpawnIDList_t;
typedef std::vector<EntityID_t> BazaarList_t;

class CCharEntity : public CBattleEntity
{
public:

    jobs_t					jobs;							// доступрые профессии персонажа
    keyitems_t				keys;							// таблица ключевых предметов
    event_t					m_event;						// структура для запуска событый
    skills_t				RealSkills;						// структура всех реальных умений персонажа, с точностью до 0.1 и не ограниченных уровнем
    nameflags_t				nameflags;						// флаги перед именем персонажа
    profile_t				profile;						// профиль персонажа (все, что связывает города и персонажа)
    expChain_t				expChain;						// Exp Chains
    search_t				search;							// данные и комментарий, отображаемые в окне поиска
    bazaar_t				bazaar;							// все данные, необходимые для таботы bazaar
    std::uint16_t					m_EquipFlag;					// текущие события, обрабатываемые экипировкой (потом упакую в структуру, вместе с equip[])
    std::uint16_t					m_EquipBlock;					// заблокированные ячейки экипировки
    std::uint16_t                  m_StatsDebilitation;            // Debilitation arrows
    std::uint8_t					equip[18];						//      SlotID where equipment is
    std::uint8_t					equipLoc[18];					// ContainerID where equipment is
    std::uint16_t                  styleItems[16];                 // Item IDs for items that are style locked.

    std::uint8_t					m_ZonesList[36];				// список посещенных персонажем зон
    std::bitset<1024>	    m_SpellList;				    // список изученных заклинаний
    std::uint8_t					m_TitleList[94];				// список заслуженных завний
    std::uint8_t					m_Abilities[62];				// список текущих способностей
    std::uint8_t					m_LearnedAbilities[46];			// learnable abilities (corsair rolls)
    std::bitset<49>         m_LearnedWeaponskills;          // learnable weaponskills
    std::uint8_t					m_TraitList[16];				// список постянно активных способностей в виде битовой маски
    std::uint8_t					m_PetCommands[32];				// список доступных команд питомцу
    std::uint8_t					m_WeaponSkills[32];
    questlog_t				m_questLog[MAX_QUESTAREA];		// список всех квестов
    missionlog_t			m_missionLog[MAX_MISSIONAREA];	// список миссий
    assaultlog_t			m_assaultLog;					// список assault миссий
    campaignlog_t			m_campaignLog;					// список campaing миссий
    std::uint32_t					m_lastBcnmTimePrompt;			// the last message prompt in seconds
    PetInfo_t				petZoningInfo;					// used to repawn dragoons pets ect on zone
    void					setPetZoningInfo();				// set pet zoning info (when zoning and logging out)
    void					resetPetZoningInfo();			// reset pet zoning info (when changing job ect)
    std::uint8_t					m_SetBlueSpells[20];			// The 0x200 offsetted blue magic spell IDs which the user has set. (1 byte per spell)

    UnlockedAttachments_t	m_unlockedAttachments;			// Unlocked Automaton Attachments (1 bit per attachment)
    CAutomatonEntity*       PAutomaton;                     // Automaton statistics


    // Эти миссии не нуждаются в списке пройденных, т.к. клиент автоматически
    // отображает более ранние миссии выплненными

    std::uint16_t			  m_copCurrent;					// текущая миссия Chains of Promathia
    std::uint16_t			  m_acpCurrent;					// текущая миссия A Crystalline Prophecy
    std::uint16_t			  m_mkeCurrent;					// текущая миссия A Moogle Kupo d'Etat
    std::uint16_t			  m_asaCurrent;					// текущая миссия A Shantotto Ascension

    // TODO: половина этого массива должна храниться в char_vars, а не здесь, т.к. эта информация не отображается в интерфейсе клиента и сервер не проводит с ними никаких операций

    //currency_t        m_currency;                   // conquest points, imperial standing points etc
    NationTP_t		  nationtp;						// supply tp, runic portal, campaign tp,...

    std::uint8_t             GetGender();                  // узнаем пол персонажа

    void              clearPacketList();            // отчистка PacketList
    void              pushPacket(CBasicPacket*);    // добавление копии пакета в PacketList
    void              pushPacket(std::unique_ptr<CBasicPacket>);    // push packet to packet list
    bool			  isPacketListEmpty();          // проверка размера PacketList
    CBasicPacket*	  popPacket();                  // получение первого пакета из PacketList
    PacketList_t      getPacketList();              // returns a COPY of packet list
    size_t            getPacketCount();
    void              erasePackets(std::uint8_t num);      // erase num elements from front of packet list
    virtual void      HandleErrorMessage(std::unique_ptr<CBasicPacket>&) override;

    CLinkshell*       PLinkshell1;                  // linkshell, в которой общается персонаж
    CLinkshell*       PLinkshell2;                  // linkshell 2
    CTreasurePool*	  PTreasurePool;                // сокровища, добытые с монстров
    CMeritPoints*     PMeritPoints;                 //
    bool			  MeritMode;					//If true then player is meriting

    CLatentEffectContainer* PLatentEffectContainer;

    CItemContainer*   PGuildShop;					// текущий магазин гильдии, в котором персонаж производит закупки
    CItemContainer*	  getStorage(std::uint8_t LocationID);	// получение указателя на соответствующее хранилище

    CTradeContainer*  TradeContainer;               // Container used specifically for trading.
    CTradeContainer*  Container;                    // универсальный контейнер для обмена, синтеза, магазина и т.д.
    CUContainer*	  UContainer;					// новый универсальный контейнер для обмена, синтеза, магазина и т.д.
    CTradeContainer*  CraftContainer;               // Container used for crafting actions.

    CBaseEntity*	  PWideScanTarget;				// wide scane цель

    SpawnIDList_t	  SpawnPCList;					// список видимых персонажей
    SpawnIDList_t	  SpawnMOBList;					// список видимых монстров
    SpawnIDList_t	  SpawnPETList;					// список видимых питомцев
    SpawnIDList_t	  SpawnNPCList;					// список видимых npc

    void			  SetName(int8* name);			// устанавливаем имя персонажа (имя ограничивается 15-ю символами)

    EntityID_t        TradePending;                 // ID персонажа, предлагающего обмен
    EntityID_t        InvitePending;                // ID персонажа, отправившего приглашение в группу
    EntityID_t        BazaarID;                     // Pointer to the bazaar we are browsing.
    BazaarList_t	  BazaarCustomers;              // Array holding the IDs of the current customers

    std::uint32_t			  m_InsideRegionID;				// номер региона, в котором сейчас находится персонаж (??? может засунуть в m_event ???)
    std::uint8_t			  m_LevelRestriction;			// ограничение уровня персонажа
    std::uint16_t            m_Costum;                     // карнавальный костюм персонажа (модель)
    std::uint16_t			  m_Monstrosity;				// Monstrosity model ID
    std::uint32_t			  m_AHHistoryTimestamp;			// Timestamp when last asked to view history
    std::uint32_t            m_DeathCounter;               // Counter when you last died. This is set when you first login
    std::uint32_t            m_DeathTimestamp;             // Timestamp when death counter has been saved to database

    std::uint8_t			  m_hasTractor;					// checks if player has tractor already
    std::uint8_t			  m_hasRaise;					// checks if player has raise already
    std::uint8_t             m_hasAutoTarget;              // возможность использования AutoTarget функции
    position_t		  m_StartActionPos;				// позиция начала действия (использование предмета, начало стрельбы, позиция tractor)

    std::uint32_t			  m_PlayTime;
    std::uint32_t			  m_SaveTime;

    std::uint32_t            m_LastYell;

    std::uint8_t			  m_GMlevel;                    // Level of the GM flag assigned to this character
    bool              m_isGMHidden;                 // GM Hidden flag to prevent player updates from being processed.

    std::uint8_t             m_mentor;                     // Mentor flag status.
    bool              m_isNewPlayer;                // New player flag..
    std::uint32_t            m_moghouseID;

    int8			  getShieldSize();

    bool			  getWeaponSkillKill();
    void			  setWeaponSkillKill(bool isWeaponSkillKill);
    bool              getStyleLocked();
    void              setStyleLocked(bool isStyleLocked);
    bool              getBlockingAid();
    void              setBlockingAid(bool isBlockingAid);

    bool              m_EquipSwap;					// true if equipment was recently changed
    bool              m_EffectsChanged;
    time_point        m_LastSynthTime;

    std::int16_t addTP(std::int16_t tp) override;
    std::int32_t addHP(std::int32_t hp) override;
    std::int32_t addMP(std::int32_t mp) override;

    std::vector<GearSetMod_t> m_GearSetMods;		// The list of gear set mods currently applied to the character.
    std::vector<AuctionHistory_t> m_ah_history;		// AH history list (в будущем нужно использовать UContainer)

    void SetPlayTime(std::uint32_t playTime);				// Set playtime
    std::uint32_t GetPlayTime(bool needUpdate = true);		// Get playtime

    CItemArmor*	getEquip(SLOTTYPE slot);

    void		ReloadPartyInc();
    void        ReloadPartyDec();
    bool        ReloadParty();

    void        PostTick() override;

    virtual void addTrait(CTrait*) override;
    virtual void delTrait(CTrait*) override;

    virtual bool ValidTarget(CBattleEntity* PInitiator, std::uint16_t targetFlags) override;
    virtual bool CanUseSpell(CSpell*) override;

    virtual void Die() override;
    void Die(duration);
    void Raise();

    /* State callbacks */
    virtual bool CanAttack(CBattleEntity* PTarget, std::unique_ptr<CBasicPacket>& errMsg) override;
    virtual bool OnAttack(CAttackState&, action_t&) override;
    virtual bool OnAttackError(CAttackState&) override;
    virtual CBattleEntity* IsValidTarget(std::uint16_t targid, std::uint16_t validTargetFlags, std::unique_ptr<CBasicPacket>& errMsg) override;
    virtual void OnChangeTarget(CBattleEntity* PNewTarget) override;
    virtual void OnDisengage(CAttackState&) override;
    virtual void OnCastFinished(CMagicState&, action_t&) override;
    virtual void OnCastInterrupted(CMagicState&, action_t&, MSGBASIC_ID msg) override;
    virtual void OnWeaponSkillFinished(CWeaponSkillState&, action_t&) override;
    virtual void OnAbility(CAbilityState&, action_t&) override;
    virtual void OnRangedAttack(CRangeState&, action_t&);
    virtual void OnDeathTimer() override;
    virtual void OnRaise() override;
    virtual void OnItemFinish(CItemState&, action_t&);

    CCharEntity();									// конструктор
    ~CCharEntity();									// деструктор

protected:
    bool IsMobOwner(CBattleEntity* PTarget);
    void TrackArrowUsageForScavenge(CItemWeapon* PAmmo);


private:

    std::unique_ptr<CItemContainer>   m_Inventory;
    std::unique_ptr<CItemContainer>   m_Mogsafe;
    std::unique_ptr<CItemContainer>   m_Storage;
    std::unique_ptr<CItemContainer>   m_Tempitems;
    std::unique_ptr<CItemContainer>   m_Moglocker;
    std::unique_ptr<CItemContainer>   m_Mogsatchel;
    std::unique_ptr<CItemContainer>   m_Mogsack;
    std::unique_ptr<CItemContainer>   m_Mogcase;
    std::unique_ptr<CItemContainer>   m_Wardrobe;
    std::unique_ptr<CItemContainer>   m_Mogsafe2;
    std::unique_ptr<CItemContainer>   m_Wardrobe2;
    std::unique_ptr<CItemContainer>   m_Wardrobe3;
    std::unique_ptr<CItemContainer>   m_Wardrobe4;

    bool			m_isWeaponSkillKill;
    bool            m_isStyleLocked;
    bool            m_isBlockingAid;
    bool			m_reloadParty;

    PacketList_t      PacketList;					// в этом списке хранятся все пакеты, предназначенные для отправки персонажу

    std::mutex      m_PacketListMutex;
};

#endif
