-----------------------------------------
-- ID: 5666
-- Item: plate_of_fin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Intelligence 6
-- Accuracy % 17 (cap 80)
-- Ranged Accuracy % 17 (cap 80)
-- Resist Sleep +2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5666);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 6);
    target:addMod(MOD_FOOD_ACCP, 17);
    target:addMod(MOD_FOOD_ACC_CAP, 80);
    target:addMod(MOD_FOOD_RACCP, 17);
    target:addMod(MOD_FOOD_RACC_CAP, 80);
    target:addMod(MOD_SLEEPRES, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 6);
    target:delMod(MOD_FOOD_ACCP, 17);
    target:delMod(MOD_FOOD_ACC_CAP, 80);
    target:delMod(MOD_FOOD_RACCP, 17);
    target:delMod(MOD_FOOD_RACC_CAP, 80);
    target:delMod(MOD_SLEEPRES, 2);
end;
