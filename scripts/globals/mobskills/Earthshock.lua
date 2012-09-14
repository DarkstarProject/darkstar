---------------------------------------------
--  Earthshock
--  Creates a seismic wave to damage targets in an area of effect. Additional effect: Stun 
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_STUN;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_STUN) == nil) then
			target:addStatusEffect(EFFECT_STUN,1,0,7);
		end
	end
	
	numhits = 1;
	accmod = 2;
	dmgmod = 3;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_3_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end;