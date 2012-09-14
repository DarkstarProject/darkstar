---------------------------------------------------
-- Head Butt (Adamantoise)
-- Deals damage to single target. Additional effects: Accuracy Down and large knockback
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_ACCURACY_DOWN;
	statmod = MOD_INT;
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_ACCURACY_DOWN) == nil) then
			if(mobTP <= 100) then 
				accDownTime = 60;
			elseif(mobTP <= 200) then 
				accDownTime = 90;
			else 
				accDownTime = 120; 
			end
			
			target:addStatusEffect(EFFECT_ACCURACY_DOWN,50,0,accDownTime);
		end
	end
	
	-- Large Knockdown ----------------------------
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
	
end