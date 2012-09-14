---------------------------------------------
--  Concussive Oscillation
--  Smacks around all nearby targets. Additional effect: Knockback + Weight
--  Utsusemi/Blink absorb: 2-3 shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	-- KNOCKBACK
	
	isEnfeeble = true;
	typeEffect = EFFECT_WEIGHT;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_WEIGHT) == nil) then
			target:addStatusEffect(EFFECT_WEIGHT,1,0,300);
		end
	end
	
	numhits = 1;
	accmod = 4;
	dmgmod = 5;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end;