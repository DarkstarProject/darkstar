require("scripts/globals/magicburst")
require("scripts/globals/status")
require("scripts/globals/weather")
require("scripts/globals/utils")

    MMSG_BUFF_FAIL = 75;

    DIVINE_MAGIC_SKILL     = 32;
    HEALING_MAGIC_SKILL    = 33;
    ENHANCING_MAGIC_SKILL  = 34;
    ENFEEBLING_MAGIC_SKILL = 35;
    ELEMENTAL_MAGIC_SKILL  = 36;
    DARK_MAGIC_SKILL       = 37;
    NINJUTSU_SKILL         = 39;
    SUMMONING_SKILL        = 38;
    SINGING_SKILL          = 40;
    STRING_SKILL           = 41;
    WIND_SKILL             = 42;
    BLUE_SKILL             = 43;

    FIRESDAY      = 0;
    EARTHSDAY     = 1;
    WATERSDAY     = 2;
    WINDSDAY      = 3;
    ICEDAY        = 4;
    LIGHTNINGDAY  = 5;
    LIGHTSDAY     = 6;
    DARKSDAY      = 7;

    ELE_NONE      = 0;
    ELE_FIRE      = 1;
    ELE_EARTH     = 2;
    ELE_WATER     = 3;
    ELE_WIND      = 4;
    ELE_ICE       = 5;
    ELE_LIGHTNING = 6;
    -- added both because monsterstpmoves calls it thunder
    ELE_THUNDER   = 6;
    ELE_LIGHT     = 7;
    ELE_DARK      = 8;

	dayStrong = {FIRESDAY, EARTHSDAY, WATERSDAY, WINDSDAY, ICEDAY, LIGHTNINGDAY, LIGHTSDAY, DARKSDAY};
	dayWeak = {WATERSDAY, WINDSDAY, LIGHTNINGDAY, ICEDAY, FIRESDAY, EARTHSDAY, DARKSDAY, LIGHTSDAY};
	singleWeatherStrong = {WEATHER_HOT_SPELL, WEATHER_DUST_STORM, WEATHER_RAIN, WEATHER_WIND, WEATHER_SNOW, WEATHER_THUNDER, WEATHER_AURORAS, WEATHER_GLOOM};
	doubleWeatherStrong = {WEATHER_HEAT_WAVE, WEATHER_SAND_STORM, WEATHER_SQUALL, WEATHER_GALES, WEATHER_BLIZZARDS, WEATHER_THUNDERSTORMS, WEATHER_STELLAR_GLARE, WEATHER_DARKNESS};
	singleWeatherWeak = {WEATHER_RAIN, WEATHER_WIND, WEATHER_THUNDER, WEATHER_SNOW, WEATHER_HOT_SPELL, WEATHER_DUST_STORM, WEATHER_GLOOM, WEATHER_AURORAS};
	doubleWeatherWeak = {WEATHER_SQUALL, WEATHER_GALES, WEATHER_THUNDERSTORMS, WEATHER_BLIZZARDS, WEATHER_HEAT_WAVE, WEATHER_SAND_STORM, WEATHER_DARKNESS, WEATHER_STELLAR_GLARE};
	elementalObi = {15435, 15438, 15440, 15437, 15436, 15439, 15441, 15442};
	elementalObiWeak = {15440, 15437, 15439, 15436, 15435, 15438, 15442, 15441};
	spellAcc = {MOD_FIREACC, MOD_EARTHACC, MOD_WATERACC, MOD_WINDACC, MOD_ICEACC, MOD_THUNDERACC, MOD_LIGHTACC, MOD_DARKACC};
	strongAffinity = {MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_ICE_AFFINITY, MOD_THUNDER_AFFINITY, MOD_LIGHT_AFFINITY, MOD_DARK_AFFINITY};
	weakAffinity = {MOD_WATER_AFFINITY, MOD_WIND_AFFINITY, MOD_THUNDER_AFFINITY, MOD_ICE_AFFINITY, MOD_FIRE_AFFINITY, MOD_EARTH_AFFINITY, MOD_DARK_AFFINITY, MOD_LIGHT_AFFINITY};
	resistMod = {MOD_FIRERES, MOD_EARTHRES, MOD_WATERRES, MOD_WINDRES, MOD_ICERES, MOD_THUNDERRES, MOD_LIGHTRES, MOD_DARKRES};
	defenseMod = {MOD_FIREDEF, MOD_EARTHDEF, MOD_WATERDEF, MOD_WINDDEF, MOD_ICEDEF, MOD_THUNDERDEF, MOD_LIGHTDEF, MOD_DARKDEF};
    absorbMod = {MOD_FIRE_ABSORB, MOD_EARTH_ABSORB, MOD_WATER_ABSORB, MOD_WIND_ABSORB, MOD_ICE_ABSORB, MOD_LTNG_ABSORB, MOD_LIGHT_ABSORB, MOD_DARK_ABSORB};
    nullMod = {MOD_FIRE_NULL, MOD_EARTH_NULL, MOD_WATER_NULL, MOD_WIND_NULL, MOD_ICE_NULL, MOD_LTNG_NULL, MOD_LIGHT_NULL, MOD_DARK_NULL};

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- V - The base damage of the spell
-- M - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually MOD_INT , except for things like Banish which is MOD_MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
SOFT_CAP = 60; --guesstimated
HARD_CAP = 120; --guesstimated

