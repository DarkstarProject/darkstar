---------------------------------------------
--  Radiant Breath
--
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
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
	local typeEffect = EFFECT_SLOW;

    MobStatusEffectMove(mob, target, typeEffect, 200, 0, 120);
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60);

	local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_LIGHT, 700);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;
