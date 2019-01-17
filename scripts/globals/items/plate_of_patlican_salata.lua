-----------------------------------------
-- ID: 5582
-- Item: plate_of_patlican_salata
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Agility 4
-- Vitality -1
-- Evasion +6
-- hHP +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5582)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.EVA, 6)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.EVA, 6)
    target:delMod(dsp.mod.HPHEAL, 2)
end
