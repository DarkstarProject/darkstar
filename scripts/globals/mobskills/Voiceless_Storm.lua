---------------------------------------------
--  Voiceless Storm
--  Description: AOE Damage, Silence, strips Utsusemi (MOBPARAM_WIPE_SHADOWS)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

---------------------------------------------
-- onMobSkillCheck no animation check required
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

---------------------------------------------
-- onMobSkillCheck no animation check required
---------------------------------------------
function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_WIPE_SHADOWS);

	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 60);

	target:delHP(dmg);
	return dmg;
end;