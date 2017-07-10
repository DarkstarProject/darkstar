-----------------------------------------
-- ID: 5153
-- Item: plate_of_fatty_tuna_sushi
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 20
-- Dexterity 3
-- Charisma 5
-- Accuracy % 16 (cap 76)
-- Ranged ACC 16 (cap 76)
-- Sleep Resist 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5153);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_CHR, 5);
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
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_CHR, 5);
    target:delMod(MOD_FOOD_ACCP, 16);
    target:delMod(MOD_FOOD_ACC_CAP, 76);
    target:delMod(MOD_FOOD_RACCP, 16);
    target:delMod(MOD_FOOD_RACC_CAP, 76);
    target:delMod(MOD_SLEEPRES, 2);
end;
