-----------------------------------------
-- ID: 5780
-- Item: coffee_macaron
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Increases rate of synthesis success +5%
-- Increases synthesis skill gain rate +5% 
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5780);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_SYNTH_SUCCESS, 5);
    target:addMod(MOD_SYNTH_SKILL_GAIN, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_SYNTH_SUCCESS, 5);
    target:delMod(MOD_SYNTH_SKILL_GAIN, 5);
end;
