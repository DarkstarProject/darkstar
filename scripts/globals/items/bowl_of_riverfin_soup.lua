-----------------------------------------
-- ID: 6069
-- Item: Bowl of Riverfin Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Accuracy % 14 Cap 90
-- Ranged Accuracy % 14 Cap 90
-- Attack % 18 Cap 80
-- Ranged Attack % 18 Cap 80
-- Amorph Killer 5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,6069);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_ACCP, 14);
    target:addMod(MOD_FOOD_ACC_CAP, 90);
    target:addMod(MOD_FOOD_RACCP, 14);
    target:addMod(MOD_FOOD_RACC_CAP, 90);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 18);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
    target:addMod(MOD_AMORPH_KILLER, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_ACCP, 14);
    target:delMod(MOD_FOOD_ACC_CAP, 90);
    target:delMod(MOD_FOOD_RACCP, 14);
    target:delMod(MOD_FOOD_RACC_CAP, 90);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 18);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
    target:delMod(MOD_AMORPH_KILLER, 5);
end;
