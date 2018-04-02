-----------------------------------------
-- ID: 5151
-- Item: plate_of_urchin_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 40
-- Strength 1
-- Vitality 5
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5151);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 72);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 72);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 72);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 72);
end;
