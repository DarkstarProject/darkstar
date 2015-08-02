---------------------------------------------
--  Gorgon Dance
--
--  Description: Petrifies all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial?
--  Notes: Used only by Medusa. Starts using it at 25%.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PETRIFICATION;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60));

	return typeEffect;
end;
