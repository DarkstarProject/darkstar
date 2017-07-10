-----------------------------------------
-- ID: 6467
-- Item: bowl_of_miso_soup_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +8% (cap 55)
-- DEX +5
-- AGI +5
-- Accuracy +11% (cap 45)
-- Attack +11% (cap 45)
-- Ranged Accuracy +11% (cap 45)
-- Ranged Attack +11% (cap 45)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6467);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 8);
    target:addMod(MOD_FOOD_HP_CAP, 55);
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 45);
    target:addMod(MOD_FOOD_RACCP, 11);
    target:addMod(MOD_FOOD_RACC_CAP, 45);
    target:addMod(MOD_FOOD_ATTP, 11);
    target:addMod(MOD_FOOD_ATT_CAP, 45);
    target:addMod(MOD_FOOD_RATTP, 11);
    target:addMod(MOD_FOOD_RATT_CAP, 45);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 8);
    target:delMod(MOD_FOOD_HP_CAP, 55);
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 45);
    target:delMod(MOD_FOOD_RACCP, 11);
    target:delMod(MOD_FOOD_RACC_CAP, 45);
    target:delMod(MOD_FOOD_ATTP, 11);
    target:delMod(MOD_FOOD_ATT_CAP, 45);
    target:delMod(MOD_FOOD_RATTP, 11);
    target:delMod(MOD_FOOD_RATT_CAP, 45);
end;
