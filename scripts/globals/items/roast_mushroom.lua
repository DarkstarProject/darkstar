-----------------------------------------
-- ID: 4410
-- Item: roast_mushroom
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- Magic Points 10
-- Strength -1
-- Mind 3
-- Enmity -1
-- MP Recovered While Healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4410)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.MND, 3)
    target:addMod(dsp.mod.ENMITY, -1)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.MND, 3)
    target:delMod(dsp.mod.ENMITY, -1)
    target:delMod(dsp.mod.MPHEAL, 2)
end
