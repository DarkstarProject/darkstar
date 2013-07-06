---------------------------------------------
--  1000 Needles
--
--  Description: Shoots multiple needles at enemies within range.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local needles = 10000 / skill:getTotalTargets();

	local dmg = MobFinalAdjustments(needles,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);

	target:delHP(dmg);

	return dmg;
end;
