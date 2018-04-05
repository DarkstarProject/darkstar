-----------------------------------------
-- ID: 5139
-- Item: Betta
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity 3
-- Mind -5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5139);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -5);
end;
