---------------------------------------------
--  Pleiades Ray
--
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 1;
	local tic = 0;
	local duration = 120;

	local statmod = MOD_INT;
	local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,7);
	if(resist > 0.2) then
		if(target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
			target:addStatusEffect(EFFECT_PARALYSIS,40,tic,duration);
		end
		if(target:hasStatusEffect(EFFECT_BLINDNESS) == false) then
			target:addStatusEffect(EFFECT_BLINDNESS,40,tic,duration);
		end
		if(target:hasStatusEffect(EFFECT_POISON) == false) then
			target:addStatusEffect(EFFECT_POISON,power,10,duration);
		end
		if(target:hasStatusEffect(EFFECT_PLAGUE) == false) then
			target:addStatusEffect(EFFECT_PLAGUE,10,tic,duration);
		end
		if(target:hasStatusEffect(EFFECT_BIND) == false) then
			target:addStatusEffect(EFFECT_BIND,power,tic,duration);
		end
		if(target:hasStatusEffect(EFFECT_SILENCE) == false) then
			target:addStatusEffect(EFFECT_SILENCE,power,tic,duration);
		end
		if(target:hasStatusEffect(EFFECT_SLOW) == false) then
            target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(EFFECT_SLOW,40,tic,duration);
		end
	end

	local dmgmod = math.random(2,3);
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
