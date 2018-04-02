-----------------------------------------
-- ID: 5581
-- Item: Slice of Ziz Meat
-- Effect: 5 Minutes, food effect, Galka Only
-----------------------------------------
-- Strength +4
-- Intelligence -6
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 8) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_MEAT) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5581);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_INT,-6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_INT,-6);
end;