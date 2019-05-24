-----------------------------------------
-- ID: 4343
-- Item: witch_kabob
-- Food Effect: 1hour, All Races
-----------------------------------------
-- Magic Points 15
-- Mind 4
-- Enmity -1
-- MP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4343)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.ENMITY, -1)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.ENMITY, -1)
    target:delMod(dsp.mod.MPHEAL, 3)
end
