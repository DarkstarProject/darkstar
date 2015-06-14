---------------------------------------------
--  Ink Cloud
--
--  Description: Blinds nearby targets with ink.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
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
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 15, 0, 120));

	return typeEffect;
end;
