-----------------------------------------
-- ID: 5940
-- Item: Trail Cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- MP Healing 5
-- Aquan Killer 12
-- Sleep Resist 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5940)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MPHEAL, 5)
    target:addMod(dsp.mod.AQUAN_KILLER, 12)
    target:addMod(dsp.mod.SLEEPRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 5)
    target:delMod(dsp.mod.AQUAN_KILLER, 12)
    target:delMod(dsp.mod.SLEEPRES, 10)
end
