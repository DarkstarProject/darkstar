-----------------------------------------
-- ID: 5641
-- Item: M&P Dumpling
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Intelligence 5
-- Agility -5
-- MP 30
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5641)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 30)
    target:addMod(dsp.mod.INT, 5)
    target:addMod(dsp.mod.AGI, -5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 30)
    target:delMod(dsp.mod.INT, 5)
    target:delMod(dsp.mod.AGI, -5)
end
