---------------------------------------------------
-- Slam Dunk
-- Deals damage to a single target. Additional effect: bind
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.4;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,info.hitslanded);

	local typeEffect = EFFECT_BIND;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 20);

	target:delHP(dmg);
	return dmg;
end;
