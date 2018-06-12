-----------------------------------------
-- ID: 4379
-- Item: cheval_salmon
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity 2
-- Charisma -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4379);
end;

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2);
    target:addMod(dsp.mod.CHR, -4);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2);
    target:delMod(dsp.mod.CHR, -4);
end;
