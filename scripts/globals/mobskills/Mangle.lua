---------------------------------------------
--  Mangle
--
--  Description: Deals damage in a threefold attack to targets in a fan-shaped area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Front cone
--  Notes: Used only when wielding their initial sword, or the dagger on their backs.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local numhits = 3;
	local accmod = 1;
	local dmgmod = .33;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
