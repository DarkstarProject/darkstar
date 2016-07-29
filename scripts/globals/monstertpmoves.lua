require("scripts/globals/magic");
require("scripts/globals/magicburst")
require("scripts/globals/status")
require("scripts/globals/utils")

-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--            What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--            this set of functions emulates.

-- mob types
-- used in mob:isMobType()
MOBTYPE_NORMAL            = 0x00;
MOBTYPE_PCSPAWNED        = 0x01;
MOBTYPE_NOTORIOUS        = 0x02;
MOBTYPE_FISHED            = 0x04;
MOBTYPE_CALLED            = 0x08;
MOBTYPE_BATTLEFIELD        = 0x10;
MOBTYPE_EVENT            = 0x20;

--skilltype
MOBSKILL_PHYSICAL = 0;
MOBSKILL_MAGICAL = 1;
MOBSKILL_RANGED = 2;
MOBSKILL_BREATH = 4;
MOBSKILL_SPECIAL = 3;

--skillparam (PHYSICAL)
MOBPARAM_NONE = 0;
MOBPARAM_BLUNT = 1;
MOBPARAM_SLASH = 2;
MOBPARAM_PIERCE = 3;
MOBPARAM_H2H = 4;

MOBDRAIN_HP = 0;
MOBDRAIN_MP = 1;
MOBDRAIN_TP = 2;

--skillparam (MAGICAL)
-- this is totally useless and should be removed
-- add resistence using ELE_FIRE, see bomb_toss.lua
MOBPARAM_FIRE = 6;
MOBPARAM_EARTH = 7;
MOBPARAM_WATER = 8;
MOBPARAM_WIND = 9;
MOBPARAM_ICE = 10;
MOBPARAM_THUNDER = 11;
MOBPARAM_LIGHT = 12;
MOBPARAM_DARK = 13;

--shadowbehav (number of shadows to take off)
MOBPARAM_IGNORE_SHADOWS = 0;
MOBPARAM_1_SHADOW = 1;
MOBPARAM_2_SHADOW = 2;
MOBPARAM_3_SHADOW = 3;
MOBPARAM_4_SHADOW = 4;
MOBPARAM_WIPE_SHADOWS = 999;

TP_ACC_VARIES = 0;
TP_ATK_VARIES = 1;
TP_DMG_VARIES = 2;
TP_CRIT_VARIES = 3;
TP_NO_EFFECT = 0;
TP_MACC_BONUS = 1;
TP_MAB_BONUS = 2;
TP_DMG_BONUS = 3;
TP_RANGED = 4;

MSG_NONE = 0; -- display nothing
MSG_USES = 101; -- simple uses message
MSG_FAMILIAR = 108;
MSG_SELF_HEAL = 238;
MSG_ENFEEB_IS = 242; --XXX is petrified.
MSG_ENFEEB = 243; --XXX receives the effect of petrification.
MSG_BUFF = 186;
MSG_DRAIN_HP = 187;
MSG_DRAIN_MP = 225;
MSG_DRAIN_TP = 226;
MSG_NO_EFFECT = 189;
MSG_SHADOW = 31;
MSG_ANTICIPATE = 30;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;
MSG_EFFECT_DRAINED = 370; -- <num> status effects are drained from <target>.
MSG_ATTR_DRAINED = 369;
MSG_TP_REDUCED = 362; -- tp reduced to
MSG_DISAPPEAR = 159; -- <target>'s stun effect disappears!
MSG_DISAPPEAR_NUM = 231; -- <num> of <target>'s effects disappear!

BOMB_TOSS_HPP = 1;

function MobRangedMove(mob,target,skill,numberofhits,accmod,dmgmod, tpeffect)
    -- this will eventually contian ranged attack code
    return MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod, TP_RANGED);
end;

