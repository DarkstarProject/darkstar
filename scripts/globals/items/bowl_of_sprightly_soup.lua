-----------------------------------------
-- ID: 5930
-- Item: Bowl of Sprightly Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- MP 30
-- Mind 4
-- HP Recovered While Healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5930)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 30)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.HPHEAL, 4)
    target:addMod(dsp.mod.ENMITY, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 30)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.HPHEAL, 4)
    target:delMod(dsp.mod.ENMITY, -4)
end
