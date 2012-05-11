require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	if(target:getStatusEffect(EFFECT_PARALYSIS) ~= nil) then
		skill:setMsg(MSG_NO_EFFECT);
		return EFFECT_PARALYSIS;
	else
		isEnfeeble = true;
		typeEffect = EFFECT_PARALYSIS;
		statmod = MOD_INT;
		resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
		if(resist < 0.5) then
			--resist!
			skill:setMsg(MSG_MISS);
			return EFFECT_PARALYSIS;
		else
			--land
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(EFFECT_PARALYSIS,1,0,60);
			return EFFECT_PARALYSIS;
		end
	end
end