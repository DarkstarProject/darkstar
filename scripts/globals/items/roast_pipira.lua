-----------------------------------------
-- ID: 4538
-- Item: roast_pipira
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -3
-- Attack % 14
-- Attack Cap 75
-- Ranged ATT % 14
-- Ranged ATT Cap 75
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4538);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_FOOD_ATTP, 14);
    target:addMod(MOD_FOOD_ATT_CAP, 75);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 75);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_FOOD_ATTP, 14);
    target:delMod(MOD_FOOD_ATT_CAP, 75);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 75);
end;
