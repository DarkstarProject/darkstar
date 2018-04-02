-----------------------------------------
-- ID: 5680
-- Item: agaricus mushroom
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- STR -4
-- MND +2
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5680);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, -4)
    target:addMod(MOD_MND, 2)
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, -4)
    target:delMod(MOD_MND, 2)
end;
