-----------------------------------------
-- ID: 5639
-- Item: Skewer of M&P Chicken
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Strength 5
-- Intelligence -5
-- Attack % 25
-- Attack Cap 154
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5639);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_INT, -5);
    target:addMod(MOD_FOOD_ATTP, 25);
    target:addMod(MOD_FOOD_ATT_CAP, 154);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_INT, -5);
    target:delMod(MOD_FOOD_ATTP, 25);
    target:delMod(MOD_FOOD_ATT_CAP, 154);
end;
