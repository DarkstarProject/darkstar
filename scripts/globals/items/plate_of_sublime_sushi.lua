-----------------------------------------
-- ID: 6468
-- Item: plate_of_sublime_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +40
-- MP +20
-- STR +6
-- DEX +7
-- MND -3
-- CHR +6
-- Accuracy +10% (cap 100)
-- Ranged Accuracy +10% (cap 100)
-- Resist Sleep +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6468);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_DEX, 7);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_CHR, 6);
    target:addMod(MOD_FOOD_ACCP, 10);
    target:addMod(MOD_FOOD_ACC_CAP, 100);
    target:addMod(MOD_FOOD_RACCP, 10);
    target:addMod(MOD_FOOD_RACC_CAP, 100);
    target:addMod(MOD_SLEEPRES, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_DEX, 7);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_CHR, 6);
    target:delMod(MOD_FOOD_ACCP, 10);
    target:delMod(MOD_FOOD_ACC_CAP, 100);
    target:delMod(MOD_FOOD_RACCP, 10);
    target:delMod(MOD_FOOD_RACC_CAP, 100);
    target:delMod(MOD_SLEEPRES, 1);
end;
