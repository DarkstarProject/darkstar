-----------------------------------------
-- ID: 5290
-- Item: Slice of Diatryma Meat
-- Effect: 5 Minutes, food effect, Galka Only
-----------------------------------------
-- Strength +3
-- Intelligence -5
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.GALKA) then
        result = dsp.msg.basic.CANNOT_EAT
    end
    if (target:getMod(dsp.mod.EAT_RAW_MEAT) == 1) then
        result = 0
    end
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5290)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.INT, -5)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.INT, -5)
end