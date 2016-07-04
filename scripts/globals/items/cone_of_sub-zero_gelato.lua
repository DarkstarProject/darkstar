-----------------------------------------
-- ID: 5155
-- Item: cone_of_sub-zero_gelato
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- HP 10
-- MP % 16 (cap 80)
-- MP Recovered While Healing 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5155);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_FOOD_MPP, 16);
    target:addMod(MOD_FOOD_MP_CAP, 80);
    target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_FOOD_MPP, 16);
    target:delMod(MOD_FOOD_MP_CAP, 80);
    target:delMod(MOD_MPHEAL, 2);
end;
