-----------------------------------------
-- ID: 5231
-- Item: truelove_chocolate
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP 10
-- MP Recovered While Healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5231)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.MPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.MPHEAL, 4)
end
