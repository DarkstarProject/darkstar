-----------------------------------------
-- ID: 5223
-- Item: cone_of_homemade_gelato
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Intelligence 1
-- Accuracy +12% (cap 80)
-- Attack +10% (cap 40)
-- Ranged Accuracy +12% (cap 80)
-- Ranged Attack +10% (cap 40)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5223);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_FOOD_ACCP, 12);
    target:addMod(MOD_FOOD_ACC_CAP, 80);
    target:addMod(MOD_FOOD_ATTP, 10);
    target:addMod(MOD_FOOD_ATT_CAP, 40);
    target:addMod(MOD_FOOD_RACCP, 12);
    target:addMod(MOD_FOOD_RACC_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 10);
    target:addMod(MOD_FOOD_RATT_CAP, 40);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_FOOD_ACCP, 12);
    target:delMod(MOD_FOOD_ACC_CAP, 80);
    target:delMod(MOD_FOOD_ATTP, 10);
    target:delMod(MOD_FOOD_ATT_CAP, 40);
    target:delMod(MOD_FOOD_RACCP, 12);
    target:delMod(MOD_FOOD_RACC_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 10);
    target:delMod(MOD_FOOD_RATT_CAP, 40);
end;
