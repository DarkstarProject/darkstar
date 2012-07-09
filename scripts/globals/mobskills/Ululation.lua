---------------------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_PARALYSIS;
	statmod = MOD_INT;
	resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_PARALYSIS) == nil) then
			skill:setMsg(MSG_ENFEEB_IS);
			randy = math.random(40,70);
			target:addStatusEffect(EFFECT_PARALYSIS,randy,0,120); -- 40-60%
		else
			skill:setMsg(MSG_NO_EFFECT); -- no effect
		end
	else
		skill:setMsg(MSG_MISS); -- resist !
	end
	
	return EFFECT_PARALYSIS;
	
end