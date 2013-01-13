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
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,25,0,30);--power=25;tic=0;duration=30;
		end
	end

	local dmgmod = mob:getHP() / mob:getMaxHP() * 2;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
