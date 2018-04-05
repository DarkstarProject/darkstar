-----------------------------------------
-- ID: 4587
-- Item: Broiled Trout
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -1
-- Ranged ATT % 14 (cap 55)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4587);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 45);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 45);
end;
