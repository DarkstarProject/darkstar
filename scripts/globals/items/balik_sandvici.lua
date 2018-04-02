-----------------------------------------
-- ID: 5590
-- Item: Balik Sandvici
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Agility 1
-- Intelligence 3
-- Mind -2
-- Ranged ACC 5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5590);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_RACC, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_RACC, 5);
end;
