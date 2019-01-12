-----------------------------------------
-- ID: 5931
-- Item: Bowl of Shimmy Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- MP 32
-- Mind 5
-- HP Recovered While Healing 5
-- Enmity -5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5931)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 32)
    target:addMod(dsp.mod.MND, 5)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.ENMITY, -5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 32)
    target:delMod(dsp.mod.MND, 5)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.ENMITY, -5)
end
