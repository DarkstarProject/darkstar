---------------------------------------------
-- Snatch Morsel
-- Steals food effect
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    if (target:hasStatusEffect(dsp.effects.FOOD)) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local FOOD_ID = target:getStatusEffect(dsp.effects.FOOD):getSubType();
        -- local DURATION = target:getStatusEffect(dsp.effects.FOOD):getDuration();
        -- mob:addStatusEffect(dsp.effects.FOOD,0,0,DURATION,FOOD_ID); -- Gives Colibri the players food.
        target:delStatusEffect(dsp.effects.FOOD);
        skill:setMsg(msgBasic.SKILL_ENFEEB_IS);
    elseif (target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local FOOD_ID = target:getStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD):getpower();
        -- local DURATION = target:getStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD):getDuration();
        -- mob:addStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD,FOOD_ID,0,DURATION); -- Gives Colibri the players FoV/GoV food.
        target:delStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD);
        skill:setMsg(msgBasic.SKILL_ENFEEB_IS);
    else
        skill:setMsg(msgBasic.SKILL_MISS); -- no effect
    end

    return dsp.effects.FOOD;
end;
