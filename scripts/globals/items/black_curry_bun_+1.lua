-----------------------------------------
-- ID: 5764
-- Item: black_curry_bun+1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- TODO: Group effects
-- Dexterity +4
-- Vitality +6
-- Intelligence +3
-- Mind +1
-- Accuracy +7
-- Ranged Accuracy +7
-- Evasion +7
-- Defense +25% (cap 200)
-- Resist Sleep +5
-- hHP +6
-- hMP +3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5764);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_ACC, 7);
    target:addMod(MOD_RACC, 7);
    target:addMod(MOD_EVA, 7);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 200);
    target:addMod(MOD_SLEEPRES, 5);
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_ACC, 7);
    target:delMod(MOD_RACC, 7);
    target:delMod(MOD_EVA, 7);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 200);
    target:delMod(MOD_SLEEPRES, 5);
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 3);
end;