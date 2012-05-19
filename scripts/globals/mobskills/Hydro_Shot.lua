---------------------------------------------------
-- Hydro Shot
-- Additional effect: Enmity Down. Chance of effect varies with TP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_ENMITY_DOWN;
	statmod = MOD_MND;
	mobTP = mob:getTP();
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_ENMITY_DOWN) == nil) then
			if(mobTP <= 100) then 
				enmityTime = 15;
			elseif(mobTP <= 200) then 
				enmityTime = 30;
			else 
				enmityTime = 45; 
			end
			
			target:addStatusEffect(EFFECT_ENMITY_DOWN,30,0,enmityTime);
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
	target:delHP(dmg);
	return dmg;
	
end