---------------------------------------------------
-- Ultrasonics
-- Reduces evasion of targets in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_EVASION_DOWN;
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
		if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:delStatusEffect(typeEffect);
			target:addStatusEffect(typeEffect,25,0,180*resist); -- 25%
        else
            skill:setMsg(MSG_MISS);
		end

        return typeEffect;
end;
