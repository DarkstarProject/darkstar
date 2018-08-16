-----------------------------------------
-- ID: 4358
-- Hare Meat
-- 5 Minutes, food effect, Galka Only
-----------------------------------------
-- Strength +1
-- Intelligence -3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= 8) then
        result = 247
    end
    if (target:getMod(dsp.mod.EAT_RAW_MEAT) == 1) then
        result = 0
    end
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4358)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.INT,-3)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.INT,-3)
end