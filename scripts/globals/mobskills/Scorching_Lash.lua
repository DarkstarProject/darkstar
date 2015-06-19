---------------------------------------------
--  Scorching Lash
--
--  Description: Deals heavy damage to targets behind user.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Back
--  Notes: Used only if a target with hate is behind them. Conal behind Cerberus.
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
	local dmgmod = 1.3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
