-----------------------------------------
-- ID: 5641
-- Item: M&P Dumpling
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Intelligence 5
-- Agility -5
-- MP 30
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5641);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 30);
    target:addMod(MOD_INT, 5);
    target:addMod(MOD_AGI, -5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 30);
    target:delMod(MOD_INT, 5);
    target:delMod(MOD_AGI, -5);
end;
