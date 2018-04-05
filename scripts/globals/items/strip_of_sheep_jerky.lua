-----------------------------------------
-- ID: 4518
-- Item: strip_of_sheep_jerky
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 23
-- Attack Cap 35
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4518);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 23);
    target:addMod(MOD_FOOD_ATT_CAP, 35);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 23);
    target:delMod(MOD_FOOD_ATT_CAP, 35);
end;
