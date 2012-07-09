---------------------------------------------
--  Needleshot
--
--  Description: Fires a needle at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Unknown
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	numhits = 1;
	accmod = 2;
	dmgmod = 3;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end;