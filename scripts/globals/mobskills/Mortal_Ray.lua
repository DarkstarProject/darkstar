---------------------------------------------
--  Mortal Ray
--
--  Description: Inflicts Doom upon an enemy.
--  Type: Magical (Dark)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DOOM;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 10, 3, 30));

	return typeEffect;
end;
