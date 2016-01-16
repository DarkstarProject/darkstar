-----------------------------------------
-- ID: 4507
-- Item: rarab_meatball
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 10
-- Strength 2
-- Vitality 2
-- Intelligence -1
-- Attack % 30
-- Attack Cap 20
-- Ranged ATT % 30
-- Ranged ATT Cap 20
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4507);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 30);
    target:addMod(MOD_FOOD_ATT_CAP, 20);
    target:addMod(MOD_FOOD_RATTP, 30);
    target:addMod(MOD_FOOD_RATT_CAP, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 30);
    target:delMod(MOD_FOOD_ATT_CAP, 20);
    target:delMod(MOD_FOOD_RATTP, 30);
    target:delMod(MOD_FOOD_RATT_CAP, 20);
end;