function calculateMagicDamage(V,M,player,spell,target,skilltype,atttype,hasMultipleTargetReduction)

    local dint = player:getStat(atttype) - target:getStat(atttype);
    local dmg = V;

    if(dint<=0) then --ifdINT penalises, it's always M=1
        dmg = dmg + dint;
        if(dmg <= 0) then --dINT penalty cannot result in negative damage (target absorption)
            return 0;
        end
    elseif(dint > 0 and dint <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dint*M);
    elseif(dint > 0 and dint > SOFT_CAP and dint < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP*M + ((dint-SOFT_CAP)*M)/2;
    elseif(dint > 0 and dint > SOFT_CAP and dint >= HARD_CAP) then --After HARD_CAP, INT has no effect.
        dmg = dmg + HARD_CAP*M;
    end


    if(skilltype == DIVINE_MAGIC_SKILL and target:isUndead()) then
        -- 150% bonus damage
        dmg = dmg * 1.5;
    end

    -- printf("dmg: %d dint: %d\n", dmg, dint);

    return dmg;

end;

function doBoostGain(caster,target,spell,effect)
    local duration = 300;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    --calculate potency
    local magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL);

    local potency = math.floor((magicskill - 300) / 10) + 5;

    if(potency > 25) then
        potency = 25;
    elseif(potency < 5) then
        potency = 5;
    end

    --printf("BOOST-GAIN: POTENCY = %d", potency);

    --Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
    local effectOverwrite = {80, 81, 82, 83, 84, 85, 86};

    for i, effect in ipairs(effectOverwrite) do
            --printf("BOOST-GAIN: CHECKING FOR EFFECT %d...",effect);
            if(caster:hasStatusEffect(effect)) then
                --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...",effect);
                caster:delStatusEffect(effect);
            end
    end

    if(target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end
end;

function doEnspell(caster,target,spell,effect)

    if(effect==EFFECT_BLOOD_WEAPON) then
        target:addStatusEffect(EFFECT_BLOOD_WEAPON,1,0,30);
        return;
    end

    local duration = 180;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end
    --calculate potency
    local magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL);

    local potency = 3 + math.floor((6*magicskill)/100);
    if(magicskill>200) then
        potency = 5 + math.floor((5*magicskill)/100);
    end

    if(target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end
end;


 ---------------------------------
 --   Author: ZeDingo
 --   getCurePower returns the caster's cure power
 --   getCureFinal returns the final cure amount
 --   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
 ---------------------------------
 function getCurePower(caster,isBlueMagic)
	local MND = caster:getStat(MOD_MND);
	local VIT = caster:getStat(MOD_VIT);
	local skill = caster:getSkillLevel(HEALING_MAGIC_SKILL) + caster:getMod(MOD_HEALING);
	local power = math.floor(MND/2) + math.floor(VIT/4) + skill;
	return power;
end;
function getCurePowerOld(caster)
	local MND = caster:getStat(MOD_MND);
	local VIT = caster:getStat(MOD_VIT);
	local skill = caster:getSkillLevel(HEALING_MAGIC_SKILL) + caster:getMod(MOD_HEALING);--it's healing magic skill for the BLU cures as well
	local power = ((3 * MND) + VIT + (3 * math.floor(skill/5)));
	return power;
end;
function getBaseCure(power,divisor,constant,basepower)
	return ((power - basepower) / divisor) + constant;
end;
function getBaseCureOld(power,divisor,constant)
	return (power / 2) / divisor + constant;
end;

function getCureFinal(caster,spell,basecure,minCure,isBlueMagic)
	if(basecure < minCure) then
		basecure = minCure;
	end

	local potency = 1 + (caster:getMod(MOD_CURE_POTENCY) / 100);
	if(potency > 1.5) then
		potency = 1.5;
	end

	local dSeal = 1;
	if (caster:hasStatusEffect(EFFECT_DIVINE_SEAL)) then
		dSeal = 2;
	end

	local rapture = 1;
	if(isBlueMagic == false) then --rapture doesn't affect BLU cures as they're not white magic
		if (caster:hasStatusEffect(EFFECT_RAPTURE)) then
			local equippedHead = caster:getEquipID(SLOT_HEAD);
			if(equippedHead == 11183) then
				rapture = 1.55; --savant's bonnet +1
			elseif(equippedHead == 11083) then
				rapture = 1.6; --savant's bonnet +2
			else
				rapture = 1.5;
			end
			caster:delStatusEffectSilent(EFFECT_RAPTURE);
		end
	end
	local dayWeatherBonus = 1;
	local ele = spell:getElement();

	local castersWeather = caster:getWeather();
	local equippedMain = caster:getEquipID(SLOT_MAIN);
	local equippedWaist = caster:getEquipID(SLOT_WAIST);

	if(castersWeather == singleWeatherStrong[ele]) then
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(castersWeather == singleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif(castersWeather == doubleWeatherStrong[ele]) then
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif(castersWeather == doubleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	local dayElement = VanadielDayElement();
	if(dayElement == dayStrong[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(dayElement == dayWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	end

	if(dayWeatherBonus > 1.35) then
		dayWeatherBonus = 1.35;
	end

	local final = math.floor(math.floor(math.floor(math.floor(basecure) * potency) * dayWeatherBonus) * rapture) * dSeal;
	return final;
end;

function getCureAsNukeFinal(caster,spell,power,divisor,constant,basepower)
	return getCureFinal(caster,spell,power,divisor,constant,basepower);
end;

-----------------------------------
--    Author: ReaperX
--     Returns the staff bonus for the caster and spell.
-----------------------------------

-- affinities that strengthen/weaken the index element


function AffinityBonus(caster,ele)

	local bonus = 1.00;

    local affinity = caster:getMod(strongAffinity[ele]) - caster:getMod(weakAffinity[ele]);

	-- Iridal and Chatoyant will return affinity for strong and weak, cancelling their bonus out, so they need to be specifically checked.
	-- Could do an if strong == weak, but that would cause problems once/if augments or magian gear is added.
	local equippedMain = caster:getEquipID(SLOT_MAIN);
	if (equippedMain == 18632) then
		affinity = affinity + 1;
	elseif (equippedMain == 18633) then
		affinity = affinity + 2;
	end

	if(affinity > 0) then
		bonus = bonus + 0.05 + 0.05 * affinity;
	elseif(affinity < 0) then
		bonus = bonus - 0.05 + 0.05 * affinity;
	end

    return bonus;

end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(player,spell,target,diff,skill,bonus)

    local resist = 1.0;
    local magicaccbonus = 0;
    local element = spell:getElement();

    if(bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if (skill == SINGING_SKILL and player:hasStatusEffect(EFFECT_TROUBADOUR)) then
        if (math.random(0,99) < player:getMerit(MERIT_TROUBADOUR)-25) then
            return 1.0;
        end
    end

	--get the base acc (just skill plus magic acc mod)
	local magicacc = player:getSkillLevel(skill) + player:getMod(79 + skill) + player:getMod(MOD_MACC) + player:getILvlMacc();

	if player:hasStatusEffect(EFFECT_ALTRUISM) and spell:getSpellGroup() == SPELLGROUP_WHITE then
		magicacc = magicacc + player:getStatusEffect(EFFECT_ALTRUISM):getPower();
	end
	if player:hasStatusEffect(EFFECT_FOCALIZATION) and spell:getSpellGroup() == SPELLGROUP_BLACK then
		magicacc = magicacc + player:getStatusEffect(EFFECT_FOCALIZATION):getPower();
	end
	--difference in int/mnd
	if(diff > 10) then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end
	--add acc for ele/dark seal
    if(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
        magicaccbonus = magicaccbonus + 256;
    end

    if (element > ELE_NONE) then
        -- Add acc for staves
        local affinityBonus = AffinityBonus(player, element);
        magicaccbonus = magicaccbonus + (affinityBonus-1) * 200;
    end

    --add acc for RDM group 1 merits
    if(player:getMainJob() == JOB_RDM and player:getMainLvl() >= 75) then
        if(element == ELE_FIRE) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_FIRE_MAGIC_ACCURACY);
        elseif(element == ELE_EARTH) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_EARTH_MAGIC_ACCURACY);
        elseif(element == ELE_WATER) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_WATER_MAGIC_ACCURACY);
        elseif(element == ELE_WIND) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_WIND_MAGIC_ACCURACY);
        elseif(element == ELE_ICE) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_ICE_MAGIC_ACCURACY);
        elseif(element == ELE_LIGHTNING) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_LIGHTNING_MAGIC_ACCURACY);
        end
    end
    local skillchainTier, skillchainCount = FormMagicBurst(element, target);
    --add acc for skillchains
    if(skillchainTier > 0) then
		magicaccbonus = magicaccbonus + 25;
    end

    local resMod = 0; -- Some spells may possibly be non elemental, but could be resisted via meva.
    if (element > ELE_NONE) then
        resMod = target:getMod(resistMod[element]);
    end
    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    local magiceva = target:getMod(MOD_MEVA) + resMod;

	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	local multiplier = 0;
	if player:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (player:getMainLvl() * 3);
	end;
	local p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
    -- printf("acc: %f, eva: %f, bonus: %f, element: %u", magicacc, magiceva, magicaccbonus, element);


	--double any acc over 50 if it's over 50
	if(p > 5) then
		p = 5 + (p - 5) * 2;
	end

	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	local leveldiff = player:getMainLvl() - target:getMainLvl();
	if(leveldiff < 0) then
		p = p - (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	end
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p);
    local quart = ((1 - p)^2);
    local eighth = ((1 - p)^3);
    local sixteenth = ((1 - p)^4);
    -- print("HALF:",half);
    -- print("QUART:",quart);
    -- print("EIGHTH:",eighth);
    -- print("SIXTEENTH:",sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;

end;

-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)

function applyResistanceEffect(player,spell,target,diff,skill,bonus,effect)
    -- resist everything if magic shield is active
    if(target:hasStatusEffect(EFFECT_MAGIC_SHIELD, 0)) then
        return 0;
    end

    -- If Stymie is active, as long as the mob is not immune then the effect is not resisted
    if(player:hasStatusEffect(EFFECT_STYMIE) and target:canGainStatusEffect(effect)) then
    	player:delStatusEffect(EFFECT_STYMIE);
    	return 1;
    end

    local resist = 1.0;
    local magicaccbonus = 0;
    local element = spell:getElement();

    if(bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

    if (skill == SINGING_SKILL and player:hasStatusEffect(EFFECT_TROUBADOUR)) then
        if (math.random(0,99) < player:getMerit(MERIT_TROUBADOUR)-25) then
            return 1.0;
        end
    end

    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
	local magicacc = player:getSkillLevel(skill) + player:getMod(79 + skill) + player:getMod(MOD_MACC);

	if player:hasStatusEffect(EFFECT_ALTRUISM) and spell:getSpellGroup() == SPELLGROUP_WHITE then
		magicacc = magicacc + player:getStatusEffect(EFFECT_ALTRUISM):getPower();
	end
	if player:hasStatusEffect(EFFECT_FOCALIZATION) and spell:getSpellGroup() == SPELLGROUP_BLACK then
		magicacc = magicacc + player:getStatusEffect(EFFECT_FOCALIZATION):getPower();
	end
	--difference in int/mnd
	if(diff > 10) then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end
	--add acc for ele/dark seal
    if(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
        magicaccbonus = magicaccbonus + 256;
    end

    if (element > ELE_NONE) then
        -- Add acc for staves
        local affinityBonus = AffinityBonus(player, element);
        magicaccbonus = magicaccbonus + (affinityBonus-1) * 200;
    end

    --add acc for RDM group 1 merits
    if(player:getMainJob() == JOB_RDM and player:getMainLvl() >= 75) then
        if(element == ELE_FIRE) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_FIRE_MAGIC_ACCURACY);
        elseif(element == ELE_EARTH) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_EARTH_MAGIC_ACCURACY);
        elseif(element == ELE_WATER) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_WATER_MAGIC_ACCURACY);
        elseif(element == ELE_WIND) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_WIND_MAGIC_ACCURACY);
        elseif(element == ELE_ICE) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_ICE_MAGIC_ACCURACY);
        elseif(element == ELE_LIGHTNING) then
            magicaccbonus = magicaccbonus + player:getMerit(MERIT_LIGHTNING_MAGIC_ACCURACY);
        end
    end
    local skillchainTier, skillchainCount = FormMagicBurst(element, target);
    --add acc for skillchains
    if(skillchainTier > 0) then
		magicaccbonus = magicaccbonus + 25;
    end

    local resMod = 0; -- Some spells may possibly be non elemental, but have status effects.
    if (element > ELE_NONE) then
        resMod = target:getMod(resistMod[element]);
    end
    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    local magiceva = target:getMod(MOD_MEVA) + resMod;

	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	local multiplier = 0;
	if player:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (player:getMainLvl() * 3);
	end;
	local p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
    -- printf("acc: %f, eva: %f, bonus: %f, element: %u", magicacc, magiceva, magicaccbonus, element);


	--double any acc over 50 if it's over 50
	if(p > 5) then
		p = 5 + (p - 5) * 2;
	end

	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	local leveldiff = player:getMainLvl() - target:getMainLvl();
	if(leveldiff < 0) then
		p = p - (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	end
	
    -- add effect resistence
    if(effect ~= nil and effect > 0) then
        local effectres = 0;
        if(effect == EFFECT_SLEEP_I or effect == EFFECT_SLEEP_II or effect == EFFECT_LULLABY) then
            effectres = MOD_SLEEPRES;
        elseif(effect == EFFECT_POISON) then
            effectres = MOD_POISONRES;
        elseif(effect == EFFECT_PARALYZE) then
            effectres = MOD_PARALYZERES;
        elseif(effect == EFFECT_BLINDNESS) then
            effectres = MOD_BLINDRES
        elseif(effect == EFFECT_SILENCE) then
            effectres = MOD_SILENCERES;
        elseif(effect == EFFECT_PLAGUE or effect == EFFECT_DISEASE) then
            effectres = MOD_VIRUSRES;
        elseif(effect == EFFECT_PETRIFICATION) then
            effectres = MOD_PETRIFYRES;
        elseif(effect == EFFECT_BIND) then
            effectres = MOD_BINDRES;
        elseif(effect == EFFECT_CURSE_I or effect == EFFECT_CURSE_II or effect == EFFECT_BANE) then
            effectres = MOD_CURSERES;
        elseif(effect == EFFECT_WEIGHT) then
            effectres = MOD_GRAVITYRES;
        elseif(effect == EFFECT_SLOW) then
            effectres = MOD_SLOWRES;
        elseif(effect == EFFECT_STUN) then
            effectres = MOD_STUNRES;
        elseif(effect == EFFECT_CHARM) then
            effectres = MOD_CHARMRES;
        elseif(effect == EFFECT_AMNESIA) then
            effectres = MOD_AMNESIARES;
        end

        if(effectres > 0) then
            p = p - target:getMod(effectres);
        end
    end
	
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    half = (1 - p);
    quart = half^2;
    eighth = half^3;
    sixteenth = half^4;
    -- printf("HALF: %f", half);
    -- printf("QUART: %f", quart);
    -- printf("EIGHTH: %f", eighth);
    -- printf("SIXTEENTH: %f", sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;

end;

--Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(player,target,element,skill,bonus)

    local resist = 1.0;
    local magicaccbonus = 0;

    if(bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

	--get the base acc (just skill plus magic acc mod)

	local magicacc = player:getSkillLevel(skill) + player:getMod(79 + skill) + player:getMod(MOD_MACC);

    if(element > ELE_NONE) then
        --add acc for staves
        local affinityBonus = AffinityBonus(player, element);
        magicaccbonus = magicaccbonus + (affinityBonus-1) * 200;
    end

	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	local magiceva = target:getMod(MOD_MEVA);
    if(element > ELE_NONE) then
        magiceva = magiceva + target:getMod(resistMod[element]);
    end

	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	local multiplier = 0;
	if player:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (player:getMainLvl() * 3);
	end;
	local p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
    -- printf("acc: %f, eva: %f, bonus: %f", magicacc, magiceva, magicaccbonus);

	--double any acc over 50 if it's over 50
	if(p > 5) then
		p = 5 + (p - 5) * 2;
	end

	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	local leveldiff = player:getMainLvl() - target:getMainLvl();
	if(leveldiff < 0) then
		p = p - (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	end
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p);
    local quart = ((1 - p)^2);
    local eighth = ((1 - p)^3);
    local sixteenth = ((1 - p)^4);
    -- print("HALF:",half);
    -- print("QUART:",quart);
    -- print("EIGHTH:",eighth);
    -- print("SIXTEENTH:",sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;

end;

--Applies resistance for additional effects
function applyResistanceAddEffect(player,target,element,bonus)

    local resist = 1.0;
    local magicaccbonus = 0;

    if(bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus;
    end

	--get the base acc (just skill plus magic acc mod)
    local magicacc = 0;

	--add acc for staves
	local affinityBonus = AffinityBonus(player, element);
	magicaccbonus = magicaccbonus + (affinityBonus-1) * 200;

	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	local magiceva = target:getMod(resistMod[element]);

	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	local multiplier = 0;
	if player:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (player:getMainLvl() * 3);
	end;
	local p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
    --printf("acc: %f, eva: %f, bonus: %f", magicacc, magiceva, magicaccbonus);

	--add a flat bonus that won't get doubled in the previous step
	p = p + 75;
	--add a scaling bonus or penalty based on difference of targets level from caster
	local leveldiff = player:getMainLvl() - target:getMainLvl();
	--[[if(leveldiff < 0) then
		p = p - (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (player:getMainLvl()) / 75 )) + leveldiff;
	end]]
    p = p + leveldiff*2;
	--cap accuracy
    if(p > 95) then
        p = 95;
    elseif(p < 5) then
        p = 5;
    end

	p = p / 100;

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p);
    local quart = ((1 - p)^2);
    local eighth = ((1 - p)^3);
    local sixteenth = ((1 - p)^4);
    --print("HALF: "..half);
    --print("QUART: "..quart);
    --print("EIGHTH: "..eighth);
    --print("SIXTEENTH: "..sixteenth);

    local resvar = math.random();

    -- Determine final resist based on which thresholds have been crossed.
    if(resvar <= sixteenth) then
        resist = 0.0625;
        --printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
    elseif(resvar <= eighth) then
        resist = 0.125;
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth);
    elseif(resvar <= quart) then
        resist = 0.25;
        --printf("Spell resisted to 1/4.  Threshold = %u",quart);
    elseif(resvar <= half) then
        resist = 0.5;
        --printf("Spell resisted to 1/2.  Threshold = %u",half);
    else
        resist = 1.0;
        --printf("1.0");
    end

    return resist;

end;

-----------------------------------
--    Author: Tenjou
--     SKILL LEVEL CALCULATOR
--     Returns a skill level based on level and rating.
--
--    See the translation of aushacho's work by Themanii:
--    http://home.comcast.net/~themanii/skill.html
--
--    The arguments are skill rank (numerical), and level.  1 is A+, 2 is A-, and so on.
-----------------------------------

function getSkillLvl(rank,level)

    local skill = 0; --Failsafe

    if(level <= 50) then --Levels 1-50
        if(rank == 1 or rank == 2) then --A-Rated Skill
            skill = (((level-1)*3)+6);
        elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
            skill = (((level-1)*2.9)+5);
        elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
            skill = (((level-1)*2.8)+5);
        elseif(rank == 9) then --D-Rated Skill
            skill = (((level-1)*2.7)+4);
        elseif(rank == 10) then --E-Rated Skill
            skill = (((level-1)*2.5)+4);
        elseif(rank == 11) then --F-Rated Skill
            skill = (((level-1)*2.3)+4);
        end
    elseif(level > 50 and level <= 60) then --Levels 51-60
        if(rank == 1 or rank == 2) then --A-Rated Skill
            skill = (((level-50)*5)+153);
        elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
            skill = (((level-50)*4.9)+147);
        elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
            skill = (((level-50)*4.8)+142);
        elseif(rank == 9) then --D-Rated Skill
            skill = (((level-50)*4.7)+136);
        elseif(rank == 10) then --E-Rated Skill
            skill = (((level-50)*4.5)+126);
        elseif(rank == 11) then --F-Rated Skill
            skill = (((level-50)*4.3)+116);
        end
    elseif(level > 60 and level <= 70) then --Levels 61-70
        if(rank == 1) then --A+ Rated Skill
            skill = (((level-60)*4.85)+203);
        elseif(rank == 2) then --A- Rated Skill
            skill = (((level-60)*4.10)+203);
        elseif(rank == 3) then --B+ Rated Skill
            skill = (((level-60)*3.70)+196);
        elseif(rank == 4) then --B Rated Skill
            skill = (((level-60)*3.23)+196);
        elseif(rank == 5) then --B- Rated Skill
            skill = (((level-60)*2.70)+196);
        elseif(rank == 6) then --C+ Rated Skill
            skill = (((level-60)*2.50)+190);
        elseif(rank == 7) then --C Rated Skill
            skill = (((level-60)*2.25)+190);
        elseif(rank == 8) then --C- Rated Skill
            skill = (((level-60)*2.00)+190);
        elseif(rank == 9) then --D Rated Skill
            skill = (((level-60)*1.85)+183);
        elseif(rank == 10) then --E Rated Skill
            skill = (((level-60)*1.95)+171);
        elseif(rank == 11) then --F Rated Skill
            skill = (((level-60)*2.05)+159);
        end
    else --Level 71 and above
        if(rank == 1) then --A+ Rated Skill
            skill = (((level-70)*5)+251);
        elseif(rank == 2) then --A- Rated Skill
            skill = (((level-70)*5)+244);
        elseif(rank == 3) then --B+ Rated Skill
            skill = (((level-70)*3.70)+233);
        elseif(rank == 4) then --B Rated Skill
            skill = (((level-70)*3.23)+228);
        elseif(rank == 5) then --B- Rated Skill
            skill = (((level-70)*2.70)+223);
        elseif(rank == 6) then --C+ Rated Skill
            skill = (((level-70)*3)+215);
        elseif(rank == 7) then --C Rated Skill
            skill = (((level-70)*2.6)+212);
        elseif(rank == 8) then --C- Rated Skill
            skill = (((level-70)*2.00)+210);
        elseif(rank == 9) then --D Rated Skill
            skill = (((level-70)*1.85)+201);
        elseif(rank == 10) then --E Rated Skill
            skill = (((level-70)*1.95)+190);
        elseif(rank == 11) then --F Rated Skill
            skill = (((level-70)*2)+179);
        end
    end

    return skill;

 end;

function handleAfflatusMisery(caster, spell, dmg)
	if(caster:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then
		local misery = caster:getMod(MOD_AFFLATUS_MISERY);

		--BGwiki puts the boost capping at 200% bonus at around 300hp
		if(misery > 300) then
			misery = 300;
		end;

		--So, if wee capped at 300, we'll make the boost it boost 2x (200% damage)
		local boost = 1 + (misery / 300);

		local preboost = dmg;

		dmg = math.floor(dmg * boost);

		--printf("AFFLATUS MISERY: Boosting %d -> %f, Final %d", preboost, boost, dmg);

		--Afflatus Mod is Used Up...
		caster:setMod(MOD_AFFLATUS_MISERY, 0)
	end
	return dmg;
end;

 function finalMagicAdjustments(caster,target,spell,dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    -- handle multiple targets
    if(caster:isSpellAoE(spell:getID())) then
        local total = spell:getTotalTargets();

        if(total > 9) then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4;
        elseif(total > 1) then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total);
        end

        -- kill shadows
        -- target:delStatusEffect(EFFECT_COPY_IMAGE);
        -- target:delStatusEffect(EFFECT_BLINK);
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1);

        -- if(dmg == 0) then
            -- spell:setMsg(31);
            -- return 1;
        -- end
    end

    dmg = target:magicDmgTaken(dmg);

	if (dmg > 0) then
		dmg = dmg - target:getMod(MOD_PHALANX);
		utils.clamp(dmg, 0, 99999);
	end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);
    dmg = utils.clamp(dmg, -99999, 99999);

    if (dmg < 0) then
        dmg = target:addHP(-dmg);
        spell:setMsg(7);
    else
        target:delHP(dmg);
        target:updateEnmityFromDamage(caster,dmg);
        -- Only add TP if the target is a mob
        if (target:getObjType() ~= TYPE_PC) then
            target:addTP(10);
        end
    end

    return dmg;
 end;

function finalMagicNonSpellAdjustments(caster,target,ele,dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg);

	if (dmg > 0) then
		dmg = dmg - target:getMod(MOD_PHALANX);
		utils.clamp(dmg, 0, 99999);
	end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);

    dmg = utils.clamp(dmg, -99999, 99999);

    if (dmg < 0) then
        dmg = -(target:addHP(-dmg));
    else
        target:delHP(dmg);
    end
    --Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    -- in the case that updating enmity is needed, do it manually after calling this
    --target:updateEnmityFromDamage(caster,dmg);

    return dmg;
