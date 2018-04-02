-----------------------------------------
-- ID: 5600
-- Item: Balik Sis
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -2
-- Attack % 13
-- Attack Cap 65
-- Ranged ACC 1
-- Ranged ATT % 13
-- Ranged ATT Cap 65
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5600);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_ATTP, 13);
    target:addMod(MOD_FOOD_ATT_CAP, 65);
    target:addMod(MOD_RACC, 1);
    target:addMod(MOD_FOOD_RATTP, 13);
    target:addMod(MOD_FOOD_RATT_CAP, 65);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_ATTP, 13);
    target:delMod(MOD_FOOD_ATT_CAP, 65);
    target:delMod(MOD_RACC, 1);
    target:delMod(MOD_FOOD_RATTP, 13);
    target:delMod(MOD_FOOD_RATT_CAP, 65);
end;
