-----------------------------------------
-- ID: 4429
-- Item: Black Eel
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity 2
-- Mind -4
-- Evasion 5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(dsp.mod.EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4429);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2);
    target:addMod(dsp.mod.MND, -4);
    target:addMod(dsp.mod.EVA, 5);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2);
    target:delMod(dsp.mod.MND, -4);
    target:delMod(dsp.mod.EVA, 5);
end;