end;

function adjustForTarget(target,dmg,ele)
    if (dmg > 0 and math.random(0,99) < target:getMod(absorbMod[ele])) then
        return -dmg;
    end
    if (math.random(0,99) < target:getMod(nullMod[ele])) then
        return 0;
    end
    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg;
end;

function calculateMagicBurst(caster, spell, target)

    local burst = 1.0;

	if (spell:getSpellGroup() == 3 and not caster:hasStatusEffect(EFFECT_BURST_AFFINITY)) then
		return burst;
	end

    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target);

    if(skillchainTier > 0) then
		if(skillchainCount == 1) then
			burst = 1.3;
		elseif(skillchainCount == 2) then
			burst = 1.35;
		elseif(skillchainCount == 3) then
			 burst = 1.40;
		elseif(skillchainCount == 4) then
			burst = 1.45;
		elseif(skillchainCount == 5) then
			burst = 1.50;
		else
			-- Something strange is going on if this occurs.
			burst = 1.0;
		end


        -- TODO: This should be getting the spell ID, and checking
        --       if it is an Ancient Magic II spell.  Add 0.03
        --       to burstBonus for each merit the caster has for
        --       the given spell.

        -- AM 2 get magic burst bonuses
        --id = spell:getID();
        --if(id == 207 or id == 209 or id == 211 or id == 213 or id == 215 or id == 205) then
        --    if(AM2 Merit 1) then
        --        burstBonus = burstBonus + 0.03;
        --    elseif(AM2 Merit 2) then
        --        burstBonus += 0.06;
        --    elseif(AM2 Merit 3) then
        --        burstBonus += 0.09;
        --    elseif(AM2 Merit 4) then
        --        burstBonus += 0.12;
        --    end
        --end -- if AM2+
    end

    -- Add in Magic Burst Bonus Modifier
    if (burst > 1) then
        burst = burst + (caster:getMod(MOD_MAG_BURST_BONUS) / 100);
    end

    return burst;
