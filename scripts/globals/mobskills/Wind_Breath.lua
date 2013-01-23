---------------------------------------------
--  Wind Breath
--
--  Description: Deals Wind breath damage to enemies within a fan-shaped area originating from the caster.
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

    local dmgmod = MobBreathMove(mob, target, 0.3, 0.75);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
