---------------------------------------------------
-- Sand Breath
-- Deals Earth damage to enemies within a fan-shaped area. Additional effect: Blind 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_BLINDNESS;
	statmod = MOD_INT;
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_BLINDNESS) == nil) then
			target:addStatusEffect(EFFECT_BLINDNESS,30,0,180); -- -30%
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end