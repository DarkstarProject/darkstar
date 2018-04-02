-----------------------------------------
-- ID: 5730
-- Item: Serving of Bavarois +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 25
-- Intelligence 4
-- hHP +4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5730);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_HPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_HPHEAL, 4);
end;
