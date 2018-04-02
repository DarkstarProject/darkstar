-----------------------------------------
-- ID: 4365
-- Item: rolanberry
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -4
-- Intelligence 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4365);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, -4);
    target:addMod(MOD_INT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, -4);
    target:delMod(MOD_INT, 2);
end;
