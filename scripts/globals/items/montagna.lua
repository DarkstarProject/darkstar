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
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5887);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 8);
    target:addMod(MOD_FOOD_HP_CAP, 140);
    target:addMod(MOD_COMBAT_SKILLUP_RATE, 60);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 8);
    target:delMod(MOD_FOOD_HP_CAP, 140);
    target:delMod(MOD_COMBAT_SKILLUP_RATE, 60);
end;
