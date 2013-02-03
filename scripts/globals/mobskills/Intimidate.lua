---------------------------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLOW;
    if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WATER);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:delStatusEffect(EFFECT_HASTE);
            target:addStatusEffect(typeEffect,30,0,120); -- 30% ?
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
