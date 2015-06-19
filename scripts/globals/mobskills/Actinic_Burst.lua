---------------------------------------------
--  Actinic Burst
--
--  Description: Greatly lowers the accuracy of enemies within range for a brief period of time.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ACCURACY_DOWN;
	local power = 50;

	local duration = 30;

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

	return typeEffect;
end;
