-- Foreword: A lot of this is good estimating since the FFXI playerbase has not found all of info for individual moves.
--			What is known is that they roughly follow player Weaponskill calculations (pDIF, dMOD, ratio, etc) so this is what
--			this set of functions emulates.

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

MSG_SELF_HEAL = 238;
MSG_ENFEEB_IS = 242; --XXX is petrified.
MSG_ENFEEB = 243; --XXX receives the effect of petrification.
MSG_BUFF = 186;
MSG_DRAIN_HP = 187;
MSG_DRAIN_MP = 225;
MSG_DRAIN_TP = 226;
MSG_NO_EFFECT = 189;
MSG_MISS = 188;

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
	hitdamage = hitdamage * (skill:getTP()/100);
			

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

function MobMagicalMove(mob,target,skill,dmg,accmod,dmgmod,tpeffect,tpvalue)
	returninfo = {};
	resist = 1;
	--get all the stuff we need
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
	if(damage<1)then
		damage = 1;
	end
	
	if(tpeffect==TP_DMG_BONUS) then
		damage = damage * ((skill:getTP()*tpvalue)/100);
	end
	
	base = damage * mab * dmgmod;
	
	acc = (macc*accmod) - meva;
	if(lvluser > lvltarget) then
		--bonus to acc
		acc = acc + 10*(lvluser-lvltarget);
	end
	if(lvltarget > lvluser) then
		--acc penalty
		acc = acc - 5*(lvltarget-lvluser);
	end
	
	--cap acc
	if(acc>95) then
		acc = 95;
	end
	if(acc<5) then
		acc = 5;
	end
	acc = acc/100; --between 0-1
	
	--account for resistances
	--TODO: acc = acc + (1 - (elementalres/100))
	
	--thresholds
	half = 0.4; --(1-acc);
	quart = 0.2; --((1-acc)^2);
	eighth = 0.095; --((1-acc)^3);
	sixteenth = 0.0325; --((1-acc)^4);
	resvar = math.random();
	--random resists atm!	

	--will this spell resist?
	if (resvar <= sixteenth) then
		resist = 0.0625;
	elseif (resvar <= eighth) then
		resist = 0.125;
	elseif (resvar <= quart) then
		resist = 0.25;
	elseif (resvar <= half) then
		resist = 0.5;
	elseif (resvar <= acc) then
		resist = 1.0;
	end
	
	finaldmg = base * resist;
	returninfo.dmg = finaldmg;
	return returninfo;
	
end

--mob version
--isEnfeeble = true if enfeeble
--effect = EFFECT_WHATEVER if enfeeble
--statmod = the stat to account for resist (INT,MND,etc) e.g. MOD_INT
--This determines how much the monsters ability resists on the player.
-- >= 0.5 means it lands, < 0.5 means it doesnt.
function applyPlayerResistance(mob,skill,target,isEnfeeble,effect,statmod)
	resist = 1.0;
	
	return resist;
	
end;

function MobFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)
	--TODO: Handle shadows depending on shadow behaviour / skilltype
	--TODO: Handle anything else (e.g. if you have Magic Shield and its a Magic skill, then do 0 damage.
	
	--handling phalanx
	dmg = dmg - target:getMod(MOD_PHALANX);
	if(dmg<0) then
		dmg = 0;
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
end