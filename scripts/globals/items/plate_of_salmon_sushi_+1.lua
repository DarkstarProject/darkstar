-----------------------------------------
-- ID: 5664
-- Item: plate_of_salmon_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 2
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5664);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 72);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 72);
    target:addMod(MOD_SLEEPRES, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 72);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 72);
    target:delMod(MOD_SLEEPRES, 2);
end;
