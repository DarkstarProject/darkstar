---------------------------------------------------
-- Spider Web
-- Entangles all targets in an area of effect.
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
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
		if(resist > 0.1) then
			skill:setMsg(MSG_ENFEEB_IS);
            target:delStatusEffect(EFFECT_HASTE)
			target:addStatusEffect(typeEffect,25,0,120);--power=20;tic=0;duration=120;
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end;
