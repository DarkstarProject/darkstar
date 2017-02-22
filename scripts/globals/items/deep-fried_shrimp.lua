-----------------------------------------
-- ID: 6276
-- Item: deep-fried_shrimp
-- Food Effect: 30Min, All Races
-----------------------------------------
-- VIT +3
-- Fire resistance +20
-- Accuracy +20% (cap 70)
-- Ranged Accuracy +20% (cap 70)
-- Subtle Blow +8
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6276);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_FIRERES, 20);
    target:addMod(MOD_FOOD_ACCP, 20);
    target:addMod(MOD_FOOD_ACC_CAP, 70);
    target:addMod(MOD_FOOD_RACCP, 20);
    target:addMod(MOD_FOOD_RACC_CAP, 70);
    target:addMod(MOD_SUBTLE_BLOW, 8);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_FIRERES, 20);
    target:delMod(MOD_FOOD_ACCP, 20);
    target:delMod(MOD_FOOD_ACC_CAP, 70);
    target:delMod(MOD_FOOD_RACCP, 20);
    target:delMod(MOD_FOOD_RACC_CAP, 70);
    target:delMod(MOD_SUBTLE_BLOW, 8);
end;
