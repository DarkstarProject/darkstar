-----------------------------------------
-- ID: 5147
-- Item: cone_of_snoll_gelato
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP % 16 (cap 75)
-- MP Recovered While Healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5147);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 16);
    target:addMod(MOD_FOOD_MP_CAP, 75);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 16);
    target:delMod(MOD_FOOD_MP_CAP, 75);
    target:delMod(MOD_MPHEAL, 1);
end;
