-----------------------------------------
-- ID: 5160
-- Item: plate_of_urchin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 40
-- Strength 1
-- Vitality 6
-- Accuracy % 16 (cap 76)
-- Ranged ACC % 16 (cap 76)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5160);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_FOOD_ACCP, 16);
    target:addMod(MOD_FOOD_ACC_CAP, 76);
    target:addMod(MOD_FOOD_RACCP, 16);
    target:addMod(MOD_FOOD_RACC_CAP, 76);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_FOOD_ACCP, 16);
    target:delMod(MOD_FOOD_ACC_CAP, 76);
    target:delMod(MOD_FOOD_RACCP, 16);
    target:delMod(MOD_FOOD_RACC_CAP, 76);
end;
