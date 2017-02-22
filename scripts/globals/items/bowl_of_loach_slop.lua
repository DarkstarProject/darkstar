-----------------------------------------
-- ID: 5669
-- Item: Bowl of Loach Slop
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Make Group Effect
-- Accuracy 7% Cap 15
-- Ranged Accuracy 7% Cap 15
-- HP 7% Cap 15
-- Evasion 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5669);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_ACCP, 7);
    target:addMod(MOD_FOOD_ACC_CAP, 15);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
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
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
    target:delMod(MOD_FOOD_HPP, 7);
    target:delMod(MOD_FOOD_HP_CAP, 15);
    target:delMod(MOD_EVA, 3);
end;
