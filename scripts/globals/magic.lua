require("scripts/globals/magicburst");
require("scripts/globals/settings");
require("scripts/globals/weather");
require("scripts/globals/status");
require("scripts/globals/utils");
require("scripts/globals/msg");
------------------------------------

dsp = dsp or {};
dsp.magic = dsp.magic or {};

------------------------------------
-- Elements
------------------------------------

dsp.magic.element =
{
    NONE      = 0,
    FIRE      = 1,
    EARTH     = 2,
    WATER     = 3,
    WIND      = 4,
    ICE       = 5,
    LIGHTNING = 6,
    THUNDER   = 6,
    LIGHT     = 7,
    DARK      = 8,
}
dsp.magic.ele = dsp.magic.element;

------------------------------------
-- Spell Groups
------------------------------------

dsp.magic.spellGroup =
{
    NONE      = 0,
    SONG      = 1,
    BLACK     = 2,
    BLUE      = 3,
    NINJUTSU  = 4,
    SUMMONING = 5,
    WHITE     = 6,
}

------------------------------------
-- Spell AOE IDs
------------------------------------

dsp.magic.aoe =
{
    NONE        = 0,
    RADIAL      = 1,
    CONAL       = 2,
    RADIAL_MANI = 3, -- AOE when under SCH stratagem Manifestation
    RADIAL_ACCE = 4, -- AOE when under SCH stratagem Accession
    PIANISSIMO  = 5, -- Single target when under BRD JA Pianissimo
    DIFFUSION   = 6, -- AOE when under Diffusion
}

------------------------------------
-- Spell flag bits
------------------------------------

dsp.magic.spellFlag =
{
    NONE           = 0x00,
    HIT_ALL        = 0x01, -- Hit all targets in range regardless of party
    WIPE_SHADOWS   = 0x02, -- Wipe shadows even if single target and miss/resist (example: "Maiden's Virelai")
    IGNORE_SHADOWS = 0x04  -- Ignore shadows and hit player anyways (example: Mobs "Death" spell)
}

------------------------------------
-- Tables by element
------------------------------------

dsp.magic.dayStrong           = {dsp.day.FIRESDAY,              dsp.day.EARTHSDAY,              dsp.day.WATERSDAY,               dsp.day.WINDSDAY,              dsp.day.ICEDAY,               dsp.day.LIGHTNINGDAY,            dsp.day.LIGHTSDAY,           dsp.day.DARKSDAY};
dsp.magic.singleWeatherStrong = {dsp.weather.HOT_SPELL,         dsp.weather.DUST_STORM,         dsp.weather.RAIN,                dsp.weather.WIND,              dsp.weather.SNOW,             dsp.weather.THUNDER,             dsp.weather.AURORAS,         dsp.weather.GLOOM};
dsp.magic.doubleWeatherStrong = {dsp.weather.HEAT_WAVE,         dsp.weather.SAND_STORM,         dsp.weather.SQUALL,              dsp.weather.GALES,             dsp.weather.BLIZZARDS,        dsp.weather.THUNDERSTORMS,       dsp.weather.STELLAR_GLARE,   dsp.weather.DARKNESS};
local elementalObiStrong      = {dsp.mod.FORCE_FIRE_DWBONUS,    dsp.mod.FORCE_EARTH_DWBONUS,    dsp.mod.FORCE_WATER_DWBONUS,     dsp.mod.FORCE_WIND_DWBONUS,    dsp.mod.FORCE_ICE_DWBONUS,    dsp.mod.FORCE_LIGHTNING_DWBONUS, dsp.mod.FORCE_LIGHT_DWBONUS, dsp.mod.FORCE_DARK_DWBONUS};
local spellAcc                = {dsp.mod.FIREACC,               dsp.mod.EARTHACC,               dsp.mod.WATERACC,                dsp.mod.WINDACC,               dsp.mod.ICEACC,               dsp.mod.THUNDERACC,              dsp.mod.LIGHTACC,            dsp.mod.DARKACC};
local strongAffinityDmg       = {dsp.mod.FIRE_AFFINITY_DMG,     dsp.mod.EARTH_AFFINITY_DMG,     dsp.mod.WATER_AFFINITY_DMG,      dsp.mod.WIND_AFFINITY_DMG,     dsp.mod.ICE_AFFINITY_DMG,     dsp.mod.THUNDER_AFFINITY_DMG,    dsp.mod.LIGHT_AFFINITY_DMG,  dsp.mod.DARK_AFFINITY_DMG};
local strongAffinityAcc       = {dsp.mod.FIRE_AFFINITY_ACC,     dsp.mod.EARTH_AFFINITY_ACC,     dsp.mod.WATER_AFFINITY_ACC,      dsp.mod.WIND_AFFINITY_ACC,     dsp.mod.ICE_AFFINITY_ACC,     dsp.mod.THUNDER_AFFINITY_ACC,    dsp.mod.LIGHT_AFFINITY_ACC,  dsp.mod.DARK_AFFINITY_ACC};
dsp.magic.resistMod           = {dsp.mod.FIRERES,               dsp.mod.EARTHRES,               dsp.mod.WATERRES,                dsp.mod.WINDRES,               dsp.mod.ICERES,               dsp.mod.THUNDERRES,              dsp.mod.LIGHTRES,            dsp.mod.DARKRES};
dsp.magic.defenseMod          = {dsp.mod.FIREDEF,               dsp.mod.EARTHDEF,               dsp.mod.WATERDEF,                dsp.mod.WINDDEF,               dsp.mod.ICEDEF,               dsp.mod.THUNDERDEF,              dsp.mod.LIGHTDEF,            dsp.mod.DARKDEF};
dsp.magic.absorbMod           = {dsp.mod.FIRE_ABSORB,           dsp.mod.EARTH_ABSORB,           dsp.mod.WATER_ABSORB,            dsp.mod.WIND_ABSORB,           dsp.mod.ICE_ABSORB,           dsp.mod.LTNG_ABSORB,             dsp.mod.LIGHT_ABSORB,        dsp.mod.DARK_ABSORB};
local nullMod                 = {dsp.mod.FIRE_NULL,             dsp.mod.EARTH_NULL,             dsp.mod.WATER_NULL,              dsp.mod.WIND_NULL,             dsp.mod.ICE_NULL,             dsp.mod.LTNG_NULL,               dsp.mod.LIGHT_NULL,          dsp.mod.DARK_NULL};
local blmMerit                = {dsp.merit.FIRE_MAGIC_POTENCY,  dsp.merit.EARTH_MAGIC_POTENCY,  dsp.merit.WATER_MAGIC_POTENCY,   dsp.merit.WIND_MAGIC_POTENCY,  dsp.merit.ICE_MAGIC_POTENCY,  dsp.merit.LIGHTNING_MAGIC_POTENCY};
local rdmMerit                = {dsp.merit.FIRE_MAGIC_ACCURACY, dsp.merit.EARTH_MAGIC_ACCURACY, dsp.merit.WATER_MAGIC_ACCURACY,  dsp.merit.WIND_MAGIC_ACCURACY, dsp.merit.ICE_MAGIC_ACCURACY, dsp.merit.LIGHTNING_MAGIC_ACCURACY};
dsp.magic.barSpell            = {dsp.effect.BARFIRE,            dsp.effect.BARSTONE,            dsp.effect.BARWATER,             dsp.effect.BARAERO,            dsp.effect.BARBLIZZARD,       dsp.effect.BARTHUNDER};

