-----------------------------------------
-- ID: 4576
-- Item: wizard_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- MP Recovered While Healing 7
-- Plantoid Killer 12
-- Slow Resist 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4576)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MPHEAL, 7)
    target:addMod(dsp.mod.PLANTOID_KILLER, 12)
    target:addMod(dsp.mod.SLOWRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 7)
    target:delMod(dsp.mod.PLANTOID_KILLER, 12)
    target:delMod(dsp.mod.SLOWRES, 12)
end
