-----------------------------------------
-- ID: 5679
-- Item: cathedral_salad
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP 15% Cap 90
-- Agility 7
-- Mind 7
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +17
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD)) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5679);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 15);
    target:addMod(MOD_FOOD_MP_CAP, 90);
    target:addMod(MOD_AGI, 7);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_STR, -5);
    target:addMod(MOD_VIT, -5);
    target:addMod(MOD_RACC, 17);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 15);
    target:delMod(MOD_FOOD_MP_CAP, 90);
    target:delMod(MOD_AGI, 7);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_STR, -5);
    target:delMod(MOD_VIT, -5);
    target:delMod(MOD_RACC, 17);
end;
