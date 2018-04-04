-----------------------------------------
-- ID: 5681
-- Item: cupid_chocolate
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Accuracy +10
-- Ranged Accuracy +10
-- Attack 10
-- Ranged Attack 10
-- Store TP +25
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5681);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ATT, 10);
    target:addMod(MOD_RATT, 10);
    target:addMod(MOD_ACC, 10);
    target:addMod(MOD_RACC, 10);
    target:addMod(MOD_STORETP, 25);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_ATT, 10);
    target:delMod(MOD_RATT, 10);
    target:delMod(MOD_ACC, 10);
    target:delMod(MOD_RACC, 10);
    target:delMod(MOD_STORETP, 25);
end;
