-----------------------------------------
-- ID: 5670
-- Item: Bowl of Loach Gruel
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Make Group Effect
-- Dexterity 2
-- Agility 2
-- Accuracy 7% Cap 30
-- HP 7% Cap 30
-- Evasion 4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5670);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_ACCP, 7);
    target:addMod(MOD_FOOD_ACC_CAP, 30);
    target:addMod(MOD_FOOD_HPP, 7);
    target:addMod(MOD_FOOD_HP_CAP, 30);
    target:addMod(MOD_EVA, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_ACCP, 7);
    target:delMod(MOD_FOOD_ACC_CAP, 30);
    target:delMod(MOD_FOOD_HPP, 7);
    target:delMod(MOD_FOOD_HP_CAP, 30);
    target:delMod(MOD_EVA, 4);
end;
