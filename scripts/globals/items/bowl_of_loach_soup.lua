-----------------------------------------
-- ID: 5671
-- Item: Bowl of Loach Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 4
-- Agility 4
-- Accuracy 7% Cap 50
-- Ranged Accuracy 7% Cap 50
-- HP 7% Cap 50
-- Evasion 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5671);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_FOOD_ACCP, 7);
    target:addMod(MOD_FOOD_ACC_CAP, 50);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 50);
    target:addMod(MOD_FOOD_HPP, 7);
    target:addMod(MOD_FOOD_HP_CAP, 50);
    target:addMod(MOD_EVA, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_FOOD_ACCP, 7);
    target:delMod(MOD_FOOD_ACC_CAP, 50);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 50);
    target:delMod(MOD_FOOD_HPP, 7);
    target:delMod(MOD_FOOD_HP_CAP, 50);
    target:delMod(MOD_EVA, 5);
end;
