-----------------------------------------
-- ID: 5720
-- Item: dish_of_spaghetti_marinara_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP % 15 (cap 130)
-- Vitality 2
-- Defense 6
-- Store TP 6
-- hHP +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5720);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 15);
    target:addMod(MOD_FOOD_HP_CAP, 130);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_DEF, 6);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_HPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 15);
    target:delMod(MOD_FOOD_HP_CAP, 130);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_DEF, 6);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_HPHEAL, 1);
end;
