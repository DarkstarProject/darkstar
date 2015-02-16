---------------------------------------------
--  Ravenous_Cracklaw_Riptide_Eupnea
--

---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local numhits = 2;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_WIPE_SHADOWS,info.hitslanded);
	target:delHP(dmg);
	local typeEffect = EFFECT_WEAKNESS;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30);
	return dmg;
end;
