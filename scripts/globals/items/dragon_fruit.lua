-----------------------------------------
-- ID: 5662
-- Item: Dragon Fruit
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- Intelligence 4
-- Agility -6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5662);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_AGI, -6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_AGI, -6);
end;
