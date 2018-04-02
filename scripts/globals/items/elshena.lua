-----------------------------------------
-- ID: 5886
-- Item: elshena
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +7% (cap 120)
-- Increases rate of combat skill gains by 40%
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5886);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 7);
    target:addMod(MOD_FOOD_HP_CAP, 120);
    target:addMod(MOD_COMBAT_SKILLUP_RATE, 40);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 7);
    target:delMod(MOD_FOOD_HP_CAP, 120);
    target:delMod(MOD_COMBAT_SKILLUP_RATE, 40);
end;
