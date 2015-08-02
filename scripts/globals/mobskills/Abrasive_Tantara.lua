---------------------------------------------
--  Abrasive Tantara
--
--  Description: Inflicts amnesia in an area of effect
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' as well as single target outside of 10'
--  Notes: Doesn't use this if its horn is broken.  It is possible for Abrasive Tantara to miss. - See discussion
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local message = MSG_MISS;
	local typeEffect = EFFECT_AMNESIA;
	local power = 1;
	local duration = 60;

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
	return typeEffect;
end;
