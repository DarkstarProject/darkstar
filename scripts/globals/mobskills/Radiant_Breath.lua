---------------------------------------------------
-- Radiant Breath
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_SILENCE;
	statmod = MOD_INT;
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_SILENCE) == nil) then
			target:addStatusEffect(EFFECT_SILENCE,1,0,45);
		end
		if(target:getStatusEffect(EFFECT_SLOW) == nil) then
			target:addStatusEffect(EFFECT_SLOW,10,0,45);
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getMainLvl()*10*(mob:getHP()/mob:getMaxHP()),accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end