-- PHYSICAL MOVE FUNCTION
-- Call this on every physical move!
-- accmod is a linear multiplier for accuracy (1 default)
-- dmgmod is a linear multiplier for damage (1 default)
-- tpeffect is an enum which can be one of:
-- 0 TP_ACC_VARIES
-- 1 TP_ATK_VARIES
-- 2 TP_DMG_VARIES
-- 3 TP_CRIT_VARIES
-- mtp100/200/300 are the three values for 100% TP, 200% TP, 300% TP just like weaponskills.lua
-- if TP_ACC_VARIES -> three values are acc %s (1.0 is 100% acc, 0.8 is 80% acc, 1.2 is 120% acc)
-- if TP_ATK_VARIES -> three values are attack multiplier (1.5x 0.5x etc)
-- if TP_DMG_VARIES -> three values are

function MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod,tpeffect,mtp000,mtp150,mtp300,offcratiomod)
    local returninfo = {};

    --get dstr (bias to monsters, so no fSTR)
    local dstr = mob:getStat(MOD_STR) - target:getStat(MOD_VIT);
    if (dstr < -10) then
        dstr = -10;
    end

    if (dstr > 10) then
        dstr = 10;
    end

    local lvluser = mob:getMainLvl();
    local lvltarget = target:getMainLvl();
    local acc = mob:getACC();
    local eva = target:getEVA();
    if (target:hasStatusEffect(EFFECT_YONIN) and mob:isFacing(target, 23)) then -- Yonin evasion boost if mob is facing target
        eva = eva + target:getStatusEffect(EFFECT_YONIN):getPower();
    end

    --apply WSC
    local base = mob:getWeaponDmg() + dstr; --todo: change to include WSC
    if (base < 1) then
        base = 1;
    end

    --work out and cap ratio
    if (offcratiomod == nil) then -- default to attack. Pretty much every physical mobskill will use this, Cannonball being the exception.
        offcratiomod = mob:getStat(MOD_ATT);
        -- print ("Nothing passed, defaulting to attack");
    end;
    local ratio = offcratiomod/target:getStat(MOD_DEF);

    local lvldiff = lvluser - lvltarget;
    if lvldiff < 0 then
        lvldiff = 0;
    end;

    ratio = ratio + lvldiff * 0.05;
    ratio = utils.clamp(ratio, 0, 4);
    
    --work out hit rate for mobs (bias towards them)
    local hitrate = (acc*accmod) - eva + (lvldiff*2) + 75;

    -- printf("acc: %f, eva: %f, hitrate: %f", acc, eva, hitrate);
    hitrate = utils.clamp(hitrate, 20, 95);

    --work out the base damage for a single hit
    local hitdamage = base + lvldiff;
    if (hitdamage < 1) then
        hitdamage = 1;
    end

    hitdamage = hitdamage * dmgmod;

    if (tpeffect == TP_DMG_VARIES) then
        hitdamage = hitdamage * MobTPMod(skill:getTP() / 10);
    end

    --work out min and max cRatio
    local maxRatio = 1;
    local minRatio = 0;
    
    if (ratio < 0.5) then
        maxRatio = ratio + 0.5;
    elseif ((0.5 <= ratio) and (ratio <= 0.7)) then
        maxRatio = 1;
    elseif ((0.7 < ratio) and (ratio <= 1.2)) then
        maxRatio = ratio + 0.3;
    elseif ((1.2 < ratio) and (ratio <= 1.5)) then
        maxRatio = (ratio * 0.25) + ratio;
    elseif ((1.5 < ratio) and (ratio <= 2.625)) then
        maxRatio = ratio + 0.375;
    elseif ((2.625 < ratio) and (ratio <= 3.25)) then
        maxRatio = 3;
    else 
        maxRatio = ratio;
    end
    

    if (ratio < 0.38) then
        minRatio =  0;
    elseif ((0.38 <= ratio) and (ratio <= 1.25)) then
        minRatio = ratio * (1176 / 1024) - (448 / 1024);
    elseif ((1.25 < ratio) and (ratio <= 1.51)) then
        minRatio = 1;
    elseif ((1.51 < ratio) and (ratio <= 2.44)) then
        minRatio = ratio * (1176 / 1024) - (775 / 1024);
    else
        minRatio = ratio - 0.375;
    end

    --apply ftp (assumes 1~3 scalar linear mod)
    if (tpeffect==TP_DMG_BONUS) then
        hitdamage = hitdamage * fTP(skill:getTP(), mtp000, mtp150, mtp300);
    end

    --Applying pDIF
    local pdif = 0;

    -- start the hits
    local hitchance = math.random();
    local finaldmg = 0;
    local hitsdone = 1;
    local hitslanded = 0;

    local chance = math.random();

    -- first hit has a higher chance to land
    local firstHitChance = hitrate * 1.5;

    if (tpeffect==TP_RANGED) then
        firstHitChance = hitrate * 1.2;
    end

    firstHitChance = utils.clamp(firstHitChance, 35, 95);

    if ((chance*100) <= firstHitChance) then
        pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
        pdif = pdif/1000; --multiplier set.
        finaldmg = finaldmg + hitdamage * pdif;
        hitslanded = hitslanded + 1;
    end
    while (hitsdone < numberofhits) do
        chance = math.random();
        if ((chance*100)<=hitrate) then --it hit
            pdif = math.random((minRatio*1000),(maxRatio*1000)) --generate random PDIF
            pdif = pdif/1000; --multiplier set.
            finaldmg = finaldmg + hitdamage * pdif;
            hitslanded = hitslanded + 1;
        end
        hitsdone = hitsdone + 1;
    end

    -- printf("final: %f, hits: %f, acc: %f", finaldmg, hitslanded, hitrate);
    -- printf("ratio: %f, min: %f, max: %f, pdif, %f hitdmg: %f", ratio, minRatio, maxRatio, pdif, hitdamage);

    -- if an attack landed it must do at least 1 damage
    if (hitslanded >= 1 and finaldmg < 1) then
        finaldmg = 1;
    end

    -- all hits missed
    if (hitslanded == 0 or finaldmg == 0) then
        finaldmg = 0;
        hitslanded = 0;
        skill:setMsg(MSG_MISS);
    end

    returninfo.dmg = finaldmg;
    returninfo.hitslanded = hitslanded;

    return returninfo;

