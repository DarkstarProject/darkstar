---------------------------------------------
--  Grim Glower
--
--  Description: Stares with glowing eyes that petrifies any target that makes eye contact.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Line of sight
--  Notes: The peiste eyes will be brightly glowing while this is in effect.
--  Anyone facing it will be petrified until it ends or it turns away.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_PETRIFICATION;
	local duration = 45;

	skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));

	return typeEffect
end;
