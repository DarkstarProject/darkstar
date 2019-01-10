-----------------------------------------
-- ID: 5628
-- Item: Silken Smile
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- Intelligence 2
-- HP Recovered while healing 4
-- MP Recovered while healing 7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5628)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.HPHEAL, 4)
    target:addMod(dsp.mod.MPHEAL, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.HPHEAL, 4)
    target:delMod(dsp.mod.MPHEAL, 7)
end
