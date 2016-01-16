-----------------------------------------
-- ID: 5666
-- Item: plate_of_fin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Intelligence 5
-- Accuracy % 17
-- Ranged Accuracy % 17
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5666);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT, 5);
    target:addMod(MOD_FOOD_ACCP, 17);
    target:addMod(MOD_FOOD_ACC_CAP, 999);
    target:addMod(MOD_FOOD_RACCP, 17);
    target:addMod(MOD_FOOD_RACC_CAP, 999);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_INT, 5);
    target:delMod(MOD_FOOD_ACCP, 17);
    target:delMod(MOD_FOOD_ACC_CAP, 999);
    target:delMod(MOD_FOOD_RACCP, 17);
    target:delMod(MOD_FOOD_RACC_CAP, 999);
end;
