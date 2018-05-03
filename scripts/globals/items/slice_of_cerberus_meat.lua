-----------------------------------------
-- ID: 5565
-- Item: slice_of_cerberus_meat
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 10
-- Magic -10
-- Strength 6
-- Intelligence -6
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------
function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 8) then
        result = 247;
    end
    if (target:getMod(dsp.mod.EAT_RAW_MEAT) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5565);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10);
    target:addMod(dsp.mod.MP, -10);
    target:addMod(dsp.mod.STR, 6);
    target:addMod(dsp.mod.INT, -6);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10);
    target:delMod(dsp.mod.MP, -10);
    target:delMod(dsp.mod.STR, 6);
    target:delMod(dsp.mod.INT, -6);
end;
