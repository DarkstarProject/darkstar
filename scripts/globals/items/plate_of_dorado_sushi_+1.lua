-----------------------------------------
-- ID: 5179
-- Item: plate_of_dorado_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 5
-- Accuracy % 16
-- Accuracy Cap 76
-- Ranged ACC % 16
-- Ranged ACC Cap 76
-- Sleep Resist 2
-- Enmity 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5179);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ENMITY, 5);
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_FOOD_ACCP, 16);
    target:addMod(MOD_FOOD_ACC_CAP, 76);
    target:addMod(MOD_FOOD_RACCP, 16);
    target:addMod(MOD_FOOD_RACC_CAP, 76);
    target:addMod(MOD_SLEEPRES, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_ENMITY, 5);
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_FOOD_ACCP, 16);
    target:delMod(MOD_FOOD_ACC_CAP, 76);
    target:delMod(MOD_FOOD_RACCP, 16);
    target:delMod(MOD_FOOD_RACC_CAP, 76);
    target:delMod(MOD_SLEEPRES, 2);
end;
