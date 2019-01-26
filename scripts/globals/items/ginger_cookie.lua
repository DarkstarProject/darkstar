-----------------------------------------
-- ID: 4394
-- Item: ginger_cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-- Plantoid Killer 10
-- Slow Resist 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,4394)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MPHEAL, 5)
    target:addMod(dsp.mod.PLANTOID_KILLER, 10)
    target:addMod(dsp.mod.SLOWRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 5)
    target:delMod(dsp.mod.PLANTOID_KILLER, 10)
    target:delMod(dsp.mod.SLOWRES, 10)
end
