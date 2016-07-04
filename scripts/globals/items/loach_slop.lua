-----------------------------------------
-- ID: 5669
-- Item: loach_slop
-- Food Effect: 3Hour,Group Food, All Races
-----------------------------------------
-- Accuracy % 7
-- Accuracy Cap 15
-- HP % 7
-- HP Cap 15
-- Evasion 3
-- (Did Not Add Group Food Effect)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5669);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_ACCP, 7);
    target:addMod(MOD_FOOD_ACC_CAP, 15);
    target:addMod(MOD_FOOD_HPP, 7);
    target:addMod(MOD_FOOD_HP_CAP, 15);
    target:addMod(MOD_EVA, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_ACCP, 7);
    target:delMod(MOD_FOOD_ACC_CAP, 15);
    target:delMod(MOD_FOOD_HPP, 7);
    target:delMod(MOD_FOOD_HP_CAP, 15);
    target:delMod(MOD_EVA, 3);
end;

