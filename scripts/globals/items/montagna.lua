-----------------------------------------
-- ID: 5887
-- Item: montagna
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +8% (cap 140)
-- Increases rate of combat skill gains by 60%
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5887);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 8);
    target:addMod(dsp.mod.FOOD_HP_CAP, 140);
    target:addMod(dsp.mod.COMBAT_SKILLUP_RATE, 60);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 8);
    target:delMod(dsp.mod.FOOD_HP_CAP, 140);
    target:delMod(dsp.mod.COMBAT_SKILLUP_RATE, 60);
end;
