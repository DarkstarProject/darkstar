---------------------------------------------
--  Eternal Damnation
--  Description: Dooms opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DOOM;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 30, 3, 30));

	return typeEffect;
end;
