-----------------------------------------
-- ID: 4272
-- Item: slice_of_dragon_meat
-- Food Effect: 5Min, Galka only
-----------------------------------------
-- Strength 6
-- Intelligence -8
-- Demon Killer +2 (?)
-----------------------------------------
require("scripts/globals/status");
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4272);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 6);
    target:addMod(dsp.mod.INT, -8);
    target:addMod(dsp.mod.DEMON_KILLER,2);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 6);
    target:delMod(dsp.mod.INT, -8);
    target:delMod(dsp.mod.DEMON_KILLER,2);
end;
