-----------------------------------------
-- ID: 5599
-- Item: sis_kebabi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 6
-- Vitality -1
-- Intelligence -1
-- Attack % 22
-- Attack Cap 75
-- Ranged ATT % 22
-- Ranged ATT Cap 75
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5599);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 75);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 75);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 75);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 75);
end;
