-----------------------------------------
-- ID: 4395
-- Item: galkan_sausage
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Multi-Race Effects
-- Galka
-- Strength 3
-- Intelligence -1
-- Attack % 25
-- Attack Cap 30
-- Ranged ATT % 25
-- Ranged ATT Cap 30
--
-- Other
-- Strength 3
-- Intelligence -4
-- Attack 9
-- Ranged ATT  9
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4395);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    if (target:getRace() ~= 8) then
        target:addMod(MOD_STR, 3);
        target:addMod(MOD_INT, -4);
        target:addMod(MOD_ATT, 9);
        target:addMod(MOD_RATT, 9);
    else
        target:addMod(MOD_STR, 3);
        target:addMod(MOD_INT, -1);
        target:addMod(MOD_FOOD_ATTP, 25);
        target:addMod(MOD_FOOD_ATT_CAP, 30);
        target:addMod(MOD_FOOD_RATTP, 25);
        target:addMod(MOD_FOOD_RATT_CAP, 30);
    end
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    if (target:getRace() ~= 8) then
        target:addMod(MOD_STR, 3);
        target:addMod(MOD_INT, -4);
        target:addMod(MOD_ATT, 9);
        target:addMod(MOD_RATT, 9);
    else
        target:delMod(MOD_STR, 3);
        target:delMod(MOD_INT, -1);
        target:delMod(MOD_FOOD_ATTP, 25);
        target:delMod(MOD_FOOD_ATT_CAP, 30);
        target:delMod(MOD_FOOD_RATTP, 25);
        target:delMod(MOD_FOOD_RATT_CAP, 30);
    end
end;
