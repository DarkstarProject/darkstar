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

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_MAGIC_DEF_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60));
	return typeEffect;
end;
