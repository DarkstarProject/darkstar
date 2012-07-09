---------------------------------------------
--  Fluid Toss
--
--  Description: Lobs a ball of liquid at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Unknown range
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	if(target:getStatusEffect(EFFECT_POISON) == nil) then
		target:addStatusEffect(EFFECT_POISON,5,100,20);
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end