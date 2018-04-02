-----------------------------------------
-- ID: 5142
-- Item: serving_of_bison_steak
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 6
-- Agility 1
-- Intelligence -3
-- Attack % 18
-- Attack Cap 90
-- Ranged ATT % 18
-- Ranged ATT Cap 90
-- Lizard Killer 5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5142);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 90);
    target:addMod(MOD_FOOD_RATTP, 18);
    target:addMod(MOD_FOOD_RATT_CAP, 90);
    target:addMod(MOD_LIZARD_KILLER, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 90);
    target:delMod(MOD_FOOD_RATTP, 18);
    target:delMod(MOD_FOOD_RATT_CAP, 90);
    target:delMod(MOD_LIZARD_KILLER, 5);
end;