end;

function addBonuses(caster, spell, target, dmg, bonusmab)
	local ele = spell:getElement();

	local affinityBonus = AffinityBonus(caster, spell:getElement());
	dmg = math.floor(dmg * affinityBonus);

	local speciesReduction = target:getMod(defenseMod[ele]);
	speciesReduction = 1.00 - (speciesReduction/1000);
	dmg = math.floor(dmg * speciesReduction);

	local dayWeatherBonus = 1.00;
	local equippedMain = caster:getEquipID(SLOT_MAIN);
	local equippedWaist = caster:getEquipID(SLOT_WAIST);
	local weather = caster:getWeather();

	if(weather == singleWeatherStrong[ele]) then
		-- Iridescence
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele] or isHelixSpell(spell)) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(caster:getWeather() == singleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif(weather == doubleWeatherStrong[ele]) then
		-- Iridescence
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele] or isHelixSpell(spell)) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif(weather == doubleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	local dayElement = VanadielDayElement();
	if(dayElement == dayStrong[ele]) then
		local equippedLegs = caster:getEquipID(SLOT_LEGS);
		if(equippedLegs == 15120 or equippedLegs == 15583) then
			dayWeatherBonus = dayWeatherBonus + 0.05;
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(dayElement == dayWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] or isHelixSpell(spell)) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	end

	if dayWeatherBonus > 1.35 then
		dayWeatherBonus = 1.35;
	end

	dmg = math.floor(dmg * dayWeatherBonus);

    local burst = calculateMagicBurst(caster, spell, target);

  if(burst > 1.0) then
		spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
	end

	dmg = math.floor(dmg * burst);
	local mab = 0;

	if(spell:getID() >= 245 and spell:getID() <= 248) then
		mab = 1
	elseif (bonusmab ~= nil) then
		mab = (100 + caster:getMod(MOD_MATT) + bonusmab) / (100 + target:getMod(MOD_MDEF));
	else
		mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF));
	end

    if(mab < 0) then
        mab = 0;
    end

	dmg = math.floor(dmg * mab);

	if (caster:hasStatusEffect(EFFECT_EBULLIENCE)) then
		local equippedHead = caster:getEquipID(SLOT_HEAD);
		if(equippedHead == 11183) then
			dmg = dmg * 1.25; --savant's bonnet +1
		elseif(equippedHead == 11083) then
			dmg = dmg * 1.3; --savant's bonnet +2
		else
			dmg = dmg * 1.2;
		end
		caster:delStatusEffectSilent(EFFECT_EBULLIENCE);
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

	local affinityBonus = AffinityBonus(caster, ele);
	dmg = math.floor(dmg * affinityBonus);

	local speciesReduction = target:getMod(defenseMod[ele]);
	speciesReduction = 1.00 - (speciesReduction/1000);
	dmg = math.floor(dmg * speciesReduction);

	local dayWeatherBonus = 1.00;
	local equippedMain = caster:getEquipID(SLOT_MAIN);
	local equippedWaist = caster:getEquipID(SLOT_WAIST);
	local weather = caster:getWeather();

	if(weather == singleWeatherStrong[ele]) then
		-- Iridescence
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele] ) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] ) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(caster:getWeather() == singleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] ) then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif(weather == doubleWeatherStrong[ele]) then
		-- Iridescence
		if(equippedMain == 18632 or equippedMain == 18633) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele] ) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] ) then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif(weather == doubleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] ) then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	local dayElement = VanadielDayElement();
	if(dayElement == dayStrong[ele]) then
		local equippedLegs = caster:getEquipID(SLOT_LEGS);
		if(equippedLegs == 15120 or equippedLegs == 15583) then
			dayWeatherBonus = dayWeatherBonus + 0.05;
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele] ) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(dayElement == dayWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele] ) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	end

	if dayWeatherBonus > 1.35 then
		dayWeatherBonus = 1.35;
	end

	dmg = math.floor(dmg * dayWeatherBonus);

	local mab = 1;
	if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
		mab = (100 + caster:getMod(MOD_MATT) + params.bonusmab) / (100 + target:getMod(MOD_MDEF));
	elseif (params == nil or (params ~= nil and params.includemab == true)) then
		mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF));
	end

    if(mab < 0) then
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

