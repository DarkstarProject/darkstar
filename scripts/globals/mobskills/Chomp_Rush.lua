---------------------------------------------
--  Chomp Rush
--
--  Description: Deals damage in a threefold attack to a single target. Additional effect: slow (25%)
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 3;
	local accmod = 1;
	local dmgmod = 1.1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);

	local typeEffect = EFFECT_SLOW;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 128, 0, 60);

	return dmg;
end;
