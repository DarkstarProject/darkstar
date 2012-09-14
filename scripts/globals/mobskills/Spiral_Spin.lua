---------------------------------------------
--  Spiral Spin
--
--  Description: Chance of effect varies with TP. Additional Effect: Accuracy Down.
--  Type: Physical (Slashing)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    isEnfeeble = true;
	typeEffect = EFFECT_ACCURACY_DOWN;
	statmod = MOD_INT;
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_ACCURACY_DOWN) == nil) then
			if(mobTP <= 100) then 
				accDownTime = 30;
			elseif(mobTP <= 200) then 
				accDownTime = 60;
			else 
				accDownTime = 90; 
			end
			
			target:addStatusEffect(EFFECT_ACCURACY_DOWN,50,0,accDownTime);
		end
	end
    
	numhits = 1;
	accmod = 2;
	dmgmod = 3;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	return dmg;

end;