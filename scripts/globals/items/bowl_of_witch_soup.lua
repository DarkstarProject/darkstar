-----------------------------------------
-- ID: 4333
-- Item: witch_soup
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Magic Points 25
-- Strength -1
-- Mind 2
-- MP Recovered While Healing 1
-- Enmity -2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4333)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 25)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.ENMITY, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 25)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.ENMITY, -2)
end
