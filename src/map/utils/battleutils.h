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

#ifndef _BATTLEUTILS_H
#define _BATTLEUTILS_H

#include "../../common/cbasetypes.h"
#include "../blue_spell.h"
#include "../status_effect.h"
#include "../merit.h"

#include <list>

#include "../entities/battleentity.h"

class CAbility;
class CItemWeapon;
class CMobSkill;
class CSpell;
class CTrait;
class CWeaponSkill;
struct actionTarget_t;
enum class PHYSICAL_ATTACK_TYPE;

enum ENSPELL
{
    ENSPELL_NONE = 0,
    ENSPELL_I_FIRE = 1,
    ENSPELL_I_EARTH = 2,
    ENSPELL_I_WATER = 3,
    ENSPELL_I_WIND = 4,
    ENSPELL_I_ICE = 5,
    ENSPELL_I_THUNDER = 6,
    ENSPELL_I_LIGHT = 7,
    ENSPELL_I_DARK = 8,
    ENSPELL_II_FIRE = 9,
    ENSPELL_II_EARTH = 10,
    ENSPELL_II_WATER = 11,
    ENSPELL_II_WIND = 12,
    ENSPELL_II_ICE = 13,
    ENSPELL_II_THUNDER = 14,
    ENSPELL_II_LIGHT = 15,
    ENSPELL_BLOOD_WEAPON = 16,
    ENSPELL_ROLLING_THUNDER = 17,
    ENSPELL_AUSPICE = 18,
    ENSPELL_DRAIN_SAMBA = 19,
    ENSPELL_ASPIR_SAMBA = 20,
    ENSPELL_HASTE_SAMBA = 21
};

enum SPIKES
{
    SPIKE_NONE = 0,
    SPIKE_BLAZE = 1,
    SPIKE_ICE = 2,
    SPIKE_DREAD = 3,
    SPIKE_CURSE = 4,
    SPIKE_SHOCK = 5,
    SPIKE_REPRISAL = 6,
    SPIKE_WIND = 7,
    SPIKE_STONE = 8,
    SPIKE_DELUGE = 9,
    RETALIATION = 63
};

enum ELEMENT
{
    ELEMENT_NONE = 0,
    ELEMENT_FIRE = 1,
    ELEMENT_EARTH = 2,
    ELEMENT_WATER = 3,
    ELEMENT_WIND = 4,
    ELEMENT_ICE = 5,
    ELEMENT_THUNDER = 6,
    ELEMENT_LIGHT = 7,
    ELEMENT_DARK = 8
};


namespace battleutils
{
    void			LoadSkillTable();
    void			LoadWeaponSkillsList();
    void			LoadMobSkillsList();
    void			LoadSkillChainDamageModifiers();

    std::uint8_t			CheckMultiHits(CBattleEntity* PEntity, CItemWeapon* PWeapon);

    std::uint8_t			getHitCount(std::uint8_t hits);
    std::uint8_t			CheckMobMultiHits(CBattleEntity* PEntity);

    std::int16_t			GetSnapshotReduction(CCharEntity* m_PChar, std::int16_t delay);
    std::int32_t			GetRangedAttackBonuses(CBattleEntity* battleEntity);
    std::int32_t			GetRangedAccuracyBonuses(CBattleEntity* battleEntity);

