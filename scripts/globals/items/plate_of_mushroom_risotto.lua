-----------------------------------------
-- ID: 4434
-- Item: Plate of Mushroom Risotto
-- Food Effect: 3 Hr, All Races
-----------------------------------------
-- MP 30
-- Strength -1
-- Vitality 3
-- Mind 3
-- MP Recovered while healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4434)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 30)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.MND, 3)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.ENMITY, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 30)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.MND, 3)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.ENMITY, -4)
end
