-----------------------------------------
-- ID: 6070
-- Item: Bowl of Oceanfin Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Accuracy % 15 Cap 95
-- Ranged Accuracy % 15 Cap 95
-- Attack % 19 Cap 85
-- Ranged Attack % 19 Cap 85
-- Amorph Killer 6
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,6070);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 95);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 95);
    target:addMod(MOD_FOOD_ATTP, 19);
    target:addMod(MOD_FOOD_ATT_CAP, 85);
    target:addMod(MOD_FOOD_RATTP, 19);
    target:addMod(MOD_FOOD_RATT_CAP, 85);
    target:addMod(MOD_AMORPH_KILLER, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 95);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 95);
    target:delMod(MOD_FOOD_ATTP, 19);
    target:delMod(MOD_FOOD_ATT_CAP, 85);
    target:delMod(MOD_FOOD_RATTP, 19);
    target:delMod(MOD_FOOD_RATT_CAP, 85);
    target:delMod(MOD_AMORPH_KILLER, 6);
end;
