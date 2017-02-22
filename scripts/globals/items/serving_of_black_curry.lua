-----------------------------------------
-- ID: 4297
-- Item: serving_of_black_curry
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 2
-- Vitality 4
-- Intelligence 1
-- Health Regen While Healing 2
-- Magic Regen While Healing 1
-- defense % 15 (cap 180)
-- Accuracy 5
-- Evasion 5
-- Ranged ACC 5
-- Sleep Resist 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4297);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_FOOD_DEFP, 15);
    target:addMod(MOD_FOOD_DEF_CAP, 180);
    target:addMod(MOD_ACC, 5);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_RACC, 5);
    target:addMod(MOD_SLEEPRES, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_FOOD_DEFP, 15);
    target:delMod(MOD_FOOD_DEF_CAP, 180);
    target:delMod(MOD_ACC, 5);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_RACC, 5);
    target:delMod(MOD_SLEEPRES, 3);
end;
