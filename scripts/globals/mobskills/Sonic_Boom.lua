---------------------------------------------------
-- Sonic Boom
-- Reduces attack of targets in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_ATTACK_DOWN;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_EVASION_DOWN) == nil) then
			target:addStatusEffect(EFFECT_EVASION_DOWN,50,0,180);
		end
	end
	
	return EFFECT_ATTACK_DOWN;
	
end