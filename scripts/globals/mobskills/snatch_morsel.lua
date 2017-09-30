---------------------------------------------------
-- Snatch Morsel
-- Steals food effect
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (target:hasStatusEffect(EFFECT_FOOD)) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local FOOD_ID = target:getStatusEffect(EFFECT_FOOD):getSubType();
        -- local DURATION = target:getStatusEffect(EFFECT_FOOD):getDuration();
        -- mob:addStatusEffect(EFFECT_FOOD,0,0,DURATION,FOOD_ID); -- Gives Colibri the players food.
        target:delStatusEffect(EFFECT_FOOD);
        skill:setMsg(msgBasic.ENFEEB_IS);
    elseif (target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local FOOD_ID = target:getStatusEffect(EFFECT_FIELD_SUPPORT_FOOD):getpower();
        -- local DURATION = target:getStatusEffect(EFFECT_FIELD_SUPPORT_FOOD):getDuration();
        -- mob:addStatusEffect(EFFECT_FIELD_SUPPORT_FOOD,FOOD_ID,0,DURATION); -- Gives Colibri the players FoV/GoV food.
        target:delStatusEffect(EFFECT_FIELD_SUPPORT_FOOD);
        skill:setMsg(msgBasic.ENFEEB_IS);
    else
        skill:setMsg(msgBasic.MISS); -- no effect
    end

    return EFFECT_FOOD;
end;
