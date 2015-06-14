---------------------------------------------
--  Tidal Dive
--
--  Description: Dives at nearby targets. Additional effect: Weight and/or Bind (Status Effect)
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Only used over deep water.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BIND;

	local numhits = math.random(2, 3);
	local accmod = 1;
	local dmgmod = .8;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30);

	typeEffect = EFFECT_WEIGHT;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 60);

	target:delHP(dmg);
	return dmg;
end;
