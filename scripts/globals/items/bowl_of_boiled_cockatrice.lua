-----------------------------------------
-- ID: 4547
-- Item: Bowl of Boiled Cockatrice
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 2
-- Intelligence -2
-- Mind 1
-- Attack % 22
-- Attack Cap 60
-- Ranged ATT % 22
-- Ranged ATT Cap 60
-- Resist petrify +4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4547);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 60);
    target:addMod(MOD_PETRIFYRES, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 60);
    target:delMod(MOD_PETRIFYRES, 4);
end;
