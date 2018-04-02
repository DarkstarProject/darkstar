-----------------------------------------
-- ID: 5177
-- Item: plate_of_bream_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 6
-- Vitality 5
-- Accuracy % 17 (cap 80)
-- Ranged ACC % 17 (cap 80)
-- Sleep Resist 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5177);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_ACCP, 17);
    target:addMod(MOD_FOOD_ACC_CAP, 80);
    target:addMod(MOD_FOOD_RACCP, 17);
    target:addMod(MOD_FOOD_RACC_CAP, 80);
    target:addMod(MOD_SLEEPRES, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_ACCP, 17);
    target:delMod(MOD_FOOD_ACC_CAP, 80);
    target:delMod(MOD_FOOD_RACCP, 17);
    target:delMod(MOD_FOOD_RACC_CAP, 80);
    target:delMod(MOD_SLEEPRES, 2);
end;
