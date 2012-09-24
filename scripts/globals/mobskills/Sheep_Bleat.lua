---------------------------------------------------
-- Sheep Bleat
-- Emits a unnerving bleat that slows down players in range.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,30,0,120); -- 30% ? power=30;tic=0;duration=120;
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end;
