-----------------------------------------
-- ID: 4266
-- Item: fulm-long_salmon_sub
-- Food Effect: 60Min, All Races
-----------------------------------------
-- DEX +2
-- VIT +1
-- AGI +1
-- INT +2
-- MND -2
-- Ranged Accuracy +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4266)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.RACC, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.RACC, 3)
end
