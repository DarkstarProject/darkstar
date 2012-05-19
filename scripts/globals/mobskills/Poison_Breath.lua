---------------------------------------------------
-- Poison Breath
--     Deals Water damage to targets in a fan-shaped area of effect. Additional Effect: Poison 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_POISON;
	statmod = MOD_INT;
	poison = mob:getMainLvl() / 4;
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_POISON) == nil) then
			target:addStatusEffect(EFFECT_POISON,1,poison,180); -- tick by level
		end
	end
	
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS); -- Breath dmg
	target:delHP(dmg);
	return dmg;
	
end