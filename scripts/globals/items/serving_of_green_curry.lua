-----------------------------------------
-- ID: 4296
-- Item: serving_of_green_curry
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Agility 2
-- Vitality 1
-- Health Regen While Healing 2
-- Magic Regen While Healing 1
-- Defense +9% (cap 160)
-- Ranged ACC +5% (cap 25)
-- Sleep Resist +3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4296);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_FOOD_DEFP, 9);
    target:addMod(MOD_FOOD_DEF_CAP, 160);
    target:addMod(MOD_FOOD_RACCP, 5);
    target:addMod(MOD_FOOD_RACC_CAP, 25);
    target:addMod(MOD_SLEEPRES, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_FOOD_DEFP, 9);
    target:delMod(MOD_FOOD_DEF_CAP, 160);
    target:delMod(MOD_FOOD_RACCP, 5);
    target:delMod(MOD_FOOD_RACC_CAP, 25);
    target:delMod(MOD_SLEEPRES, 3);
end;
