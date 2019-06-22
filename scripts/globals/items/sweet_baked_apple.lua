-----------------------------------------
-- ID: 4336
-- Item: sweet_baked_apple
-- Food Effect: 1hour, All Races
-----------------------------------------
-- Magic Points 25
-- Intelligence 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4336)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 25)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 25)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MPHEAL, 2)
end
