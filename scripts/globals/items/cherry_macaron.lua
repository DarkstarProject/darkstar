-----------------------------------------
-- ID: 5779
-- Item: cherry_macaron
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Increases rate of synthesis success +3%
-- Increases synthesis skill gain rate +3% 
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5779);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_SYNTH_SUCCESS, 3);
    target:addMod(MOD_SYNTH_SKILL_GAIN, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_SYNTH_SUCCESS, 3);
    target:delMod(MOD_SYNTH_SKILL_GAIN, 3);
end;
