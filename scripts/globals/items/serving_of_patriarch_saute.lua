-----------------------------------------
-- ID: 5677
-- Item: Serving of Patriarch Sautee
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP 65
-- Mind 7
-- MP Recovered While Healing 7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5677)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 65)
    target:addMod(dsp.mod.MND, 7)
    target:addMod(dsp.mod.MPHEAL, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 65)
    target:delMod(dsp.mod.MND, 7)
    target:delMod(dsp.mod.MPHEAL, 7)
end
