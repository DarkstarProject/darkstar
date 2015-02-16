---------------------------------------------
--  Transmogrification
--
--  Absorbs all Physical hits for a period of time.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local power = 100;
	local duration = 180;
	local typeEffect = MOD_ABSORB_DMG_CHANCE;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));

	return typeEffect;
end;
