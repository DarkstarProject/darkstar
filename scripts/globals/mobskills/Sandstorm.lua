---------------------------------------------------
-- Sandstorm
-- Kicks up a blinding dust cloud on targets in an area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BLINDNESS;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,30,0,60); -- 30% ?
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end
