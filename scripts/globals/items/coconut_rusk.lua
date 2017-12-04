-----------------------------------------
-- ID: 5784
-- Item: coconut_rusk
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- High-quality success rate +3
-- Synthesis failure rate -6%
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5784);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_SYNTH_HQ_RATE, 3);
    target:addMod(MOD_SYNTH_FAIL_RATE, -6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_SYNTH_HQ_RATE, 3);
    target:delMod(MOD_SYNTH_FAIL_RATE, -6);
end;
