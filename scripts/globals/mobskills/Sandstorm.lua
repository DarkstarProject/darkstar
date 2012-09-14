---------------------------------------------------
-- Sandstorm
-- Kicks up a blinding dust cloud on targets in an area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_BLINDNESS;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_BLINDNESS) == nil) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(EFFECT_BLINDNESS,30,0,60); -- 30% ?
		else
			skill:setMsg(MSG_NO_EFFECT); -- no effect
		end
	else
		skill:setMsg(MSG_MISS); -- resist !
	end
	
	return EFFECT_BLINDNESS;
	
end