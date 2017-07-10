-----------------------------------------
-- ID: 5762
-- Item: green_curry_bun_+1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- TODO: Group effects
-- VIT +3
-- AGI +4
-- Ranged Accuracy +10% (cap 25)
-- DEF +13% (cap 180)
-- Resist Sleep +5
-- hHP +6
-- hMP +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5762);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_FOOD_RACCP, 10);
    target:addMod(MOD_FOOD_RACC_CAP, 25);
    target:addMod(MOD_FOOD_DEFP, 13);
    target:addMod(MOD_FOOD_DEF_CAP, 180);
    target:addMod(MOD_SLEEPRES, 5);
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_FOOD_RACCP, 10);
    target:delMod(MOD_FOOD_RACC_CAP, 25);
    target:delMod(MOD_FOOD_DEFP, 13);
    target:delMod(MOD_FOOD_DEF_CAP, 180);
    target:delMod(MOD_SLEEPRES, 5);
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 3);
end;
