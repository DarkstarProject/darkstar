-----------------------------------------
-- ID: 4411
-- Item: dhalmel_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 25
-- Strength 4
-- Agility 2
-- Vitality 1
-- Intelligence -2
-- Mind 1
-- Attack % 25
-- Attack Cap 45
-- Ranged ATT % 25
-- Ranged ATT Cap 45
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4411);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_FOOD_ATTP, 25);
    target:addMod(MOD_FOOD_ATT_CAP, 45);
    target:addMod(MOD_FOOD_RATTP, 25);
    target:addMod(MOD_FOOD_RATT_CAP, 45);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_FOOD_ATTP, 25);
    target:delMod(MOD_FOOD_ATT_CAP, 45);
    target:delMod(MOD_FOOD_RATTP, 25);
    target:delMod(MOD_FOOD_RATT_CAP, 45);
end;
