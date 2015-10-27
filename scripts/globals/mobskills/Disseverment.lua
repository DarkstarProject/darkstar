---------------------------------------------
--  Disseverment
--
--  Description: Delivers a fivefold attack. Additional effect: Poison. Accuracy varies with TP.
--  Type: Physical (Piercing)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 5;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
	target:delHP(dmg);

	local typeEffect = EFFECT_POISON;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 18, 3, 300);

	return dmg;
end;
