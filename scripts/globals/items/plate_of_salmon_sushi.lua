-----------------------------------------
-- ID: 5663
-- Item: plate_of_salmon_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 1
-- Accuracy % 14 (cap 68)
-- Ranged ACC % 14 (cap 68)
-- Resist sleep +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5663);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_FOOD_ACCP, 14);
    target:addMod(MOD_FOOD_ACC_CAP, 68);
    target:addMod(MOD_FOOD_RACCP, 14);
    target:addMod(MOD_FOOD_RACC_CAP, 68);
    target:addMod(MOD_SLEEPRES, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_FOOD_ACCP, 14);
    target:delMod(MOD_FOOD_ACC_CAP, 68);
    target:delMod(MOD_FOOD_RACCP, 14);
    target:delMod(MOD_FOOD_RACC_CAP, 68);
    target:delMod(MOD_SLEEPRES, 1);
end;
