-----------------------------------------
-- ID: 5750
-- Item: bowl_of_goulash
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- VIT +3
-- INT -2
-- Accuracy +10% (cap 54)
-- DEF +10% (cap 30)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5750);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ACCP, 10);
    target:addMod(MOD_FOOD_ACC_CAP, 54);
    target:addMod(MOD_FOOD_DEFP, 10);
    target:addMod(MOD_FOOD_DEF_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ACCP, 10);
    target:delMod(MOD_FOOD_ACC_CAP, 54);
    target:delMod(MOD_FOOD_DEFP, 10);
    target:delMod(MOD_FOOD_DEF_CAP, 30);
end;