---------------------------------------------------------------------
--    Author: ReaperX
--     Elemental Debuff Potency functions
---------------------------------------------------------------------

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
	if(casterLevel <= 39) then
		duration = 30;
	elseif(casterLevel <= 59) then
		duration = 60;
	elseif(casterLevel <= 99) then
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
	local staff = AffinityBonus(caster, spell:getElement());
	-- print("staff=" .. staff);
	local dCHR = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));
	-- print("dCHR=" .. dCHR);
	local resm = applyResistance(caster, spell, target, dCHR, SINGING_SKILL, staff);
	-- print("rsem=" .. resm);

	if(resm < 0.5) then
		-- print("resm resist");
		spell:setMsg(85);
		return EFFECT_THRENODY;
	end

	-- Remove previous Threnody
	target:delStatusEffect(EFFECT_THRENODY);

    local iBoost = caster:getMod(MOD_THRENODY_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
	local power = basePower + iBoost*5;
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
        power = power * 1.5;
    end

    if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
        duration = duration * 2;
    end

	-- Set spell message and apply status effect
	target:addStatusEffect(EFFECT_THRENODY, power, 0, duration, 0, modifier, 0);

	return EFFECT_THRENODY;
end;

function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
    -- Add new
    target:addStatusEffectEx(EFFECT_NINJUTSU_ELE_DEBUFF, 0, basePower, 0, baseDuration, 0, modifier, 0);
	return EFFECT_NINJUTSU_ELE_DEBUFF;
end;

-- Returns true if you can overwrite the effect
-- Example: canOverwrite(target, EFFECT_SLOW, 25)
function canOverwrite(target, effect, power, mod)
    mod = mod or 1;

    local statusEffect = target:getStatusEffect(effect);

    -- effect not found so overwrite
    if(statusEffect == nil) then
        return true;
    end

    -- overwrite if its weaker
    if(statusEffect:getPower()*mod > power) then
        return false;
    end

    return true;
end

function doElementalNuke(caster, spell, target, spellParams)
    local DMG = 0;
    local V = 0;
    local M = 0;
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local hasMultipleTargetReduction = spellParams.hasMultipleTargetReduction; --still unused!!!
    local resistBonus = spellParams.resistBonus;
    local mDMG = caster:getMod(MOD_MAGIC_DAMAGE);

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

    --get resist multiplier (1x if no resist)
    local diff = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistance(caster, spell, target, diff, ELEMENTAL_MAGIC_SKILL, resistBonus);

    --get the resisted damage
    DMG = DMG * resist;

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    DMG = addBonuses(caster, spell, target, DMG);

    --add in target adjustment
    local ele = spell:getElement();
    DMG = adjustForTarget(target, DMG, ele);

    --add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG);

    return DMG;
