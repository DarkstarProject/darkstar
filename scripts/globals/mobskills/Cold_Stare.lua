---------------------------------------------------
-- Cold Stare
-- Silences enemies in a line area of effect.
-- Notes: Only applies when face-to-face with the dhalmel.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SILENCE;
	if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,4);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,1,0,120);
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end;
