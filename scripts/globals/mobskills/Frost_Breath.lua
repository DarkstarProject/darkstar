---------------------------------------------
--  Frost Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis.
--  Type: Magical (Ice)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	-- only used in Uleguerand_Range
	if(mob:getZone() == 5) then
		return 0;
	end
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
		local statmod = MOD_MND;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,0,90);--power=25;tic=0;duration=30;
		end
	end

	local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, ELE_ICE);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
