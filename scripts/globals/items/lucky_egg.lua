-----------------------------------------
-- ID: 4600
-- Item: lucky_egg
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 14
-- Magic 14
-- Evasion 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4600)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 14)
    target:addMod(dsp.mod.MP, 14)
    target:addMod(dsp.mod.EVA, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 14)
    target:delMod(dsp.mod.MP, 14)
    target:delMod(dsp.mod.EVA, 10)
end
