---------------------------------------------------
-- Brain Crush
-- Deals damage to single target. Additional effect: Silence
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_SILENCE;
	statmod = MOD_INT;
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_SILENCE) == nil) then
			if(mobTP <= 100) then 
				silenceTime = 30;
			elseif(mobTP <= 200) then 
				silenceTime = 40;
			else 
				silenceTime = 60; 
			end
			
			target:addStatusEffect(EFFECT_SILENCE,1,0,silenceTime);
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = .5;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg);
	return dmg;
	
end