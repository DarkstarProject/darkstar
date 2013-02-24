---------------------------------------------------
-- Cold Stare
-- Silences enemies in a line area of effect.
-- Notes: Only applies when face-to-face with the dhalmel.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;
	skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 60));
	return typeEffect;
end;
