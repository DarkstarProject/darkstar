---------------------------------------------
--  Decussate
--
--  Description: Performs a cross attack on nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: 2-3 shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja when below 35% health.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_2_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
