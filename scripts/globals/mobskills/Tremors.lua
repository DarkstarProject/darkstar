---------------------------------------------------
-- Tremors
-- Deals Earth damage with a seismic disturbance. Additional effect: DEX Down 
-- Area of Effect is centered around caster.
-- Utsusemi/Blink absorb: Wipes shadows 
-- Duration: Three minutes ?
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_DEX_DOWN;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_DEX_DOWN) == nil) then
			target:addStatusEffect(EFFECT_DEX_DOWN,20,0,180); -- -20
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end