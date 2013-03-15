require("scripts/globals/magicburst")
require("scripts/globals/status")
require("scripts/globals/weather")

    MMSG_BUFF_FAIL = 75;

	DIVINE_MAGIC_SKILL	 	= 32;
    HEALING_MAGIC_SKILL 	= 33;
	ENHANCING_MAGIC_SKILL 	= 34;
	ENFEEBLING_MAGIC_SKILL 	= 35;
	ELEMENTAL_MAGIC_SKILL 	= 36;
    DARK_MAGIC_SKILL 		= 37;
    NINJUTSU_SKILL          = 39;
    SUMMENING_SKILL 	    = 38;
    SINGING_SKILL           = 40;
    STRING_SKILL            = 41;
    WIND_SKILL              = 42;
    BLUE_SKILL			    = 43;

	FIRESDAY		= 0;
	EARTHSDAY		= 1;
	WATERSDAY		= 2;
	WINDSDAY		= 3;
	ICEDAY			= 4;
	LIGHTNINGDAY	= 5;
	LIGHTSDAY		= 6;
	DARKSDAY		= 7;

    ELE_FIRE        = 1;
    ELE_EARTH       = 2;
    ELE_WATER       = 3;
    ELE_WIND        = 4;
    ELE_ICE          = 5;
    ELE_LIGHTNING    = 6;
    -- added both because monsterstpmoves calls it thunder
    ELE_THUNDER = 6;
    ELE_LIGHT       = 7;
    ELE_DARK        = 8;

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
    local magicskill = target:getSkillLevel(ENHANCING_MAGIC_SKILL) + target:getMod(79 + ENHANCING_MAGIC_SKILL);

    local potency = 3 + ((6*magicskill)/100);
    if(magicskill>200) then
        potency = 5 + ((5*magicskill)/100);
    end

    -- enhancing sword
    if(target:getEquipID(SLOT_MAIN) == 16605) then
        potency = potency + 5;
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


function AffinityBonus(caster,spell)

	local bonus = 1.00;

    local ele = spell:getElement();

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

function applyResistance(player,spell,target,diff,skill,staff)
    -- resist everything if magic shield is active
    if(target:hasStatusEffect(EFFECT_MAGIC_SHIELD, 0)) then
        return 0;
    end

    local resist = 1.0;
    local magicaccbonus = 0;
	--get the base acc (just skill plus magic acc mod)
	local magicacc = player:getSkillLevel(skill) + player:getMod(79 + skill) + player:getMod(MOD_MACC);

	--difference in int/mnd
	if(diff > 10) then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end
	--add acc for ele/dark seal
    if(player:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil) then
        magicaccbonus = magicaccbonus + 256;
    elseif(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
        magicaccbonus = magicaccbonus + 256;
    end
	--add acc for staves
	local affinityBonus = AffinityBonus(player, spell);
	magicaccbonus = magicaccbonus + (affinityBonus-1) * 200;

    local skillchainTier, skillchainCount = FormMagicBurst(spell, target);
    --add acc for skillchains
    if(skillchainTier > 0) then
		magicaccbonus = magicaccbonus + 25;
    end

	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	local magiceva = target:getMod(MOD_MEVA) + target:getMod(resistMod[spell:getElement()]);

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

 function finalMagicAdjustments(caster,target,spell,dmg)
    if(dmg<0) then
        dmg = 1;
    end

    -- handle multiple targets
    if(spell:isAoE()) then
        local total = spell:getTotalTargets();

        if(total > 9) then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4;
        elseif(total > 1) then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total);
        end

    end

    dmg = dmg - target:getMod(MOD_PHALANX);
    if(dmg<0) then
        dmg = 0;
    end

    -- handle magic shield
    if(target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
        dmg = 0;
    end

    --handling stoneskin
    local skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= dmg) then --absorb all damage
            target:delMod(MOD_STONESKIN,dmg);
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
            return 0;
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
            return dmg - skin;
        end
    end

    target:delHP(dmg);
    target:updateEnmityFromDamage(caster,dmg);
    -- Only add TP if the target is a mob
    if (target:getObjType() ~= TYPE_PC) then
        target:addTP(10);
    end
    return dmg;
 end;

function adjustForTarget(target,dmg)
    --e.g. family % reduction
    return dmg;
end;

function calculateMagicBurstAndBonus(caster, spell, target)
    local equippedHands = caster:getEquipID(SLOT_HANDS);
    local equippedEar1  = caster:getEquipID(SLOT_EAR1);
    local equippedEar2  = caster:getEquipID(SLOT_EAR2);

    local burst = 1.0;
    local burstBonus = 1.0;

    local skillchainTier, skillchainCount = FormMagicBurst(spell, target);

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

		-- Get burst bonus from gear/spell bonus

        -- Sorcerer's Gloves
        if(equippedHands == 15105 or equippedHands == 14912) then
            burstBonus = burstBonus + 0.05;
        end

        if(equippedEar1 == 15962 or equippedEar2 == 15962) then
            burstBonus = burstBonus + 0.05;
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

    return burst, burstBonus;
end;

function addBonuses(caster, spell, target, dmg)
	local ele = spell:getElement();

	local affinityBonus = AffinityBonus(caster, spell);
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
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(caster:getWeather() == singleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele]) then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif(weather == doubleWeatherStrong[ele]) then
		-- Iridescence
		if(equippedMain == 18632 or equippedMain == 186330) then
			if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
				dayWeatherBonus = dayWeatherBonus + 0.10;
			end
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif(weather == doubleWeatherWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele]) then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	local dayElement = VanadielDayElement();
	if(dayElement == dayStrong[ele]) then
		local equippedLegs = caster:getEquipID(SLOT_LEGS);
		if(equippedLegs == 15120 or equippedLegs == 15583) then
			dayWeatherBonus = dayWeatherBonus + 0.05;
		end
		if(math.random() < 0.33 or equippedWaist == elementalObi[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif(dayElement == dayWeak[ele]) then
		if(math.random() < 0.33 or equippedWaist == elementalObiWeak[ele]) then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	end

	if dayWeatherBonus > 1.35 then
		dayWeatherBonus = 1.35;
	end

	dmg = math.floor(dmg * dayWeatherBonus);

    local burst, burstBonus = calculateMagicBurstAndBonus(caster, spell, target);

    if(burst > 1.0) then
		spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
	end

	dmg = math.floor(dmg * burst);

    local mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF));

    if(mab < 0) then
        mab = 0;
    end

	dmg = math.floor(dmg * mab);

	-- Applies "Damage Taken" and "Magic Damage Taken" mods.
	-- The formulas look crazy because SE.
	-- Note that MOD_DMGMAGIC is stored in item_mods in amount/256 format

	local dmgTaken = target:getMod(MOD_DMG);
	local dmgMod = 1;
	if (dmgTaken > 0) then
		dmgMod = dmgMod+(math.floor((dmgTaken/100)*256)/256);
	else
		dmgMod = dmgMod+(math.ceil((dmgTaken/100)*256)/256);
	end
	local magicDmgMod = (256 + target:getMod(MOD_DMGMAGIC)) / 256;

	dmg = math.floor(dmg * dmgMod);
	dmg = math.floor(dmg * magicDmgMod);

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

function getHelixDuration(caster, target, spell)
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

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
	-- Process resitances
	local staff = AffinityBonus(caster, spell);
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

	-- TODO: Check equipment bounses, increase duration/power
	local power = basePower;
	local duration = baseDuration;

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
