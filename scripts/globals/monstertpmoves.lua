require("scripts/globals/magic");
require("scripts/globals/magicburst")
require("scripts/globals/status")

-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--			What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--			this set of functions emulates.

-- mob types
-- used in mob:isMobType()
MOBTYPE_NORMAL			= 0x00;
MOBTYPE_PCSPAWNED		= 0x01;
MOBTYPE_NOTORIOUS		= 0x02;
MOBTYPE_FISHED			= 0x04;
MOBTYPE_CALLED			= 0x08;
MOBTYPE_BATTLEFIELD		= 0x10;
MOBTYPE_EVENT			= 0x20;

--skilltype
MOBSKILL_PHYSICAL = 0;
MOBSKILL_MAGICAL = 1;
MOBSKILL_RANGED = 2;
MOBSKILL_SPECIAL = 3;

--skillparam (PHYSICAL)
MOBPARAM_NONE = 0;
MOBPARAM_BLUNT = 1;
MOBPARAM_SLASH = 2;
MOBPARAM_PIERCE = 3;
MOBPARAM_H2H = 4;

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
MOBPARAM_WIPE_SHADOWS = 5;

TP_ACC_VARIES = 0;
TP_ATK_VARIES = 1;
TP_DMG_VARIES = 2;
TP_CRIT_VARIES = 3;
TP_NO_EFFECT = 0;
TP_MACC_BONUS = 1;
TP_MAB_BONUS = 2;
TP_DMG_BONUS = 3;

MSG_NONE = 0; -- display nothing
MSG_SELF_HEAL = 238;
MSG_ENFEEB_IS = 242; --XXX is petrified.
MSG_ENFEEB = 243; --XXX receives the effect of petrification.
MSG_BUFF = 186;
MSG_DRAIN_HP = 187;
MSG_DRAIN_MP = 225;
MSG_DRAIN_TP = 226;
MSG_NO_EFFECT = 189;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;
MSG_EFFECT_DRAINED = 370; -- <num> status effects are drained from <target>.
MSG_TP_REDUCED = 362; -- tp reduced to
MSG_DISAPPEAR = 378; -- <target>'s stun effect disappears!
MSG_DISAPPEAR_NUM = 400; -- <num> of <target>'s effects disappear!

BOMB_TOSS_HPP = 1;

-- PHYSICAL MOVE FUNCTION
-- Call this on every physical move!
-- accmod is a linear multiplier for accuracy (1 default)
-- dmgmod is a linear mulitplier for damage (1 default)
-- tpeffect is an enum which can be one of:
-- 0 TP_ACC_VARIES
-- 1 TP_ATK_VARIES
-- 2 TP_DMG_VARIES
-- 3 TP_CRIT_VARIES
-- mtp100/200/300 are the three values for 100% TP, 200% TP, 300% TP just like weaponskills.lua
-- if TP_ACC_VARIES -> three values are acc %s (1.0 is 100% acc, 0.8 is 80% acc, 1.2 is 120% acc)
-- if TP_ATK_VARIES -> three values are attack multiplier (1.5x 0.5x etc)
-- if TP_DMG_VARIES -> three values are

function MobPhysicalMove(mob,target,skill,numberofhits,accmod,dmgmod,tpeffect,mtp100,mtp200,mtp300)
	returninfo = {};

	--get dstr (bias to monsters, so no fSTR)
	dstr = mob:getStat(MOD_STR) - target:getStat(MOD_VIT);
	if(dstr < -10) then
		dstr = -10;
	end
	lvluser = mob:getMainLvl();
	lvltarget = target:getMainLvl();
	acc = mob:getMod(MOD_ACC);
	eva = target:getMod(MOD_EVA);
	--apply WSC
	local base = mob:getWeaponDmg() + dstr; --todo: change to include WSC
	if(base < 1) then
		base = 1;
	end

	--work out and cap ratio
	ratio = mob:getStat(MOD_ATT)/target:getStat(MOD_DEF);
	if (ratio>5) then
		ratio = 5;
	end
	if (ratio < 0) then
		ratio = 0;
	end

	lvldiff = lvluser - lvltarget;

	--work out hit rate for mobs (bias towards them)
	hitrate = (acc*accmod) - eva;
	if (lvluser > lvltarget) then
		hitrate = hitrate + ((lvluser-lvltarget)*5);
	end
	if (lvltarget > lvluser) then
		hitrate = hitrate + ((lvltarget-lvluser)*3);
	end
	if (hitrate > 95) then
		hitrate = 95;
	end
	if (hitrate < 20) then
		hitrate = 20;
	end

	--work out the base damage for a single hit
	hitdamage = (base + lvldiff);
	if(hitdamage < 1) then
		hitdamage = 1;
	end
	hitdamage = hitdamage * dmgmod;

	--work out min and max cRatio
	if(ratio<1) then
		maxRatio = 1.5 * ratio;
		minRatio = ratio + 0.1 ;
	end
	if(ratio>1) then
		maxRatio = 1.5 * ratio;
		minRatio = ratio ;
	end
	--apply ftp (assumes 1~3 scalar linear mod)
	if(tpeffect==TP_DMG_BONUS) then
		hitdamage = hitdamage * fTP(skill:getTP(), mtp100, mtp200, mtp300);
	end

	--Applying pDIF
	local double pdif = 0;


	-- start the hits
	local double hitchance = math.random();
	finaldmg = 0;
	hitsdone = 1; hitslanded = 0;

	--first hit is 95%
	local double chance = math.random();
	if ((chance*100)<=95) then
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

	-- Apply MOD_DMG first, and separately.  For proof of order, see: http://wiki.ffxiclopedia.org/wiki/Sentinel
	finaldmg = finaldmg * (1 + (target:getMod(MOD_DMG) / 100));
	finaldmg = finaldmg * (1 + (target:getMod(MOD_DMGPHYS) / 100));

	-- if an attack landed it must do at least 1 damage
	if(hitslanded >= 1 and finaldmg < 1) then
		finaldmg = 1;
	end

	-- all hits missed
	if(hitslanded == 0 or finaldmg == 0) then
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
-- mob/target/skill should be passed from OnMobWeaponSkill.
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