end

-- MAGICAL MOVE
-- Call this on every magical move!
-- mob/target/skill should be passed from onMobWeaponSkill.
-- dmg is the base damage (V value), accmod is a multiplier for accuracy (1 default, more than 1 = higher macc for mob),
-- ditto for dmg mod but more damage >1 (equivalent of M value)
-- tpeffect is an enum from one of:
-- 0 = TP_NO_EFFECT
-- 1 = TP_MACC_BONUS
-- 2 = TP_MAB_BONUS
-- 3 = TP_DMG_BONUS
-- tpvalue affects the strength of having more TP along the following lines:
-- TP_NO_EFFECT -> tpvalue has no effect.
-- TP_MACC_BONUS -> direct multiplier to macc (1 for default)
-- TP_MAB_BONUS -> direct multiplier to mab (1 for default)
-- TP_DMG_BONUS -> direct multiplier to damage (V+dINT) (1 for default)
--Examples:
-- TP_DMG_BONUS and TP=100, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 150
-- TP_DMG_BONUS and TP=200, tpvalue = 1, assume V=150  --> damage is now 150*(TP*1)/100 = 300
-- TP_DMG_BONUS and TP=100, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 300
-- TP_DMG_BONUS and TP=200, tpvalue = 2, assume V=150  --> damage is now 150*(TP*2)/100 = 600

function MobMagicalMove(mob,target,skill,damage,element,dmgmod,tpeffect,tpvalue)
    returninfo = {};
    --get all the stuff we need
    local resist = 1;

    local mdefBarBonus = 0;
    if (element > 0 and element <= 6 and target:hasStatusEffect(barSpells[element])) then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(barSpells[element]):getSubPower();
    end
    -- plus 100 forces it to be a number
    mab = (100 + mob:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus);
    
    if (mab > 1.3) then
        mab = 1.3;
    end

    if (mab < 0.7) then
        mab = 0.7;
    end

    if (tpeffect==TP_DMG_BONUS) then
        damage = damage * (((skill:getTP() / 10)*tpvalue)/100);
    end

    -- printf("power: %f, bonus: %f", damage, mab);
    -- resistence is added last
    finaldmg = damage * mab * dmgmod;

    -- get resistence
    local avatarAccBonus = 0;
    if (mob:isPet() and mob:getMaster() ~= nil) then
        local master = mob:getMaster();
        if (master:getPetID() >= 0 and master:getPetID() <= 20) then -- check to ensure pet is avatar
            avatarAccBonus = utils.clamp(master:getSkillLevel(SKILL_SUM) - master:getMaxSkillLevel(mob:getMainLvl(), JOBS.SMN, SUMMONING_SKILL), 0, 200);
        end
    end
    resist = applyPlayerResistance(mob,nil,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),avatarAccBonus,element);

    local magicDefense = getElementalDamageReduction(target, element);

    finaldmg = finaldmg * resist * magicDefense;

    returninfo.dmg = finaldmg;

    return returninfo;

