-----------------------------------------
-- ID: 5598
-- Item: sis_kebabi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 6
-- Vitality -2
-- Intelligence -2
-- Attack % 20
-- Attack Cap 70
-- Ranged ATT % 20
-- Ranged ATT Cap 70
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5598);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_VIT, -2);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 70);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 70);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_VIT, -2);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 70);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 70);
end;
