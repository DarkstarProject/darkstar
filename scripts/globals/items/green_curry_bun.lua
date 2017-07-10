-----------------------------------------
-- ID: 5756
-- Item: green_curry_bun
-- Food Effect: 30 min, All Races
-----------------------------------------
-- TODO: Group effects
-- VIT +1
-- AGI +2
-- Ranged Accuracy +5% (cap 25)
-- DEF +9% (cap 160)
-- Resist Sleep +3
-- hHP +2
-- hMP +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5756);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_RACCP, 5);
    target:addMod(MOD_FOOD_RACC_CAP, 25);
    target:addMod(MOD_FOOD_DEFP, 9);
    target:addMod(MOD_FOOD_DEF_CAP, 160);
    target:addMod(MOD_SLEEPRES, 3);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_RACCP, 5);
    target:delMod(MOD_FOOD_RACC_CAP, 25);
    target:delMod(MOD_FOOD_DEFP, 9);
    target:delMod(MOD_FOOD_DEF_CAP, 160);
    target:delMod(MOD_SLEEPRES, 3);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
end;