end

function doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	return doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,DIVINE_MAGIC_SKILL,MOD_MND);
end

function doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	return doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,NINJUTSU_SKILL,MOD_INT);
end

function doNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus,skill,modStat)
	--calculate raw damage
	local dmg = calculateMagicDamage(V,M,caster,spell,target,skill,modStat,hasMultipleTargetReduction);
	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(modStat)-target:getStat(modStat),skill,resistBonus);
	--get the resisted damage
	dmg = dmg*resist;
	if(skill == NINJUTSU_SKILL) then
		-- boost ninjitsu damage
		-- 5% ninjitsu damage
		local head = caster:getEquipID(SLOT_HEAD);
		if(head == 15084) then
			dmg = math.floor(dmg * 1.05);
		end

		-- boost with Futae
		if(caster:hasStatusEffect(EFFECT_FUTAE)) then
			dmg = math.floor(dmg * 1.50);
			caster:delStatusEffect(EFFECT_FUTAE);
		end
	end

	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	return dmg;
end

function doDivineBanishNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local skill = DIVINE_MAGIC_SKILL;
	local modStat = MOD_MND;

	--calculate raw damage
	local dmg = calculateMagicDamage(V,M,caster,spell,target,skill,modStat,hasMultipleTargetReduction);
	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(modStat)-target:getStat(modStat),skill,resistBonus);
	--get the resisted damage
	dmg = dmg*resist;

	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--handling afflatus misery
	dmg = handleAfflatusMisery(caster, spell, dmg);
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	return dmg;
end

function calculateDurationForLvl(duration, spellLvl, targetLvl)
	if(targetLvl < spellLvl) then
		return duration * targetLvl / spellLvl;
	end

	return duration;
end

function calculateBarspellPower(caster,enhanceSkill)
	local meritBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT);
	--printf("Barspell: Merit Bonus +%d", meritBonus);

	if (enhanceSkill == nil or enhanceSkill < 0) then
		enhanceSkill = 0;
	end

	local power = 40 + 0.2 * enhanceSkill + meritBonus;

	local equippedLegs = caster:getEquipID(SLOT_LEGS);
	if(equippedLegs == 15119) then
		power = power + 20;
	elseif(equippedLegs == 15582) then
		power = power + 22;
	elseif(equippedLegs == 10712) then
		power = power + 25;
	end

	return power;
end
