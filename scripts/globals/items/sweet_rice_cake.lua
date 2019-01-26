-----------------------------------------
-- ID: 4270
-- Item: sweet_rice_cake
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 17
-- Vitality 2
-- Intelligence 3
-- Mind 1
-- HP Recovered While Healing 2
-- MP Recovered While Healing 2
-- Evasion 5
-- Resist Silence 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4270)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 17)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.SILENCERES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 17)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.SILENCERES, 4)
end
