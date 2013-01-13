---------------------------------------------
--  Acrid Stream
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Lowers target's Magic Defense.
--  Type: Magical (Water)
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
	local typeEffect = EFFECT_MAGIC_DEF_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.5) then
			target:addStatusEffect(typeEffect,20,0,60);--power=20;tic=0;duration=60;
		end
	end

	local dmgmod = 1.5;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