end

--mob version
--effect = EFFECT_WHATEVER if enfeeble
--statmod = the stat to account for resist (INT,MND,etc) e.g. MOD_INT
--This determines how much the monsters ability resists on the player.
function applyPlayerResistance(mob,effect,target,diff,bonus,element)
    local percentBonus = 0;
    local magicaccbonus = 0;

    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + (diff - 10)/2;
    else
        magicaccbonus = magicaccbonus + diff;
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if(effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect);
    end

    local p = getMagicHitRate(mob, target, 0, element, percentBonus, magicaccbonus);

    return getMagicResist(p);
end;

function mobAddBonuses(caster, spell, target, dmg, ele)

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense);

    dayWeatherBonus = 1.00;

    if caster:getWeather() == singleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif caster:getWeather() == singleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif caster:getWeather() == doubleWeatherStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif caster:getWeather() == doubleWeatherWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    if VanadielDayElement() == dayStrong[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif VanadielDayElement() == dayWeak[ele] then
        if math.random() < 0.33 then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    end

    if dayWeatherBonus > 1.35 then
        dayWeatherBonus = 1.35;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    burst = calculateMobMagicBurst(caster, ele, target);

    -- not sure what to do for this yet
    -- if (burst > 1.0) then
        -- spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
    -- end

    dmg = math.floor(dmg * burst);

    local mdefBarBonus = 0;
    if (ele > 0 and ele <= 6 and target:hasStatusEffect(barSpells[ele])) then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(barSpells[ele]):getSubPower();
    end
    mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF) + mdefBarBonus) ;

    dmg = math.floor(dmg * mab);

    magicDmgMod = (256 + target:getMod(MOD_DMGMAGIC)) / 256;

    dmg = math.floor(dmg * magicDmgMod);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end

function calculateMobMagicBurst(caster, ele, target)

    local burst = 1.0;

    local skillchainTier, skillchainCount = MobFormMagicBurst(ele, target);

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then
            burst = 1.3;
        elseif (skillchainCount == 2) then
            burst = 1.35;
        elseif (skillchainCount == 3) then
             burst = 1.40;
        elseif (skillchainCount == 4) then
            burst = 1.45;
        elseif (skillchainCount == 5) then
            burst = 1.50;
        else
            -- Something strange is going on if this occurs.
            burst = 1.0;
        end
    end

    return burst;
end;

-- Calculates breath damage
-- mob is a mob reference to get hp and lvl
-- percent is the percentage to take from HP
-- base is calculated from main level to create a minimum
-- Equation: (HP * percent) + (LVL / base)
-- cap is optional, defines a maximum damage
function MobBreathMove(mob, target, percent, base, element, cap)
    local damage = (mob:getHP() * percent) + (mob:getMainLvl() / base);

    if (cap == nil) then
        -- cap max damage
        cap = math.floor(mob:getHP()/5);
    end

    -- Deal bonus damage vs mob ecosystem
    local systemBonus = utils.getSystemStrengthBonus(mob, target);
    damage = damage + (damage * (systemBonus * 0.25));

    -- elemental resistence
    if (element ~= nil and element > 0) then
        -- no skill available, pass nil
        local resist = applyPlayerResistance(mob,nil,target,mob:getStat(MOD_INT)-target:getStat(MOD_INT),0,element);

        -- get elemental damage reduction
        local defense = getElementalDamageReduction(target, element)

        damage = damage * resist * defense;
    end

    damage = utils.clamp(damage, 1, cap);

    return damage;
end;

function MobFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

    -- physical attack missed, skip rest
    if (skill:hasMissMsg()) then
        return 0;
    end

    --handle pd
    if ((target:hasStatusEffect(EFFECT_PERFECT_DODGE) or target:hasStatusEffect(EFFECT_ALL_MISS) )
            and skilltype==MOBSKILL_PHYSICAL) then
        skill:setMsg(MSG_MISS);
        return 0;
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(MSG_DAMAGE);

    --Handle shadows depending on shadow behaviour / skilltype
    if (shadowbehav ~= MOBPARAM_WIPE_SHADOWS and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.

        if (skill:isAoE() or skill:isConal()) then
            shadowbehav = MobTakeAoEShadow(mob, target, shadowbehav);
        end

        dmg = utils.takeShadows(target, dmg, shadowbehav);

        -- dealt zero damage, so shadows took hit
        if (dmg == 0) then
            skill:setMsg(MSG_SHADOW);
            return shadowbehav;
        end

    elseif (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
        target:delStatusEffect(EFFECT_COPY_IMAGE);
        target:delStatusEffect(EFFECT_BLINK);
        target:delStatusEffect(EFFECT_THIRD_EYE);
    end

    if (skilltype == MOBSKILL_PHYSICAL and skill:isSingle() == false) then
        target:delStatusEffect(EFFECT_THIRD_EYE);
    end

    --handle Third Eye using shadowbehav as a guide
    if (skilltype == MOBSKILL_PHYSICAL and utils.thirdeye(target)) then
        skill:setMsg(MSG_ANTICIPATE);
        return 0;
    end

    if (skilltype == MOBSKILL_PHYSICAL) then

        dmg = target:physicalDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_MAGICAL) then

        dmg = target:magicDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_BREATH) then

        dmg = target:breathDmgTaken(dmg);

    elseif (skilltype == MOBSKILL_RANGED) then

        dmg = target:rangedDmgTaken(dmg);

    end

    --handling phalanx
    dmg = dmg - target:getMod(MOD_PHALANX);

    if (dmg < 0) then
        return 0;
    end

    dmg = utils.stoneskin(target, dmg);

    if (dmg > 0) then
        target:wakeUp();
        target:updateEnmityFromDamage(mob,dmg);
        target:handleAfflatusMiseryDamage(dmg);
    end

    return dmg;
end;

-- returns true if mob attack hit
-- used to stop tp move status effects
function MobPhysicalHit(skill)
    -- if message is not the default. Then there was a miss, shadow taken etc
    return skill:hasMissMsg() == false;
end;

-- function MobHit()
-- end;

-- function MobAoEHit()
-- end;

-- function MobMagicHit()
-- end;

-- function MobMagicAoEHit()
-- end;

function MobDrainMove(mob, target, drainType, drain)

    if (target:isUndead() == false) then

        if (drainType == MOBDRAIN_MP) then
            -- can't go over limited mp
            if (target:getMP() < drain) then
                drain = target:getMP();
            end

            target:delMP(drain);
            mob:addMP(drain);

            return MSG_DRAIN_MP;
        elseif (drainType == MOBDRAIN_TP) then
            -- can't go over limited tp
            if (target:getTP() < drain) then
                drain = target:getTP();
            end

            target:delTP(drain);
            mob:addTP(drain);

            return MSG_DRAIN_TP;
        elseif (drainType == MOBDRAIN_HP) then
            -- can't go over limited hp
            if (target:getHP() < drain) then
                drain = target:getHP();
            end

            target:delHP(drain);
            mob:addHP(drain);

            return MSG_DRAIN_HP;
        end

    else
        -- it's undead so just deal damage
        -- can't go over limited hp
        if (target:getHP() < drain) then
            drain = target:getHP();
        end

        target:delHP(drain);
        return MSG_DAMAGE;
    end

    return MSG_NO_EFFECT;
end;

function MobPhysicalDrainMove(mob, target, skill, drainType, drain)
    if (MobPhysicalHit(skill)) then
        return MobDrainMove(mob, target, drainType, drain);
    end

    return MSG_MISS;
end;

