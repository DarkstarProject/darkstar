---------------------------------------------
--  Baleful Gaze
--  Description: Petrifies opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
--  Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PETRIFICATION;
	local duration = math.random(8, 15) + mob:getMainLvl()/3;

	skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));

	return typeEffect;
end;
