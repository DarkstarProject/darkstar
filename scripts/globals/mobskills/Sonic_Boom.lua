---------------------------------------------------
-- Sonic Boom
-- Reduces attack of targets in area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ATTACK_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 120));

	return typeEffect;
end;
