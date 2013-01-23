---------------------------------------------------
-- Sticky Thread
-- Inflicts slow on targets in a fan-shaped area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	if(target:hasStatusEffect(EFFECT_SLOW) == false) then
		return 0;
	end
	return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false and target:hasStatusEffect(EFFECT_HASTE) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.2) then
			target:delStatusEffect(EFFECT_HASTE)
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,37,0,120); -- 30% ?
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end;
