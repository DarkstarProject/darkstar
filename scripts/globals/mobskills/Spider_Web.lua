---------------------------------------------------
-- Spider Web
-- Entangles all targets in an area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	isEnfeeble = true;
	typeEffect = EFFECT_SLOW;
	statmod = MOD_INT;
	resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	if(resist > 0.5) then
		if(target:getStatusEffect(EFFECT_SLOW) == nil) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(EFFECT_SLOW,2,0,120);
		else
			skill:setMsg(MSG_NO_EFFECT); -- no effect
		end
	else
		skill:setMsg(MSG_MISS); -- resist !
	end
	
	return EFFECT_SLOW;
	
end