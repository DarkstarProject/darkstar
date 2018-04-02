-----------------------------------------
-- ID: 5728
-- Item: serving_of_zaru_soba_+1
-- Food Effect: 60min, All Races
-----------------------------------------
-- Agility 4
-- HP % 12 (cap 185)
-- Resist Sleep +10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5728);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_FOOD_HPP, 12);
    target:addMod(MOD_FOOD_HP_CAP, 185);
    target:addMod(MOD_SLEEPRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_FOOD_HPP, 12);
    target:delMod(MOD_FOOD_HP_CAP, 185);
    target:delMod(MOD_SLEEPRES, 10);
end;
