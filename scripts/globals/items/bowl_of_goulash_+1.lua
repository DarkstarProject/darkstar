-----------------------------------------
-- ID: 5751
-- Item: bowl_of_goulash_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- VIT +4
-- INT -2
-- Accuracy +11% (cap 58)
-- DEF +11% (cap 35)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5751);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 58);
    target:addMod(MOD_FOOD_DEFP, 11);
    target:addMod(MOD_FOOD_DEF_CAP, 35);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 58);
    target:delMod(MOD_FOOD_DEFP, 11);
    target:delMod(MOD_FOOD_DEF_CAP, 35);
end;
