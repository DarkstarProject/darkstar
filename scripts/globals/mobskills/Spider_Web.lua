---------------------------------------------------
-- Spider Web
-- Entangles all targets in an area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	local power = 300;

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 90));

	return typeEffect;
end;
