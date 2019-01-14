-----------------------------------------
-- ID: 4344
-- Item: witch_stew
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Magic Points 45
-- Strength -1
-- Mind 4
-- MP Recovered While Healing 4
-- Enmity -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4344)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 45)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.MPHEAL, 4)
    target:addMod(dsp.mod.ENMITY, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 45)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.MPHEAL, 4)
    target:delMod(dsp.mod.ENMITY, -4)
end
