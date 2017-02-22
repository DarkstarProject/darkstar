-----------------------------------------
-- ID: 5146
-- Item: hedgehog_pie
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 55
-- Strength 6
-- Vitality 2
-- Intelligence -3
-- Mind 3
-- Magic Regen While Healing 2
-- Health Regen While Healing 2
-- Attack % 18
-- Attack Cap 90
-- Accuracy 5
-- Ranged ATT % 18
-- Ranged ATT Cap 90
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5146);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 55);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_MND, 3);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 90);
    target:addMod(MOD_ACC, 5);
    target:addMod(MOD_FOOD_RATTP, 18);
    target:addMod(MOD_FOOD_RATT_CAP, 90);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 55);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_MND, 3);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 90);
    target:delMod(MOD_ACC, 5);
    target:delMod(MOD_FOOD_RATTP, 18);
    target:delMod(MOD_FOOD_RATT_CAP, 90);
end;