    std::uint8_t			GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID);
    std::uint16_t			GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, std::uint8_t level);
    std::uint16_t          GetMaxSkill(std::uint8_t rank, std::uint8_t level);

    CWeaponSkill*	GetWeaponSkill(std::uint16_t WSkillID);
    CMobSkill*		GetMobSkill(std::uint16_t SkillID);
    CMobSkill*      GetTwoHourMobSkill(JOBTYPE job, std::uint16_t familyId);

    const std::list<CWeaponSkill*>& GetWeaponSkills(std::uint8_t skill);
    const std::vector<std::uint16_t>& GetMobSkillList(std::uint16_t ListID);

    void				FreeWeaponSkillsList();
    void				FreeMobSkillList();

    SUBEFFECT			GetSkillChainEffect(CBattleEntity* PDefender, std::uint8_t primary, std::uint8_t secondary, std::uint8_t tertiary);
    SKILLCHAIN_ELEMENT  FormSkillchain(const std::list<SKILLCHAIN_ELEMENT>& resonance, const std::list<SKILLCHAIN_ELEMENT>& skill);
    std::uint8_t				GetSkillchainTier(SKILLCHAIN_ELEMENT skillchain);
    std::uint8_t				GetSkillchainSubeffect(SKILLCHAIN_ELEMENT skillchain);
    std::int16_t				GetSkillchainMinimumResistance(SKILLCHAIN_ELEMENT element, CBattleEntity* PDefender, ELEMENT* appliedEle);

    bool			IsParalyzed(CBattleEntity* PAttacker);
    bool			IsAbsorbByShadow(CBattleEntity* PDefender);
    bool			IsIntimidated(CBattleEntity* PAttacker, CBattleEntity* PDefender);

    std::int32_t				GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::uint8_t SlotID);
    std::uint8_t				GetHitRateEx(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::uint8_t attackNumber, std::int8_t offsetAccuracy);
    std::uint8_t				GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    std::uint8_t				GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::uint8_t attackNumber);
    std::uint8_t				GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::uint8_t attackNumber, std::int8_t offsetAccuracy);
    std::uint8_t				GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool ignoreSneakTrickAttack);
    std::uint8_t				GetBlockRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    std::uint8_t				GetParryRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    std::uint8_t				GetGuardRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    float				GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isCritical, std::uint16_t bonusAttPercent);

    std::int32_t				TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, PHYSICAL_ATTACK_TYPE attackType, std::int32_t damage, bool isBlocked, std::uint8_t slot, std::uint16_t tpMultiplier, CBattleEntity* taChar, bool giveTPtoVictim, bool giveTPtoAttacker, bool isCounter = false);
    std::int32_t				TakeWeaponskillDamage(CCharEntity* PChar, CBattleEntity* PDefender, std::int32_t damage, std::uint8_t slot, bool primary, float tpMultiplier, std::uint16_t bonusTP, float targetTPMultiplier);
    std::int32_t				TakeSkillchainDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::int32_t lastSkillDamage, CBattleEntity* taChar);

    bool                TryInterruptSpell(CBattleEntity* PAttacker, CBattleEntity* PDefender, CSpell* PSpell);
    float				GetRangedPDIF(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    void				HandleRangedAdditionalEffect(CCharEntity* PAttacker, CBattleEntity* PDefender, apAction_t* Action);
    std::uint16_t              CalculateSpikeDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action, std::uint16_t damageTaken);
    bool                HandleSpikesDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action, std::int32_t damage);
    bool                HandleSpikesEquip(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action, std::uint8_t damage, SUBEFFECT spikesType, std::uint8_t chance);
    void                HandleSpikesStatusEffect(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action);
    void				HandleEnspell(CBattleEntity* PAttacker, CBattleEntity* PDefender, actionTarget_t* Action, bool isFirstSwing, CItemWeapon* weapon, std::int32_t damage);
    std::uint8_t				GetRangedHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isBarrage);
    std::int32_t				CalculateEnspellDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, std::uint8_t Tier, std::uint8_t element);

    std::uint8_t				GetEnmityModDamage(std::uint8_t level);
    std::uint8_t				GetEnmityModCure(std::uint8_t level);
    bool				isValidSelfTargetWeaponskill(int wsid);
    std::int16_t				CalculateBaseTP(int delay);
    void				GenerateCureEnmity(CCharEntity* PSource, CBattleEntity* PTarget, std::uint16_t amount);
    void                GenerateInRangeEnmity(CBattleEntity* PSource, std::int16_t CE, std::int16_t VE);

    CItemWeapon*		GetEntityWeapon(CBattleEntity* PEntity, SLOTTYPE Slot);
    CItemArmor*			GetEntityArmor(CBattleEntity* PEntity, SLOTTYPE Slot);

    void				MakeEntityStandUp(CBattleEntity* PEntity);
    CBattleEntity*		getAvailableTrickAttackChar(CBattleEntity* taUser, CBattleEntity* PMob);

    bool				HasNinjaTool(CBattleEntity* PEntity, CSpell* PSpell, bool ConsumeTool);

    float               GetCharmChance(CBattleEntity* PCharmer, CBattleEntity* PTarget, bool includeCharmAffinityAndChanceMods = true);
    bool				TryCharm(CBattleEntity* PCharmer, CBattleEntity* PVictim);
    void				tryToCharm(CBattleEntity* PCharmer, CBattleEntity* PVictim);
    void                applyCharm(CBattleEntity* PCharmer, CBattleEntity* PVictim, duration charmTime = 0s);
    void                unCharm(CBattleEntity* PEntity);

    std::uint16_t				doSoulEaterEffect(CCharEntity* m_PChar, uint32 damage);
    std::uint16_t				getOverWhelmDamageBonus(CCharEntity* m_PChar, CBattleEntity* PDefender, std::uint16_t damage);
    std::uint16_t				jumpAbility(CBattleEntity* PAttacker, CBattleEntity* PVictim, std::uint8_t tier);

    void				TransferEnmity(CBattleEntity* PHateReceiver, CBattleEntity* PHateGiver, CMobEntity* PMob, std::uint8_t percentToTransfer);
    std::uint8_t				getBarrageShotCount(CCharEntity* PChar);
    std::uint8_t				getStoreTPbonusFromMerit(CBattleEntity* PEntity);

    void                ClaimMob(CBattleEntity* PDefender, CBattleEntity* PAttacker);

    std::int32_t               BreathDmgTaken(CBattleEntity* PDefender, std::int32_t damage);
    std::int32_t               MagicDmgTaken(CBattleEntity* PDefender, std::int32_t damage, ELEMENT element);
    std::int32_t               PhysicalDmgTaken(CBattleEntity* PDefender, std::int32_t damage);
    std::int32_t               RangedDmgTaken(CBattleEntity* PDefender, std::int32_t damage);

    void                HandleIssekiganEnmityBonus(CBattleEntity* PDefender, CBattleEntity* PAttacker);
    std::int32_t               HandleSevereDamage(CBattleEntity* PDefender, std::int32_t damage);
    std::int32_t               HandleSevereDamageEffect(CBattleEntity* PDefender, EFFECT effect, std::int32_t damage, bool removeEffect);
    void                HandleTacticalParry(CBattleEntity* PEntity);

    // Handles everything related to breaking Bind
    void                BindBreakCheck(CBattleEntity* PAttacker, CBattleEntity* PDefender);

    // returns damage taken
    std::int32_t               HandleStoneskin(CBattleEntity* PDefender, std::int32_t damage);
    std::int32_t               HandleFanDance(CBattleEntity* PDefender, std::int32_t damage);

    // stores damage for afflatus misery if active
    void                HandleAfflatusMiseryDamage(CBattleEntity* PDefender, std::int32_t damage);
    // boosts accuracy when afflatus msiery is active
    void                HandleAfflatusMiseryAccuracyBonus(CBattleEntity* PAttacker);

    // handles enmity loss calculations for tranquil heart
    float               HandleTranquilHeart(CBattleEntity* PEntity);

    void				assistTarget(CCharEntity* PChar, std::uint16_t TargID);

    std::uint8_t               GetSpellAoEType(CBattleEntity* PCaster, CSpell* PSpell);
    WEATHER             GetWeather(CBattleEntity* PEntity, bool ignoreScholar);
    WEATHER             GetWeather(CBattleEntity* PEntity, bool ignoreScholar, std::uint16_t zoneWeather);
    bool                WeatherMatchesElement(WEATHER weather, std::uint8_t element);
    bool				DrawIn(CBattleEntity* PEntity, CMobEntity* PMob, float offset);
    void				DoWildCardToEntity(CCharEntity* PCaster, CCharEntity* PTarget, std::uint8_t roll);
    void                AddTraits(CBattleEntity* PEntity, TraitList_t* TraitList, std::uint8_t level);
    bool                HasClaim(CBattleEntity* PEntity, CBattleEntity* PTarget);

    uint32              CalculateSpellCastTime(CBattleEntity*, CSpell*);
    std::uint16_t              CalculateSpellCost(CBattleEntity*, CSpell*);
    uint32              CalculateSpellRecastTime(CBattleEntity*, CSpell*);
    std::int16_t               CalculateWeaponSkillTP(CBattleEntity*, CWeaponSkill*, std::int16_t);
    bool                RemoveAmmo(CCharEntity*, int quantity = 1);
    std::int32_t               GetMeritValue(CBattleEntity*, MERIT_TYPE);

    std::int32_t               GetScaledItemModifier(CBattleEntity*, CItemArmor*, Mod);
};

#endif