function MobMagicalMove(mob,target,skill,dmg,element,dmgmod,tpeffect,tpvalue)
	returninfo = {};
	--get all the stuff we need
	resist = 1;
	dint = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
	mab = (100+mob:getMod(MOD_MATT)) / (100+target:getMod(MOD_MDEF)) ;
	macc = mob:getMod(MOD_MACC);
	meva = target:getMod(MOD_MEVA);
	lvluser = mob:getMainLvl();
	lvltarget = target:getMainLvl();

	if(dint < -10) then
		dint = -10;
	end

	damage = dmg + dint;
	if(damage<1) then
		damage = 1;
	end

	if(tpeffect==TP_DMG_BONUS) then
		damage = damage * ((skill:getTP()*tpvalue)/100);
	end

	-- resistence is added last
	finaldmg = damage * mab * dmgmod;

	-- get resistence, give small boost to mobs
	resist = applyPlayerResistance(mob,skill,target,mob:getMod(MOD_INT)-target:getMod(MOD_INT),0,element);

	finaldmg = finaldmg * resist;

	if(finaldmg < 1) then
		finaldmg = 1;
	end

	-- Apply MOD_DMG first, and separately.  For proof of order, see: http://wiki.ffxiclopedia.org/wiki/Sentinel
	finaldmg = finaldmg * (1 + (target:getMod(MOD_DMG) / 100));
	finaldmg = finaldmg * (1 + (target:getMod(MOD_DMGMAGIC) / 100));

	returninfo.dmg = finaldmg;
	return returninfo;

end

--mob version
--isEnfeeble = true if enfeeble
--effect = EFFECT_WHATEVER if enfeeble
--statmod = the stat to account for resist (INT,MND,etc) e.g. MOD_INT
--This determines how much the monsters ability resists on the player.
--TODO: update all mob moves to use the new function
function applyPlayerResistance(mob,spell,target,diff,skill,element)
    resist = 1.0;
    magicaccbonus = 0;
	--get the base acc (just skill plus magic acc mod)
	magicacc = getSkillLvl(1, mob:getMainLvl());

	--difference in int/mnd
	if diff > 10 then
		magicacc = magicacc + 10 + (diff - 10)/2;
	else
		magicacc = magicacc + diff;
	end
	--add acc for ele/dark seal
    if(mob:hasStatusEffect(EFFECT_ELEMENTAL_SEAL) == true and skill ~= 0) then
        magicaccbonus = magicaccbonus + 256;
    elseif(mob:hasStatusEffect(EFFECT_DARK_SEAL) == true and skill == DARK_MAGIC_SKILL) then
        magicaccbonus = magicaccbonus + 256;
    end

    local skillchainTier, skillchainCount = MobFormMagicBurst(element, target);
    --add acc for skillchains
    if(skillchainTier > 0) then
		magicaccbonus = magicaccbonus + 25;
    end

	--base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
	magiceva = (target:getMod(MOD_MEVA) + target:getMod(resistMod[element]) + target:getMod(defenseMod[element]))/10;

	--get the difference of acc and eva, scale with level (3.33 at 10 to 0.44 at 75)
	multiplier = 0;
	if mob:getMainLvl() < 40 then
		multiplier = 100 / 120;
	else
		multiplier = 100 / (mob:getMainLvl() * 3);
	end;
	p = (magicacc * multiplier) - (magiceva * 0.45);
	magicaccbonus = magicaccbonus / 2;
	--add magicacc bonus
	p = p + magicaccbonus;
	-- print(magicacc);
	-- print(magiceva);
	-- print(magicaccbonus);


	--double any acc over 50 if it's over 50
	if p > 5 then
		p = 5 + (p - 5) * 2;
	end

	--add a flat bonus that won't get doubled in the previous step
	p = p + 45;

	--add a scaling bonus or penalty based on difference of targets level from caster
	leveldiff = mob:getMainLvl() - target:getMainLvl();
	if leveldiff < 0 then
		p = p - (25 * ( (mob:getMainLvl()) / 75 )) + leveldiff;
	else
		p = p + (25 * ( (mob:getMainLvl()) / 75 )) + leveldiff;
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
    quart = ((1 - p)^2);
    eighth = ((1 - p)^3);
    sixteenth = ((1 - p)^4);
    -- print("HALF:",half);
    -- print("QUART:",quart);
    -- print("EIGHTH:",eighth);
    -- print("SIXTEENTH:",sixteenth);

    resvar = math.random();

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

