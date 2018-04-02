-----------------------------------------
-- ID: 5678
-- Item: Mushroom Salad
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- MP 14% Cap 85
-- Agility 6
-- Mind 6
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +15
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5678);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 14);
    target:addMod(MOD_FOOD_MP_CAP, 85);
    target:addMod(MOD_AGI, 6);
    target:addMod(MOD_MND, 6);
    target:addMod(MOD_STR, -5);
    target:addMod(MOD_VIT, -5);
    target:addMod(MOD_RACC, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 14);
    target:delMod(MOD_FOOD_MP_CAP, 85);
    target:delMod(MOD_AGI, 6);
    target:delMod(MOD_MND, 6);
    target:delMod(MOD_STR, -5);
    target:delMod(MOD_VIT, -5);
    target:delMod(MOD_RACC, 15);
end;
