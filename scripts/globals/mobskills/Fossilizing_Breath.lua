---------------------------------------------
--  Fossilizaing Breath
--
--  Description: Petrifies targets within a fan-shaped area.
--  Type: Breath
--  Ignores Shadows
--  Range: Unknown cone
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
	local power = 1;

	local duration = 60;

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

	return typeEffect;
end;
