-----------------------------------------
-- ID: 5711
-- Item: kitron_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP +15% (cap 15)
-- Intelligence 2
-- Wind resistance +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5711);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 15);
    target:addMod(MOD_FOOD_MP_CAP, 15);
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_WINDRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 15);
    target:delMod(MOD_FOOD_MP_CAP, 15);
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_WINDRES, 5);
end;
