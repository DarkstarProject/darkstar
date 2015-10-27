---------------------------------------------
--  Black Cloud
--
--  Description: A cloud deals Dark damage to enemies in an area of effect. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BLINDNESS;

	MobStatusEffectMove(mob, target, typeEffect, 18, 0, 180);

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);

	target:delHP(dmg);

	return dmg;
end;
