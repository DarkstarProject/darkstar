---------------------------------------------------
-- Hi-Freq Field
-- Lowers the evasion of enemies in a fan-shaped area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_EVASION_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 120));

	return typeEffect;
end;
