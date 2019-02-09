-----------------------------------------
-- ID: 4330
-- Item: witch_risotto
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Magic Points 35
-- Strength -1
-- Vitality 3
-- Mind 3
-- MP Recovered While Healing 2
-- Enmity -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4330)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 35)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.MND, 3)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.ENMITY, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 35)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.MND, 3)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.ENMITY, -4)
end
