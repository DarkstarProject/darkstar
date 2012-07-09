---------------------------------------------
-- Rhino_Attack
-- Deals damage to a single target. Additional effect: Knockback
-- Utsusemi/Blink absorb: 1 shadow 
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	-- KNOCKBACK
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end