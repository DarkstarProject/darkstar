-----------------------------------------
-- ID: 5198
-- Item: Dish of Spaghetti Vongole Rosso +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 20
-- Health Cap 95
-- Vitality 2
-- Mind -1
-- Defense % 25
-- Defense Cap 35
-- Store TP 6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5198);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 20);
    target:addMod(MOD_FOOD_HP_CAP, 95);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 35);
    target:addMod(MOD_STORETP, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 20);
    target:delMod(MOD_FOOD_HP_CAP, 95);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 35);
    target:delMod(MOD_STORETP, 6);
end;
