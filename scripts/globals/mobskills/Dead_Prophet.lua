---------------------------------------------------
-- Absolute Terror
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)

end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_KO;
	local power = 30;
	local duration = 1;
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));
	return typeEffect;

end