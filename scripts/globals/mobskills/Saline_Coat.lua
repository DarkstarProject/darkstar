---------------------------------------------
--  Saline Coat
--
--  Description: Enhances magic defense.
--  Type: Magical (Light)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_MAGIC_DEF_BOOST;
    skill:setMsg(MobBuffMove(target, typeEffect, 50, 0, 60));
	return typeEffect;
end;