function MobDrainAttribute(mob, target, typeEffect, power, tick, duration)
    local positive = nil;
    if (typeEffect == EFFECT_STR_DOWN) then
        positive = EFFECT_STR_BOOST;
    elseif (typeEffect == EFFECT_DEX_DOWN) then
        positive = EFFECT_DEX_BOOST;
    elseif (typeEffect == EFFECT_AGI_DOWN) then
        positive = EFFECT_AGI_BOOST;
    elseif (typeEffect == EFFECT_VIT_DOWN) then
        positive = EFFECT_VIT_BOOST;
    elseif (typeEffect == EFFECT_MND_DOWN) then
        positive = EFFECT_MND_BOOST;
    elseif (typeEffect == EFFECT_INT_DOWN) then
        positive = EFFECT_INT_BOOST;
    elseif (typeEffect == EFFECT_CHR_DOWN) then
        positive = EFFECT_CHR_BOOST;
    end

    if (positive ~= nil) then
        local results = MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);

        if (results == MSG_ENFEEB_IS) then
            mob:addStatusEffect(positive, power, tick, duration);

            return MSG_ATTR_DRAINED;
        end

        return MSG_MISS;
    end

    return MSG_NO_EFFECT;
end;

function MobDrainStatusEffectMove(mob, target)
    -- try to drain buff
    local effect = target:stealStatusEffect();
    local dmg = 0;

    if (effect ~= nil) then
        if (mob:hasStatusEffect(effect:getType()) == false) then
            -- add to myself
            mob:addStatusEffect(effect:getType(), effect:getPower(), effect:getTickCount(), effect:getDuration());
        end
        -- add buff to myself
        return MSG_EFFECT_DRAINED;
    end

    return MSG_NO_EFFECT;
end;

-- Adds a status effect to a target
function MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)

    if (target:canGainStatusEffect(typeEffect, power)) then
        local statmod = MOD_INT;
        local element = mob:getStatusEffectElement(typeEffect);

        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,element);

        if (resist >= 0.25) then

            local totalDuration = utils.clamp(duration * resist, 1);
            target:addStatusEffect(typeEffect, power, tick, totalDuration);

            return MSG_ENFEEB_IS;
        end

        return MSG_MISS; -- resist !
    end
    return MSG_NO_EFFECT; -- no effect
end;

-- similar to status effect move except, this will not land if the attack missed
function MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, duration)

    if (MobPhysicalHit(skill)) then
        return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);
    end

    return MSG_MISS;
end;

-- similar to statuseffect move except it will only take effect if facing
function MobGazeMove(mob, target, typeEffect, power, tick, duration)
    if (target:isFacing(mob)) then
        return MobStatusEffectMove(mob, target, typeEffect, power, tick, duration);
    end
    return MSG_NO_EFFECT;
end;

function MobBuffMove(mob, typeEffect, power, tick, duration)

    if (mob:addStatusEffect(typeEffect,power,tick,duration)) then
        return MSG_BUFF;
    end
    return MSG_NO_EFFECT;
end;

function MobHealMove(target, heal)

    local mobHP = target:getHP();
    local mobMaxHP = target:getMaxHP();

    if (mobHP+heal > mobMaxHP) then
        heal = mobMaxHP - mobHP;
    end

    target:wakeUp();

    target:addHP(heal);

    return heal;
end

function MobTakeAoEShadow(mob, target, max)

    -- this is completely crap and should be using actual nin skill
    -- TODO fix this
    if (target:getMainJob() == JOBS.NIN and math.random() < 0.6) then
        max = max - 1;
        if (max < 1) then
            max = 1;
        end
    end

    return math.random(1, max);
end;

function MobTPMod(tp)
    -- increase damage based on tp
    if (tp >= 3000) then
        return 2;
    elseif (tp >= 2000) then
        return 1.5;
    end
    return 1;
end;

function fTP(tp,ftp1,ftp2,ftp3)
    if (tp<1000) then
        tp=1000;
    end
    if (tp>=1000 and tp<1500) then
        return ftp1 + ( ((ftp2-ftp1)/500) * (tp-1000));
    elseif (tp>=1500 and tp<=3000) then
        --generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/1500) * (tp-1500));
    end
    return 1; --no ftp mod
end;
