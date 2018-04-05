-----------------------------------------
-- ID: 5721
-- Item: plate_of_crab_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Vitality 1
-- Defense 10
-- Accuracy % 13 (cap 64)
-- Resist Sleep +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5721);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_DEF, 10);
    target:addMod(MOD_FOOD_ACCP, 13);
    target:addMod(MOD_FOOD_ACC_CAP, 64);
    target:addMod(MOD_SLEEPRES, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_DEF, 10);
    target:delMod(MOD_FOOD_ACCP, 13);
    target:delMod(MOD_FOOD_ACC_CAP, 64);
    target:delMod(MOD_SLEEPRES, 1);
end;
