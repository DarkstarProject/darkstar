---------------------------------------------
--  Quake Stomp
--
--  Description: Stomps the ground to boost next attack.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = 1;
	local duration = 60;

	local typeEffect = EFFECT_BOOST;

    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration));
	return typeEffect;
end;
