---------------------------------------------
--  Panzerschreck
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
-- onMobSkillCheck
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

---------------------------------------------
-- onMobWeaponSkill
---------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 2.5;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);
	
	return dmg;
end;
