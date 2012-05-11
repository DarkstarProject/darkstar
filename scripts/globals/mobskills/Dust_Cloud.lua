---------------------------------------------------
-- Dust Cloud
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 10' cone 
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
			target:addStatusEffect(EFFECT_BLINDNESS,1,0,60);
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	dmg = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*6,accmod,dmgmod,TP_MAB_BONUS,1);
	target:delHP(dmg);
	return dmg;
	
end