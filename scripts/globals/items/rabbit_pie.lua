-----------------------------------------
-- ID: 5685
-- Item: rabbit_pie
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- Strength 5
-- Vitality 5
-- Attack 25% (caps @ 100)
-- Ranged Attack 25% (caps @ 100)
-- Defense 25% (caps @ 100)
-- Intelligence -2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5685);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_ATTP, 25);
    target:addMod(MOD_FOOD_ATT_CAP, 100);
    target:addMod(MOD_FOOD_RATTP, 25);
    target:addMod(MOD_FOOD_RATT_CAP, 100);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 100);
    target:addMod(MOD_INT, -2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_ATTP, 25);
    target:delMod(MOD_FOOD_ATT_CAP, 100);
    target:delMod(MOD_FOOD_RATTP, 25);
    target:delMod(MOD_FOOD_RATT_CAP, 100);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 100);
    target:delMod(MOD_INT, -2);
end;
