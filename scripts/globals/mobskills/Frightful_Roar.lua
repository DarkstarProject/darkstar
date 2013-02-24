---------------------------------------------
--  Frightful Roar
--
--  Description: Weakens defense of enemies within range.
--  Type: Magical (Wind)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_DEFENSE_DOWN;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 0, 180));
	return typeEffect;
end;
