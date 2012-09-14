---------------------------------------------
--  Hydroball
--  Deals Water damage to targets in a fan-shaped area of effect. Additional effect: STR Down 
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Notes: STR reduced by 15%. 
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_STR_DOWN;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_STR_DOWN) == nil) then
			target:addStatusEffect(EFFECT_STR_DOWN,40,0,180);
		end
	end
	
	dmgmod = 1;
	accmod = 1;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 5,accmod,dmgmod,TP_MAB_BONUS,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end;