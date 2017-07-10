-----------------------------------------
-- ID: 4326
-- Item: serving_of_frog_flambe
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 3
-- Agility 2
-- Mind -2
-- Attack +14% (cap 80)
-- Ranged Attack +14% (cap 80)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4326);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_ATTP, 14);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_ATTP, 14);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
end;
