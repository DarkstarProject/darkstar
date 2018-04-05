-----------------------------------------
-- ID: 5176
-- Item: plate_of_bream_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 6
-- Vitality 5
-- Accuracy % 16 (cap 76)
-- Ranged ACC % 16 (cap 76)
-- Sleep Resist 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5176);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_ACCP, 16);
    target:addMod(MOD_FOOD_ACC_CAP, 76);
    target:addMod(MOD_FOOD_RACCP, 16);
    target:addMod(MOD_FOOD_RACC_CAP, 76);
    target:addMod(MOD_SLEEPRES, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_ACCP, 16);
    target:delMod(MOD_FOOD_ACC_CAP, 76);
    target:delMod(MOD_FOOD_RACCP, 16);
    target:delMod(MOD_FOOD_RACC_CAP, 76);
    target:delMod(MOD_SLEEPRES, 1);
end;