dsp.magic.dayWeak             = {dsp.day.WATERSDAY,             dsp.day.WINDSDAY,               dsp.day.LIGHTNINGDAY,            dsp.day.ICEDAY,                dsp.day.FIRESDAY,             dsp.day.EARTHSDAY,               dsp.day.DARKSDAY,            dsp.day.LIGHTSDAY};
dsp.magic.singleWeatherWeak   = {dsp.weather.RAIN,              dsp.weather.WIND,               dsp.weather.THUNDER,             dsp.weather.SNOW,              dsp.weather.HOT_SPELL,        dsp.weather.DUST_STORM,          dsp.weather.GLOOM,           dsp.weather.AURORAS};
dsp.magic.doubleWeatherWeak   = {dsp.weather.SQUALL,            dsp.weather.GALES,              dsp.weather.THUNDERSTORMS,       dsp.weather.BLIZZARDS,         dsp.weather.HEAT_WAVE,        dsp.weather.SAND_STORM,          dsp.weather.DARKNESS,        dsp.weather.STELLAR_GLARE};
local elementalObiWeak        = {dsp.mod.FORCE_WATER_DWBONUS,   dsp.mod.FORCE_WIND_DWBONUS,     dsp.mod.FORCE_LIGHTNING_DWBONUS, dsp.mod.FORCE_ICE_DWBONUS,     dsp.mod.FORCE_FIRE_DWBONUS,   dsp.mod.FORCE_EARTH_DWBONUS,     dsp.mod.FORCE_DARK_DWBONUS,  dsp.mod.FORCE_LIGHT_DWBONUS};

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- dmg - The base damage of the spell
-- multiplier - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually dsp.mod.INT , except for things like Banish which is dsp.mod.MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
local SOFT_CAP = 60; --guesstimated
local HARD_CAP = 120; --guesstimated

function calculateMagicDamage(caster, target, spell, params)

    local dINT = caster:getStat(params.attribute) - target:getStat(params.attribute);
    local dmg = params.dmg;

    if (dINT <= 0) then --if dINT penalises, it's always M=1
        dmg = dmg + dINT;
        if (dmg <= 0) then --dINT penalty cannot result in negative damage (target absorption)
            return 0;
        end
    elseif (dINT > 0 and dINT <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier);
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP * params.multiplier + ((dINT - SOFT_CAP) * params.multiplier) / 2;
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT >= HARD_CAP) then --After HARD_CAP, INT has no dsp.effect.
        dmg = dmg + HARD_CAP * params.multiplier;
    end


    if (params.skillType == dsp.skill.DIVINE_MAGIC and target:isUndead()) then
        -- 150% bonus damage
        dmg = dmg * 1.5;
    end

    -- printf("dmg: %d dINT: %d\n", dmg, dINT);

    return dmg;

end;

