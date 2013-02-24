---------------------------------------------------
-- Sonic Wave
-- Reduces defense of enemies in an area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 120));

	return typeEffect;
end;
