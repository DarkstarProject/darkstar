-----------------------------------------
-- ID: 5713
-- Item: orange_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP +20% (cap 20)
-- AGI -1
-- INT +1
-- Wind resistance +5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5713);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 20);
    target:addMod(MOD_FOOD_MP_CAP, 20);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_WINDRES, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 20);
    target:delMod(MOD_FOOD_MP_CAP, 20);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_WINDRES, 5);
end;
