-----------------------------------------
-- ID: 4516
-- Item: slice_of_grilled_black_hare
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 2
-- Intelligence -1
-- Attack % 20
-- Attack Cap 30
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4516);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 30);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 30);
end;
