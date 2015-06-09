---------------------------------------------------
-- Aerial Wheel
-- Deals a ranged attack to a single target. Additional effect: stun
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
	local accmod = 0.8;
	local dmgmod = 2.3;
	local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

	local typeEffect = EFFECT_STUN;
	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4);

	target:delHP(dmg);
	return dmg;
end;
