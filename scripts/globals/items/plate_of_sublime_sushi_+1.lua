-----------------------------------------
-- ID: 6469
-- Item: plate_of_sublime_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +45
-- MP +25
-- STR +7
-- DEX +8
-- MND -4
-- CHR +7
-- Accuracy +11% (cap 105)
-- Ranged Accuracy +11% (cap 105)
-- Resist Sleep +2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6469);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_MP, 25);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_DEX, 8);
    target:addMod(MOD_MND, -4);
    target:addMod(MOD_CHR, 7);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 105);
    target:addMod(MOD_FOOD_RACCP, 11);
    target:addMod(MOD_FOOD_RACC_CAP, 105);
    target:addMod(MOD_SLEEPRES, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_MP, 25);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_DEX, 8);
    target:delMod(MOD_MND, -4);
    target:delMod(MOD_CHR, 7);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 105);
    target:delMod(MOD_FOOD_RACCP, 11);
    target:delMod(MOD_FOOD_RACC_CAP, 105);
    target:delMod(MOD_SLEEPRES, 2);
end;
