---------------------------------------------
--  Wing Whirl
--
--  Description: Strikes all targets within an area of effect with its wings.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows?
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local numhits = math.random(2,3);
	local accmod = 1;
	local dmgmod = 1.3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
