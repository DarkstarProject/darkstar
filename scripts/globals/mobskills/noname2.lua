---------------------------------------------
--  cosmic elucidation
--
--  Description: Blasts a single target with light energy. Additional effect: flash
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Blinds target
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_FLASH;
	local power = 15;
	local duration = 120;

	MobStatusEffectMove(mob, target, typeEffect, power, 0, duration);

	local dmgmod = 5;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_LIGHT,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