function mobAddBonuses(caster, spell, target, dmg, ele)

	speciesReduction = target:getMod(defenseMod[ele]);
	speciesReduction = 1.00 - (speciesReduction/1000);
	dmg = math.floor(dmg * speciesReduction);

	dayWeatherBonus = 1.00;

	if caster:getWeather() == singleWeatherStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif caster:getWeather() == singleWeatherWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus - 0.10;
		end
	elseif caster:getWeather() == doubleWeatherStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.25;
		end
	elseif caster:getWeather() == doubleWeatherWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus - 0.25;
		end
	end

	if VanadielDayElement() == dayStrong[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObi[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	elseif VanadielDayElement() == dayWeak[ele] then
		if math.random() < 0.33 or caster:getEquipID(SLOT_WAIST) == elementalObiWeak[ele] then
			dayWeatherBonus = dayWeatherBonus + 0.10;
		end
	end

	if dayWeatherBonus > 1.35 then
		dayWeatherBonus = 1.35;
	end

	dmg = math.floor(dmg * dayWeatherBonus);

    burst, burstBonus = calculateMobMagicBurstAndBonus(caster, ele, target);

	-- not sure what to do for this yet
    -- if(burst > 1.0) then
		-- spell:setMsg(spell:getMagicBurstMessage()); -- "Magic Burst!"
	-- end

	dmg = math.floor(dmg * burst);

    mab = (100 + caster:getMod(MOD_MATT)) / (100 + target:getMod(MOD_MDEF)) ;

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

function calculateMobMagicBurstAndBonus(caster, ele, target)

    local burst = 1.0;

    local skillchainTier, skillchainCount = MobFormMagicBurst(ele, target);

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
    end

    return burst, burstBonus;
end;

-- Calculates breath damage
-- mob is a mob reference to get hp and lvl
-- percent is the percentage to take from HP
-- base is calculated from main level to create a minimum
-- Equation: (HP * percent) + (LVL / base)
-- cap is optional, defines a maxiumum damage
function MobBreathMove(mob, target, percent, base, element, cap)
	damage = (mob:getHP() * percent) + (mob:getMainLvl() / base);

	if(cap == nil) then
		-- super cap for high damage mobs
		if(damage > 1000) then
			damage = 700 + math.random(500);
		end

		-- cap max damage
		if(damage > mob:getHP()/5) then
			damage = math.floor(mob:getHP()/5);
		end
	else
		if(damage > cap) then
			damage = cap;
		end
	end

	-- elemental resistence
	if(element ~= nil) then
		-- no skill available, pass nil
		local resist = applyPlayerResistance(mob,nil,target,mob:getMod(MOD_INT)-target:getMod(MOD_INT),0,element);
		damage = damage * resist;
	end

	-- add breath resistence and magic resistence
	local dmgMod = target:getMod(MOD_DMG) / 100;
	local dmgBreath = target:getMod(MOD_DMGBREATH) / 100;
	local dmgMagic = target:getMod(MOD_DMGMAGIC) / 100;

	-- cap breath reduction at 50%
	if(dmgBreath > 0.5) then
		dmgBreath = 0.5;
	end
	if(dmgMod > 0.5) then
		dmgMod = 0.5;
	end

	if(dmgMagic > 0.5) then
		dmgMagic = 0.5;
	end

	damage = damage * (1 + dmgMod);
	damage = damage * (1 + dmgBreath);
	damage = damage * (1 + dmgMagic);

	return damage;
end;

function MobFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)

	-- physical attack missed, skip rest
	if(skilltype == MOBSKILL_PHYSICAL and dmg == 0) then
		return 0;
	end

	--Handle shadows depending on shadow behaviour / skilltype
	if(shadowbehav < 5 and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.
		targShadows = target:getMod(MOD_UTSUSEMI);
		shadowType = MOD_UTSUSEMI;
		if(targShadows==0)then --try blink, as utsusemi always overwrites blink this is okay
			targShadows = target:getMod(MOD_BLINK);
			shadowType = MOD_BLINK;
		end

		if(targShadows>0)then
		--Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!
			if(targShadows >= shadowbehav) then --no damage, just suck the shadows
				skill:setMsg(31);
				target:setMod(shadowType,(targShadows-shadowbehav));
				if(shadowType == MOD_UTSUSEMI) then --update icon
					effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
					if(effect ~= nil) then
						if((targShadows-shadowbehav) == 0) then
							target:delStatusEffect(EFFECT_COPY_IMAGE);
							target:delStatusEffect(EFFECT_BLINK);
						elseif((targShadows-shadowbehav) == 1) then
							effect:setIcon(EFFECT_COPY_IMAGE);
						elseif((targShadows-shadowbehav) == 2) then
							effect:setIcon(EFFECT_COPY_IMAGE_2);
						elseif((targShadows-shadowbehav) == 3) then
							effect:setIcon(EFFECT_COPY_IMAGE_3);
						end
					end
				end
				return shadowbehav;
			else --less shadows than this move will take, remove all and factor damage down
				dmg = dmg * ((shadowbehav-targShadows)/shadowbehav);
				target:setMod(MOD_UTSUSEMI,0);
				target:setMod(MOD_BLINK,0);
				target:delStatusEffect(EFFECT_COPY_IMAGE);
				target:delStatusEffect(EFFECT_BLINK);
			end
		end
	elseif(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
		target:setMod(MOD_UTSUSEMI,0);
		target:setMod(MOD_BLINK,0);
		target:delStatusEffect(EFFECT_COPY_IMAGE);
		target:delStatusEffect(EFFECT_BLINK);
	end

	--handle Third Eye using shadowbehav as a guide
	teye = target:getStatusEffect(EFFECT_THIRD_EYE);
	if(teye ~= nil and skilltype==MOBSKILL_PHYSICAL) then --T.Eye only procs when active with PHYSICAL stuff
		if(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --e.g. aoe moves
			target:delStatusEffect(EFFECT_THIRD_EYE);
		elseif(shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --it can be absorbed by shadows
			--third eye doesnt care how many shadows, so attempt to anticipate, but reduce
			--chance of anticipate based on previous successful anticipates.
			prevAnt = teye:getPower();
			if(prevAnt == 0) then
				--100% proc
				teye:setPower(1);
				skill:setMsg(30);
				return 0;
			end
			if( (math.random()*100) < (80-(prevAnt*10)) ) then
				--anticipated!
				teye:setPower(prevAnt+1);
				skill:setMsg(30);
				return 0;
			end
			target:delStatusEffect(EFFECT_THIRD_EYE);
		end
	end


	if(skilltype == MOBSKILL_PHYSICAL and target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD)) then
		return 0;
	end

	if(skilltype == MOBSKILL_RANGED and target:hasStatusEffect(EFFECT_ARROW_SHIELD)) then
		return 0;
	end

	-- handle elemental resistence
	if(skilltype == MOBSKILL_MAGICAL and target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
		return 0;
	end


	--handling phalanx
	dmg = dmg - target:getMod(MOD_PHALANX);
	if(dmg<0) then
		return 0;
	end

	--handle invincible
	if(target:hasStatusEffect(EFFECT_INVINCIBLE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end
	--handle pd
	if(target:hasStatusEffect(EFFECT_PERFECT_DODGE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end

	--handling stoneskin
	skin = target:getMod(MOD_STONESKIN);
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

	return dmg;
end;

-- returns true if mob attack hit
-- used to stop tp move status effects
function MobPhysicalHit(skill, dmg, target, hits)
	-- if message is not the default. Then there was a miss, shadow taken etc
	if(skill:getMsg() ~= MSG_DAMAGE) then
		return false;
	end

	return true;
end;

function fTP(tp,ftp1,ftp2,ftp3)
	if(tp<100) then
		tp=100;
	end
	if(tp>=100 and tp<200) then
		return ftp1 + ( ((ftp2-ftp1)/100) * (tp-100));
	elseif(tp>=200 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-200));
	end
	return 1; --no ftp mod
end;
