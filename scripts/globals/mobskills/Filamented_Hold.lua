---------------------------------------------------
-- Filamented Hold
-- Reduces the attack speed of enemies within a fan-shaped area originating from the caster.
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

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 256, 0, 120));

	return typeEffect;
end;
