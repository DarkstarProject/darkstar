-----------------------------------------
-- ID: 5194
-- Item: Bowl of Pomodoro Sauce
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Intelligence 2
-- Mind 2
-- HP Recovered while healing +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5194);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_HPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_HPHEAL, 1);
end;
