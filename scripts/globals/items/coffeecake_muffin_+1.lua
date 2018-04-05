-----------------------------------------
-- ID: 5656
-- Item: coffeecake_muffin_+1
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- Mind 2
-- Strength -1
-- MP % 10 (cap 90)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5656);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_STR, -1);
    target:addMod(MOD_FOOD_MPP, 10);
    target:addMod(MOD_FOOD_MP_CAP, 90);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_STR, -1);
    target:delMod(MOD_FOOD_MPP, 10);
    target:delMod(MOD_FOOD_MP_CAP, 90);
end;