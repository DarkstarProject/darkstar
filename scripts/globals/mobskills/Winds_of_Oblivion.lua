---------------------------------------------
--  Winds of Oblivion
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    mob:showText(mob, PROMATHIA_TEXT + 6);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_AMNESIA;
	local power = 30;
	local duration = 75;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

	return typeEffect;
end;
