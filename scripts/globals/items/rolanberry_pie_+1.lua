-----------------------------------------
-- ID: 4339
-- Item: rolanberry_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 60
-- Intelligence 3
-- MP Regen While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4339)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 60)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 60)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MPHEAL, 1)
end
