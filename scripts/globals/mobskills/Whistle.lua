---------------------------------------------
--  Whistle
--
--  Description: Increases agility.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: When used by the Nightmare Dhalmel in Dynamis - Buburimu, it grants an Evasion Boost instead.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local power = mob:getMainLvl()/10 * 3.75 + 5;
	local duration = 60;

	local typeEffect = EFFECT_AGI_BOOST;

    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration));
	return typeEffect;
end;
