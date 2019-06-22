-----------------------------------------
-- ID: 4525
-- Item: pumpkin_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 45
-- Intelligence 4
-- Charisma -1
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4525)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 45)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.CHR, -1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 45)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.CHR, -1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
