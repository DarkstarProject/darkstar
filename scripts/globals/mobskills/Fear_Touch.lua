---------------------------------------------------
-- Fear Touch
-- Touches a single target. Additional effect: Slow
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_SLOW;
	statmod = MOD_INT;
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_SLOW) == nil) then
			if(mobTP <= 100) then 
				slowTime = 60;
			elseif(mobTP <= 200) then 
				slowTime = 90;
			else 
				slowTime = 120; 
			end
			
			target:addStatusEffect(EFFECT_SLOW,30,0,slowTime);
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end