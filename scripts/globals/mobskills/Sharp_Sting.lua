---------------------------------------------
--  Sharp Sting
--
--  Description: Deals high damage to target in a ranged attack.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: 10' single
--  Notes: Appears to be very inaccurate.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 3;
	local dmgmod = 4;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
end;
