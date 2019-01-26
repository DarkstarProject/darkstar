-----------------------------------------
-- ID: 5583
-- Item: plate_of_patlican_salata_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Agility 5
-- Vitality -2
-- Evasion +7
-- hHP +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5583)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.VIT, -2)
    target:addMod(dsp.mod.EVA, 7)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.VIT, -2)
    target:delMod(dsp.mod.EVA, 7)
    target:delMod(dsp.mod.HPHEAL, 3)
end
