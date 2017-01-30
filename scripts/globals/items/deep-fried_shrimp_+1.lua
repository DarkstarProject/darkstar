-----------------------------------------
-- ID: 6277
-- Item: deep-fried_shrimp
-- Food Effect: 60Min, All Races
-----------------------------------------
-- VIT +4
-- Fire resistance +21
-- Accuracy +21% (cap 75)
-- Ranged Accuracy +21% (cap 75)
-- Subtle Blow +9
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6277);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_FIRERES, 21);
    target:addMod(MOD_FOOD_ACCP, 21);
    target:addMod(MOD_FOOD_ACC_CAP, 75);
    target:addMod(MOD_FOOD_RACCP, 21);
    target:addMod(MOD_FOOD_RACC_CAP, 75);
    target:addMod(MOD_SUBTLE_BLOW, 9);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_FIRERES, 21);
    target:delMod(MOD_FOOD_ACCP, 21);
    target:delMod(MOD_FOOD_ACC_CAP, 75);
    target:delMod(MOD_FOOD_RACCP, 21);
    target:delMod(MOD_FOOD_RACC_CAP, 75);
    target:delMod(MOD_SUBTLE_BLOW, 9);
end;
