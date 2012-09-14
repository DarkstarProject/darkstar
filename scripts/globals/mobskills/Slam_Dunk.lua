---------------------------------------------------
-- Slam Dunk
-- Deals damage to a single target. Additional effect: bind
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_BIND;
	statmod = MOD_INT;
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	
	if(resist > 0.5) then
		if(target:hasStatusEffect(EFFECT_BIND) == false) then
			lvlMultiplyer = mob:getMainLvl()/3.75;
			if(mobTP <= 100) then 
				bindTime = 10 + lvlMultiplyer;
			elseif(mobTP <= 200) then 
				bindTime = 15 + lvlMultiplyer;
			else 
				bindTime = 20 + lvlMultiplyer; 
			end
			
			target:addStatusEffect(EFFECT_BIND,1,0,bindTime);
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end