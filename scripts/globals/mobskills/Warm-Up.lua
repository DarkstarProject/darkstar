---------------------------------------------
--  Warm-Up
--
--  Description: Enhances accuracy and evasion.
--  Type: Magical (Earth)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    MobBuffMove(mob, EFFECT_MAGIC_SHIELD, 1, 0, 30);
    skill:setMsg(0);

	return 0;
end;
