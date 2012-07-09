---------------------------------------------
--  Asuran Fists
--  Description: Delivers an eightfold attack. Accuracy varies with TP. 
--  Type: Physical
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    numhits = 8;
	accmod = 1;
	dmgmod = 0.2;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
	
end;