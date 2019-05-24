-----------------------------------------
-- ID: 4523
-- Item: melon_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 30
-- Intelligence 5
-- Magic Regen While Healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4523)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 30)
    target:addMod(dsp.mod.INT, 5)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 30)
    target:delMod(dsp.mod.INT, 5)
    target:delMod(dsp.mod.MPHEAL, 2)
end