function doBoostGain(caster, target, spell, effect)
    local duration = calculateDuration(300, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = target:getSkillLevel(spell:getSkillType())

    local potency = math.floor((magicskill - 300) / 10) + 5

    if potency > 25 then
        potency = 25
    elseif potency < 5 then
        potency = 5
    end

    --printf("BOOST-GAIN: POTENCY = %d", potency);

    --Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
    local effectOverwrite =
    {
        dsp.effect.STR_BOOST,
        dsp.effect.DEX_BOOST,
        dsp.effect.VIT_BOOST,
        dsp.effect.AGI_BOOST,
        dsp.effect.INT_BOOST,
        dsp.effect.MND_BOOST,
        dsp.effect.CHR_BOOST
    }

    for i, effect in ipairs(effectOverwrite) do
            --printf("BOOST-GAIN: CHECKING FOR EFFECT %d...",effect);
            if caster:hasStatusEffect(effect) then
                --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...",effect);
                caster:delStatusEffect(effect)
            end
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end
end

function doEnspell(caster, target, spell, effect)
    if effect == dsp.effect.BLOOD_WEAPON then
        target:addStatusEffect(dsp.effect.BLOOD_WEAPON, 1, 0, 30)
        return
    end

    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = target:getSkillLevel(dsp.skill.ENHANCING_MAGIC)

    local potency = 3 + math.floor(6 * magicskill / 100)
    if magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end
end

---------------------------------
--   getCurePower returns the caster's cure power
--   getCureFinal returns the final cure amount
--   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
---------------------------------
function getCurePower(caster,isBlueMagic)
    local MND = caster:getStat(dsp.mod.MND);
    local VIT = caster:getStat(dsp.mod.VIT);
    local skill = caster:getSkillLevel(dsp.skill.HEALING_MAGIC);
    local power = math.floor(MND/2) + math.floor(VIT/4) + skill;
    return power;
end;
function getCurePowerOld(caster)
    local MND = caster:getStat(dsp.mod.MND);
    local VIT = caster:getStat(dsp.mod.VIT);
    local skill = caster:getSkillLevel(dsp.skill.HEALING_MAGIC); -- it's healing magic skill for the BLU cures as well
    local power = ((3 * MND) + VIT + (3 * math.floor(skill/5)));
    return power;
end;
function getBaseCure(power,divisor,constant,basepower)
    return ((power - basepower) / divisor) + constant;
end;
function getBaseCureOld(power,divisor,constant)
    return (power / 2) / divisor + constant;
end;

function getCureFinal(caster, spell, basecure, minCure, isBlueMagic)
    if basecure < minCure then
        basecure = minCure
    end

    local curePot = math.min(caster:getMod(dsp.mod.CURE_POTENCY), 50) / 100 -- caps at 50%
    local curePotII = math.min(caster:getMod(dsp.mod.CURE_POTENCY_II), 30) / 100 -- caps at 30%
    local potency = 1 + curePot + curePotII

    local dSeal = 1;
    if (caster:hasStatusEffect(dsp.effect.DIVINE_SEAL)) then
        dSeal = 2;
    end

    local rapture = 1;
    if (isBlueMagic == false) then --rapture doesn't affect BLU cures as they're not white magic
        if (caster:hasStatusEffect(dsp.effect.RAPTURE)) then
            rapture = 1.5 + caster:getMod(dsp.mod.RAPTURE_AMOUNT)/100;
            caster:delStatusEffectSilent(dsp.effect.RAPTURE);
        end
    end

    local dayWeatherBonus = 1;
    local ele = spell:getElement();

    local castersWeather = caster:getWeather();

    if (castersWeather == dsp.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (castersWeather == dsp.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (castersWeather == dsp.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (castersWeather == dsp.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dsp.magic.dayStrong[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dsp.magic.dayWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if (dayWeatherBonus > 1.4) then
        dayWeatherBonus = 1.4;
    end

    local final = math.floor(math.floor(math.floor(math.floor(basecure) * potency) * dayWeatherBonus) * rapture) * dSeal;
    return final;
end;

function getCureAsNukeFinal(caster,spell,power,divisor,constant,basepower)
    return getCureFinal(caster,spell,power,divisor,constant,basepower);
end;

-----------------------------------
-- Returns the staff bonus for the caster and spell.
-----------------------------------

-- affinities that strengthen/weaken the index element


function AffinityBonusDmg(caster,ele)

    local affinity = caster:getMod(strongAffinityDmg[ele]);
    local bonus = 1.00 + affinity * 0.05; -- 5% per level of affinity
    -- print(bonus);
    return bonus;
end;

function AffinityBonusAcc(caster,ele)

    local affinity = caster:getMod(strongAffinityAcc[ele]);
    local bonus = 0 + affinity * 10; -- 10 acc per level of affinity
    -- print(bonus);
    return bonus;
end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(caster, target, spell, params)
    return applyResistanceEffect(caster, target, spell, params);
end;

-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)
--[[
local params = {};
params.attribute = $2;
params.skillType = $3;
params.bonus = $4;
params.effect = $5;
]]
function applyResistanceEffect(caster, target, spell, params)
    local diff = params.diff or (caster:getStat(params.attribute) - target:getStat(params.attribute));
    local skill = params.skillType;
    local bonus = params.bonus;
    local effect = params.effect;

    -- If Stymie is active, as long as the mob is not immune then the effect is not resisted
    if (effect ~= nil) then -- Dispel's script doesn't have an "effect" to send here, nor should it.
        if (skill == dsp.skill.ENFEEBLING_MAGIC and caster:hasStatusEffect(dsp.effect.STYMIE) and target:canGainStatusEffect(effect)) then
            caster:delStatusEffect(dsp.effect.STYMIE);
            return 1;
        end
    end

    if (skill == dsp.skill.SINGING and caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        if (math.random(0,99) < caster:getMerit(dsp.merit.TROUBADOUR)-25) then
            return 1.0;
        end
    end

    local element = spell:getElement();
    local percentBonus = 0;
    local magicaccbonus = getSpellBonusAcc(caster, target, spell, params);

    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + (diff - 10)/2;
    else
        magicaccbonus = magicaccbonus + diff;
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if (effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect);
    end

    local p = getMagicHitRate(caster, target, skill, element, percentBonus, magicaccbonus);

    return getMagicResist(p);
end;

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(player,target,element,skill,bonus)
    local p = getMagicHitRate(player, target, skill, element, 0, bonus);

    return getMagicResist(p);
end;

-- Applies resistance for additional effects
function applyResistanceAddEffect(player,target,element,bonus)

    local p = getMagicHitRate(player, target, 0, element, 0, bonus);

    return getMagicResist(p);
end;

function getMagicHitRate(caster, target, skillType, element, percentBonus, bonusAcc)
    -- resist everything if magic shield is active
    if (target:hasStatusEffect(dsp.effect.MAGIC_SHIELD, 0)) then
        return 0;
    end

    local magiceva = 0;

    if (bonusAcc == nil) then
        bonusAcc = 0;
    end

    local magicacc = caster:getMod(dsp.mod.MACC) + caster:getILvlMacc();

    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
    if (skillType ~= 0) then
        magicacc = magicacc + caster:getSkillLevel(skillType);
    else
        -- for mob skills / additional effects which don't have a skill
        magicacc = magicacc + utils.getSkillLvl(1, caster:getMainLvl());
    end

    local resMod = 0; -- Some spells may possibly be non elemental, but have status effects.
    if (element ~= dsp.magic.ele.NONE) then
        resMod = target:getMod(dsp.magic.resistMod[element]);

        -- Add acc for elemental affinity accuracy and element specific accuracy
        local affinityBonus = AffinityBonusAcc(caster, element);
        local elementBonus = caster:getMod(spellAcc[element]);
        -- print(elementBonus);
        bonusAcc = bonusAcc + affinityBonus + elementBonus;
    end

    magicacc = magicacc + caster:getMerit(dsp.merit.MAGIC_ACCURACY)

    magicacc = magicacc + caster:getMerit(dsp.merit.NIN_MAGIC_ACCURACY)

    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    local magiceva = target:getMod(dsp.mod.MEVA) + resMod;

    magicacc = magicacc + bonusAcc;

    -- Add macc% from food
    local maccFood = magicacc * (caster:getMod(dsp.mod.FOOD_MACCP)/100);
    magicacc = magicacc + utils.clamp(maccFood, 0, caster:getMod(dsp.mod.FOOD_MACC_CAP));

    return calculateMagicHitRate(magicacc, magiceva, percentBonus, caster:getMainLvl(), target:getMainLvl());
end

function calculateMagicHitRate(magicacc, magiceva, percentBonus, casterLvl, targetLvl)
    local p = 0;
    --add a scaling bonus or penalty based on difference of targets level from caster
    local levelDiff = utils.clamp(casterLvl - targetLvl, -5, 5);

    p = 70 - 0.5 * (magiceva - magicacc) + levelDiff * 3 + percentBonus;

    return utils.clamp(p, 5, 95);
end

-- Returns resistance value from given magic hit rate (p)
function getMagicResist(magicHitRate)

    local p = magicHitRate / 100;
    local resist = 1;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p);
    local quart = ((1 - p)^2);
    local eighth = ((1 - p)^3);
    local sixteenth = ((1 - p)^4);
    -- print("HALF: "..half);
    -- print("QUART: "..quart);
    -- print("EIGHTH: "..eighth);
    -- print("SIXTEENTH: "..sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if (resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif (resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif (resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif (resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;
end

-- Returns the amount of resistance the
-- target has to the given effect (stun, sleep, etc..)
function getEffectResistance(target, effect)
    local effectres = 0;
    if (effect == dsp.effect.SLEEP_I or effect == dsp.effect.SLEEP_II) then
        effectres = dsp.mod.SLEEPRES;
    elseif (effect == dsp.effect.LULLABY) then
        effectres = dsp.mod.LULLABYRES;
    elseif (effect == dsp.effect.POISON) then
        effectres = dsp.mod.POISONRES;
    elseif (effect == dsp.effect.PARALYSIS) then
        effectres = dsp.mod.PARALYZERES;
    elseif (effect == dsp.effect.BLINDNESS) then
        effectres = dsp.mod.BLINDRES
    elseif (effect == dsp.effect.SILENCE) then
        effectres = dsp.mod.SILENCERES;
    elseif (effect == dsp.effect.PLAGUE or effect == dsp.effect.DISEASE) then
        effectres = dsp.mod.VIRUSRES;
    elseif (effect == dsp.effect.PETRIFICATION) then
        effectres = dsp.mod.PETRIFYRES;
    elseif (effect == dsp.effect.BIND) then
        effectres = dsp.mod.BINDRES;
    elseif (effect == dsp.effect.CURSE_I or effect == dsp.effect.CURSE_II or effect == dsp.effect.BANE) then
        effectres = dsp.mod.CURSERES;
    elseif (effect == dsp.effect.WEIGHT) then
        effectres = dsp.mod.GRAVITYRES;
    elseif (effect == dsp.effect.SLOW or effect == dsp.effect.ELEGY) then
        effectres = dsp.mod.SLOWRES;
    elseif (effect == dsp.effect.STUN) then
        effectres = dsp.mod.STUNRES;
    elseif (effect == dsp.effect.CHARM) then
        effectres = dsp.mod.CHARMRES;
    elseif (effect == dsp.effect.AMNESIA) then
        effectres = dsp.mod.AMNESIARES;
    end

    if (effectres ~= 0) then
        return target:getMod(effectres);
    end

    return 0;
end;

-- Returns the bonus magic accuracy for any spell
function getSpellBonusAcc(caster, target, spell, params)
    local magicAccBonus = 0;
    local castersWeather = caster:getWeather();
    local skill = spell:getSkillType();
    local spellGroup = spell:getSpellGroup();
    local element = spell:getElement();

    if caster:hasStatusEffect(dsp.effect.ALTRUISM) and spellGroup == dsp.magic.spellGroup.WHITE then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(dsp.effect.ALTRUISM):getPower();
    end

    if caster:hasStatusEffect(dsp.effect.FOCALIZATION) and spellGroup == dsp.magic.spellGroup.BLACK then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(dsp.effect.FOCALIZATION):getPower();
    end

    local skillchainTier, skillchainCount = FormMagicBurst(element, target);

    --add acc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 25;
    end

    --Add acc for klimaform
    if element > 0 then
        if caster:hasStatusEffect(dsp.effect.KLIMAFORM) and (castersWeather == dsp.magic.singleWeatherStrong[element] or castersWeather == dsp.magic.doubleWeatherStrong[element]) then
            magicAccBonus = magicAccBonus + 15
        end
    end

    --add for blm elemental magic merits
    if skill == dsp.skill.ELEMENTAL_MAGIC then
        magicAccBonus = magicAccBonus + caster:getMerit(dsp.merit.ELEMENTAL_MAGIC_ACCURACY)
    end

    --Add acc for dark seal
    if (skill == dsp.skill.DARK_MAGIC and caster:hasStatusEffect(dsp.effect.DARK_SEAL)) then
        magicAccBonus = magicAccBonus + 256;
    end

    --add acc for RDM group 1 merits
    if (element > 0 and element <= 6) then
        magicAccBonus = magicAccBonus + caster:getMerit(rdmMerit[element]);
    end

    -- BLU mag acc merits - nuke acc is handled in bluemagic.lua
    if (skill == dsp.skill.BLUE_MAGIC) then
        magicAccBonus = magicAccBonus + caster:getMerit(dsp.merit.MAGICAL_ACCURACY);
    end

    return magicAccBonus;
end;

function handleAfflatusMisery(caster, spell, dmg)
    if (caster:hasStatusEffect(dsp.effect.AFFLATUS_MISERY)) then
        local misery = caster:getMod(dsp.mod.AFFLATUS_MISERY);
        -- According to BGWiki Caps at 300 magic damage.
        local miseryMax = 300

        miseryMax = miseryMax * (1 - caster:getMerit(dsp.merit.ANIMUS_MISERY)/100)

        -- BGwiki puts the boost capping at 200% bonus at 1/4th max HP.
        if (misery > miseryMax) then
            misery = miseryMax;
        end;

        -- Damage is 2x at boost cap.
        local boost = 1 + (misery / miseryMax);

        dmg = math.floor(dmg * boost);

        -- printf("AFFLATUS MISERY: Damage boosted by %f to %d", boost, dmg);

        --Afflatus Mod is Used Up...
        caster:setMod(dsp.mod.AFFLATUS_MISERY, 0)
    end
    return dmg;
end;

 function finalMagicAdjustments(caster,target,spell,dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    -- handle multiple targets
    if (caster:isSpellAoE(spell:getID())) then
        local total = spell:getTotalTargets()

        if (total > 9) then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4
        elseif (total > 1) then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total)
        end

        -- kill shadows
        -- target:delStatusEffect(dsp.effect.COPY_IMAGE)
        -- target:delStatusEffect(dsp.effect.BLINK)
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1)

        -- if (dmg == 0) then
            -- spell:setMsg(dsp.msg.basic.SHADOW_ABSORB)
            -- return 1
        -- end
    end

    local skill = spell:getSkillType()
    if (skill == dsp.skill.ELEMENTAL_MAGIC) then
        dmg = dmg * ELEMENTAL_POWER
    elseif (skill == dsp.skill.DARK_MAGIC) then
        dmg = dmg * DARK_POWER
    elseif (skill == dsp.skill.NINJUTSU) then
        dmg = dmg * NINJUTSU_POWER
    elseif (skill == dsp.skill.DIVINE_MAGIC) then
        dmg = dmg * DIVINE_POWER
    end

    dmg = target:magicDmgTaken(dmg)

    if (dmg > 0) then
        dmg = dmg - target:getMod(dsp.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if (dmg < 0) then
        dmg = target:addHP(-dmg)
        spell:setMsg(dsp.msg.basic.MAGIC_RECOVERS_HP)
    else
        target:takeSpellDamage(caster, spell, dmg, dsp.attackType.MAGICAL, dsp.damageType.ELEMENTAL + spell:getElement())
        target:handleAfflatusMiseryDamage(dmg)
        target:updateEnmityFromDamage(caster,dmg)
        -- Only add TP if the target is a mob
        if (target:getObjType() ~= dsp.objType.PC) then
            target:addTP(100)
        end
    end

    return dmg
 end

function finalMagicNonSpellAdjustments(caster,target,ele,dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg);

    if (dmg > 0) then
        dmg = dmg - target:getMod(dsp.mod.PHALANX);
        dmg = utils.clamp(dmg, 0, 99999);
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);

    dmg = utils.clamp(dmg, -99999, 99999);

    if (dmg < 0) then
        dmg = -(target:addHP(-dmg));
    else
        target:takeDamage(dmg, caster, dsp.attackType.MAGICAL, dsp.damageType.ELEMENTAL + ele);
    end
    --Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    -- in the case that updating enmity is needed, do it manually after calling this
    --target:updateEnmityFromDamage(caster,dmg);

    return dmg;
end;

function adjustForTarget(target,dmg,ele)
    if (dmg > 0 and math.random(0,99) < target:getMod(dsp.magic.absorbMod[ele])) then
        return -dmg;
    end
    if (math.random(0,99) < target:getMod(nullMod[ele])) then
        return 0;
    end
    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg;
end;

function calculateMagicBurst(caster, spell, target, params)

    local burst = 1.0;
    local skillchainburst = 1.0;
    local modburst = 1.0;

    if (spell:getSpellGroup() == 3 and not caster:hasStatusEffect(dsp.effect.BURST_AFFINITY)) then
        return burst;
    end

    -- Obtain first multiplier from gear, atma and job traits
    modburst = modburst + (caster:getMod(dsp.mod.MAG_BURST_BONUS) / 100) + params.AMIIburstBonus;

    if caster:isBehind(target) and caster:hasStatusEffect(dsp.effect.INNIN) then
        modburst = modburst + (caster:getMerit(dsp.merit.INNIN_EFFECT)/100)
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    if (modburst > 1.4) then
        modburst = 1.4;
    end

    -- Obtain second multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target);

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then -- two weaponskills
            skillchainburst = 1.35;
        elseif (skillchainCount == 2) then -- three weaponskills
            skillchainburst = 1.45;
        elseif (skillchainCount == 3) then -- four weaponskills
             skillchainburst = 1.55;
        elseif (skillchainCount == 4) then -- five weaponskills
            skillchainburst = 1.65;
        elseif (skillchainCount == 5) then -- six weaponskills
            skillchainburst = 1.75;
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0;
        end
    end

    -- Multiply
    if (skillchainburst > 1) then
        burst = burst * modburst * skillchainburst;
    end

    return burst;
end;

function addBonuses(caster, spell, target, dmg, params)
    params = params or {};

    local ele = spell:getElement();

    local affinityBonus = AffinityBonusDmg(caster, ele);
    dmg = math.floor(dmg * affinityBonus);

    params.bonusmab = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense);

    local dayWeatherBonus = 1.00;
    local weather = caster:getWeather();

    if (weather == dsp.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (caster:getWeather() == dsp.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (weather == dsp.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (weather == dsp.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dsp.magic.dayStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(dsp.mod.DAY_NUKE_BONUS)/100; -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dsp.magic.dayWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local burst = calculateMagicBurst(caster, spell, target, params);

    if (burst > 1.0) then
        spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
    end

    dmg = math.floor(dmg * burst);
    local mabbonus = 0;
    local spellId = spell:getID();

    if (spellId >= 245 and spellId <= 248) then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(dsp.mod.ENH_DRAIN_ASPIR)/100;
        if spellId == 247 or spellId == 248 then
            mabbonus = mabbonus + caster:getMerit(dsp.merit.ASPIR_ABSORPTION_AMOUNT)/100
        end
    else
        local mab = caster:getMod(dsp.mod.MATT) + params.bonusmab;

        if spell:getSkillType() == dsp.skill.NINJUTSU then
            mab = mab + caster:getMerit(dsp.merit.NIN_MAGIC_BONUS)
        end

        local mab_crit = caster:getMod(dsp.mod.MAGIC_CRITHITRATE);
        if ( math.random(1,100) < mab_crit ) then
           mab = mab + ( 10 + caster:getMod(dsp.mod.MAGIC_CRIT_DMG_INCREASE ) );
        end

        local mdefBarBonus = 0;
        if (ele > 0 and ele <= 6) then
            mab = mab + caster:getMerit(blmMerit[ele]);
            if (target:hasStatusEffect(dsp.magic.barSpell[ele])) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(dsp.magic.barSpell[ele]):getSubPower();
            end
        end
        mabbonus = (100 + mab) / (100 + target:getMod(dsp.mod.MDEF) + mdefBarBonus);
    end

    if (mabbonus < 0) then
        mabbonus = 0;
    end

    dmg = math.floor(dmg * mabbonus);

    if (caster:hasStatusEffect(dsp.effect.EBULLIENCE)) then
        dmg = dmg * (1.2 + caster:getMod(dsp.mod.EBULLIENCE_AMOUNT)/100);
        caster:delStatusEffectSilent(dsp.effect.EBULLIENCE);
    end

    dmg = math.floor(dmg);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end;

function addBonusesAbility(caster, ele, target, dmg, params)

    local affinityBonus = AffinityBonusDmg(caster, ele);
    dmg = math.floor(dmg * affinityBonus);

    local magicDefense = getElementalDamageReduction(target, ele);
    dmg = math.floor(dmg * magicDefense);

    local dayWeatherBonus = 1.00;
    local weather = caster:getWeather();

    if (weather == dsp.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (caster:getWeather() == dsp.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    elseif (weather == dsp.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(dsp.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10;
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25;
        end
    elseif (weather == dsp.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25;
        end
    end

    local dayElement = VanadielDayElement();
    if (dayElement == dsp.magic.dayStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(dsp.mod.DAY_NUKE_BONUS)/100; -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.33 or caster:getMod(elementalObiStrong[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10;
        end
    elseif (dayElement == dsp.magic.dayWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObiWeak[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10;
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4;
    end

    dmg = math.floor(dmg * dayWeatherBonus);

    local mab = 1;
    local mdefBarBonus = 0;
    if (ele > 0 and ele <= 6 and target:hasStatusEffect(dsp.magic.barSpell[ele])) then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(dsp.magic.barSpell[ele]):getSubPower();
    end

    if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
        mab = (100 + caster:getMod(dsp.mod.MATT) + params.bonusmab) / (100 + target:getMod(dsp.mod.MDEF) + mdefBarBonus);
    elseif (params == nil or (params ~= nil and params.includemab == true)) then
        mab = (100 + caster:getMod(dsp.mod.MATT)) / (100 + target:getMod(dsp.mod.MDEF) + mdefBarBonus);
    end

    if (mab < 0) then
        mab = 0;
    end

    dmg = math.floor(dmg * mab);

    -- print(affinityBonus);
    -- print(speciesReduction);
    -- print(dayWeatherBonus);
    -- print(burst);
    -- print(mab);
    -- print(magicDmgMod);

    return dmg;
end;

-- get elemental damage reduction
function getElementalDamageReduction(target, element)
    local defense = 1;
    if (element > 0) then
        defense = 1 - (target:getMod(dsp.magic.defenseMod[element]) / 256);

        return utils.clamp(defense, 0.0, 2.0);
    end

    return defense;
end

---------------------------------------------
--  Elemental Debuff Potency functions
---------------------------------------------

function getElementalDebuffDOT(INT)
    local DOT = 0;
    if (INT<= 39) then
        DOT = 1;
    elseif (INT <= 69) then
        DOT = 2;
    elseif (INT <= 99) then
        DOT = 3;
    elseif (INT <= 149) then
        DOT = 4;
    else
        DOT = 5;
    end
    return DOT;
end;

function getElementalDebuffStatDownFromDOT(dot)
    local stat_down = 0;
    if (dot == 1) then
        stat_down = 5;
    elseif (dot == 2) then
        stat_down = 7;
    elseif (dot == 3) then
        stat_down = 9;
    elseif (dot == 4) then
        stat_down = 11;
    else
        stat_down = 13;
    end
    return stat_down;
end;

function getHelixDuration(caster)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local casterLevel = caster:getMainLvl();
    local duration = 30; --fallthrough
    if (casterLevel <= 39) then
        duration = 30;
    elseif (casterLevel <= 59) then
        duration = 60;
    elseif (casterLevel <= 99) then
        duration = 90;
    end
    return duration;
end;

function isHelixSpell(spell)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local id = spell:getID();
    if id >= 278 and id <= 285 then
        return true;
    end
    return false;
end;

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff = AffinityBonusAcc(caster, spell:getElement());
    -- print("staff=" .. staff);
    local dCHR = (caster:getStat(dsp.mod.CHR) - target:getStat(dsp.mod.CHR));
    -- print("dCHR=" .. dCHR);
    local params = {};
    params.attribute = dsp.mod.CHR;
    params.skillType = dsp.skill.SINGING;
    params.bonus = staff;

    local resm = applyResistance(caster, target, spell, params);
    -- print("rsem=" .. resm);

    if (resm < 0.5) then
        -- print("resm resist");
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST);
        return dsp.effect.THRENODY;
    end

    -- Remove previous Threnody
    target:delStatusEffect(dsp.effect.THRENODY);

    local iBoost = caster:getMod(dsp.mod.THRENODY_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT);
    local power = basePower + iBoost*5;
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5;
    end

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2;
    end

    -- Set spell message and apply status effect
    target:addStatusEffect(dsp.effect.THRENODY, -power, 0, duration, 0, modifier, 0);

    return dsp.effect.THRENODY;
end;

function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
    -- Add new
    target:addStatusEffectEx(dsp.effect.NINJUTSU_ELE_DEBUFF, 0, basePower, 0, baseDuration, 0, modifier, 0);
    return dsp.effect.NINJUTSU_ELE_DEBUFF;
end;

-- Returns true if you can overwrite the effect
-- Example: canOverwrite(target, dsp.effect.SLOW, 25)
function canOverwrite(target, effect, power, mod)
    mod = mod or 1;

    local statusEffect = target:getStatusEffect(effect);

    -- effect not found so overwrite
    if (statusEffect == nil) then
        return true;
    end

    -- overwrite if its weaker
    if (statusEffect:getPower()*mod > power) then
        return false;
    end

    return true;
end

function doElementalNuke(caster, spell, target, spellParams)
    local DMG = 0;
    local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT);
    local V = 0;
    local M = 0;

    if USE_OLD_MAGIC_DAMAGE and spellParams.V ~= nil and spellParams.M ~= nil then
        V = spellParams.V; -- Base value
        M = spellParams.M; -- Tier multiplier
        local I = spellParams.I; -- Inflection point
        local cap = I * 2 + V; -- Base damage soft cap

        if dINT < 0 then
            -- If dINT is a negative value the tier multiplier is always 1
            DMG = V + dINT;

            -- Check/ set lower limit of 0 damage for negative dINT
            if DMG < 1 then
                return 0;
            end

        elseif dINT < I then
             -- If dINT > 0 but below inflection point I
            DMG = V + dINT * M;

        else
             -- Above inflection point I additional dINT is only half as effective
            DMG = V + I + ((dINT - I) * (M / 2));
        end

        -- Check/ set damage soft cap
        if DMG > cap then
            DMG = cap;
        end

    else
        local hasMultipleTargetReduction = spellParams.hasMultipleTargetReduction; --still unused!!!
        local resistBonus = spellParams.resistBonus;
        local mDMG = caster:getMod(dsp.mod.MAGIC_DAMAGE);

        --[[
                Calculate base damage:
                D = mDMG + V + (dINT × M)
                D is then floored
                For dINT reduce by amount factored into the V value (example: at 134 INT, when using V100 in the calculation, use dINT = 134-100 = 34)
        ]]

        if (dINT <= 49) then
            V = spellParams.V0;
            M = spellParams.M0;
            DMG = math.floor(DMG + mDMG + V + (dINT * M));

            if (DMG <= 0) then
                return 0;
            end

        elseif (dINT >= 50 and dINT <= 99) then
            V = spellParams.V50;
            M = spellParams.M50;
            DMG = math.floor(DMG + mDMG + V + ((dINT - 50) * M));

        elseif (dINT >= 100 and dINT <= 199) then
            V = spellParams.V100;
            M = spellParams.M100;
            DMG = math.floor(DMG + mDMG + V + ((dINT - 100) * M));

        elseif (dINT > 199) then
            V = spellParams.V200;
            M = spellParams.M200;
            DMG = math.floor(DMG + mDMG + V + ((dINT - 200) * M));
        end
    end

    --get resist multiplier (1x if no resist)
    local params = {};
    params.attribute = dsp.mod.INT;
    params.skillType = dsp.skill.ELEMENTAL_MAGIC;
    params.resistBonus = resistBonus;

    local resist = applyResistance(caster, target, spell, params);

    --get the resisted damage
    DMG = DMG * resist;

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    DMG = addBonuses(caster, spell, target, DMG, spellParams);

    --add in target adjustment
    local ele = spell:getElement();
    DMG = adjustForTarget(target, DMG, ele);

    --add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG);

    return DMG;
end

function doDivineNuke(caster, target, spell, params)
    params.skillType = dsp.skill.DIVINE_MAGIC;
    params.attribute = dsp.mod.MND;

    return doNuke(caster, target, spell, params);
end

function doNinjutsuNuke(caster, target, spell, params)
    local mabBonus = params.mabBonus;

    mabBonus = mabBonus or 0;

    mabBonus = mabBonus + caster:getMod(dsp.mod.NIN_NUKE_BONUS); -- "enhances ninjutsu damage" bonus
    if (caster:hasStatusEffect(dsp.effect.INNIN) and caster:isBehind(target, 23)) then -- Innin mag atk bonus from behind, guesstimating angle at 23 degrees
        mabBonus = mabBonus + caster:getStatusEffect(dsp.effect.INNIN):getPower();
    end
    params.skillType = dsp.skill.NINJUTSU;
    params.attribute = dsp.mod.INT;
    params.mabBonus = mabBonus;

    return doNuke(caster, target, spell, params);
end

function doNuke(caster, target, spell, params)
    --calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params);
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params);
    --get the resisted damage
    dmg = dmg*resist;
    if (skill == dsp.skill.NINJUTSU) then
        if (caster:getMainJob() == dsp.job.NIN) then -- NIN main gets a bonus to their ninjutsu nukes
            local ninSkillBonus = 100;
            if (spell:getID() % 3 == 2) then -- ichi nuke spell ids are 320, 323, 326, 329, 332, and 335
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(dsp.skill.NINJUTSU) - 50)/2); -- getSkillLevel includes bonuses from merits and modifiers (ie. gear)
            elseif (spell:getID() % 3 == 0) then -- ni nuke spell ids are 1 more than their corresponding ichi spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(dsp.skill.NINJUTSU) - 125)/2);
            else -- san nuke spell, also has ids 1 more than their corresponding ni spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(dsp.skill.NINJUTSU) - 275)/2);
            end
            ninSkillBonus = utils.clamp(ninSkillBonus, 100, 200); -- bonus caps at +100%, and does not go negative
            dmg = dmg * ninSkillBonus/100;
        end
        -- boost with Futae
        if (caster:hasStatusEffect(dsp.effect.FUTAE)) then
            dmg = math.floor(dmg * 1.50);
            caster:delStatusEffect(dsp.effect.FUTAE);
        end
    end

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);
    return dmg;
end

function doDivineBanishNuke(caster, target, spell, params)
    params.skillType = dsp.skill.DIVINE_MAGIC;
    params.attribute = dsp.mod.MND;

    --calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params);
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params);
    --get the resisted damage
    dmg = dmg*resist;

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --handling afflatus misery
    dmg = handleAfflatusMisery(caster, spell, dmg);
    --add in final adjustments
    dmg = finalMagicAdjustments(caster,target,spell,dmg);
    return dmg;
end

function calculateDurationForLvl(duration, spellLvl, targetLvl)
    if (targetLvl < spellLvl) then
        return duration * targetLvl / spellLvl;
    end

    return duration;
end

function calculateDuration(duration, magicSkill, spellGroup, caster, target, useComposure)
    if magicSkill == dsp.skill.ENHANCING_MAGIC then -- Enhancing Magic
        -- Gear mods
        duration = duration + duration * caster:getMod(dsp.mod.ENH_MAGIC_DURATION) / 100

        -- prior according to bg-wiki
        duration = duration + caster:getMerit(dsp.merit.ENHANCING_MAGIC_DURATION)

        -- Default is true
        useComposure = useComposure or (useComposure == nill and true)

        -- Composure
        if useComposure and caster:hasStatusEffect(dsp.effect.COMPOSURE) and caster:getID() == target:getID() then
            duration = duration * 3
        end

        -- Perpetuance
        if caster:hasStatusEffect(dsp.effect.PERPETUANCE) and spellGroup == dsp.magic.spellGroup.WHITE then
            duration  = duration * 2
        end
    elseif magicSkill == dsp.skill.ENFEEBLING_MAGIC then -- Enfeebling Magic
        if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
            duration = duration * 2
        end

        -- After Saboteur according to bg-wiki
        duration = duration + caster:getMerit(dsp.merit.ENFEEBLING_MAGIC_DURATION)
    end

    return math.floor(duration)
end

function calculatePotency(basePotency, magicSkill, caster, target)
    if magicSkill ~= dsp.skill.ENFEEBLING_MAGIC then
        return basePotency
    end

    if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
        if target:isNM() then
            basePotency = math.floor(basePotency * (1.3 + caster:getMod(dsp.mod.ENHANCES_SABOTEUR)))
        else
            basePotency = math.floor(basePotency * (2 + caster:getMod(dsp.mod.ENHANCES_SABOTEUR)))
        end
    end

    return math.floor(basePotency * (1 + caster:getMod(dsp.mod.ENF_MAG_POTENCY) / 100))
end

-- Output magic hit rate for all levels
function outputMagicHitRateInfo()
    for casterLvl = 1, 75 do

        printf("");
        printf("-------- CasterLvl: %d", casterLvl);

        for lvlMod = -5, 20 do

            local targetLvl = casterLvl + lvlMod;

            if (targetLvl >= 0) then
                -- assume BLM spell, A+
                local magicAcc = utils.getSkillLvl(6, casterLvl);
                -- assume default monster magic eva, D
                local magicEvaRank = 3;
                local rate = 0;

                local magicEva = utils.getMobSkillLvl(magicEvaRank, targetLvl);

                local dINT = (lvlMod + 1) * -1;

                if (dINT > 10) then
                    magicAcc = magicAcc + 10 + (dINT - 10)/2;
                else
                    magicAcc = magicAcc + dINT;
                end

                local magicHitRate = calculateMagicHitRate(magicAcc, magicEva, 0, casterLvl, targetLvl);

                printf("Lvl: %d vs %d, %d%%, MA: %d, ME: %d", casterLvl, targetLvl, magicHitRate, magicAcc, magicEva);
            end

        end
    end
end;

-- outputMagicHitRateInfo();

dsp.mag = dsp.magic;
