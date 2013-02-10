---------------------------------------------------
-- Snatch Morsel
-- Steals food effect
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_FOOD;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
        if(resist > 0.1) then
            skill:setMsg(MSG_ENFEEB_IS);

            local food = target:getStatusEffect(EFFECT_FOOD);
            mob:addStatusEffect(EFFECT_FOOD, food:getPower(), 0, food:getDuration());

            target:delStatusEffect(EFFECT_FOOD);
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
