-----------------------------------------
-- ID: 5655
-- Item: coffeecake_muffin
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind 1
-- Strength -1
-- MP % 10 (cap 85)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5655);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_STR, -1);
    target:addMod(MOD_FOOD_MPP, 10);
    target:addMod(MOD_FOOD_MP_CAP, 85);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_STR, -1);
    target:delMod(MOD_FOOD_MPP, 10);
    target:delMod(MOD_FOOD_MP_CAP, 85);
end;