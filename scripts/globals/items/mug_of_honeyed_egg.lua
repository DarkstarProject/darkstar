-----------------------------------------
-- ID: 5739
-- Item: mug_of_honeyed_egg
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 8
-- Intelligence 1
-- MP recovered while healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5739)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 8)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 8)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
