---------------------------------------------------
-- Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP.
-- Range is 13.5 yalms.
-- Piercing damage Ranged Attack.
-- Secondary modifiers: INT: 20%.
-- Additional Effect: Poison is 3 HP/tick.
-- Poison effect may not always process.
-- Removes all Shadow Images on the target. 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_POISON;
	statmod = MOD_INT;
	poisrand = math.random(1,2);
	mobTP = mob:getTP();
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5 and poisrand == 1) then
		if(target:getStatusEffect(EFFECT_POISON) == nil) then
			if(mobTP <= 100) then 
				poisontime = 60;
			elseif(mobTP <= 200) then 
				poisontime = 120;
			else 
				poisontime = 180; 
			end
			
			target:addStatusEffect(EFFECT_POISON,1,3,poisontime);
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end