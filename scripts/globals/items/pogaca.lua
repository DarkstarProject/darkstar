-----------------------------------------
-- ID: 5637
-- Item: pogaca
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Lizard Killer +10
-- Resist Paralyze +10
-- HP Recovered While Healing 4
-- MP Recovered While Healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5637)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.LIZARD_KILLER, 10)
    target:addMod(dsp.mod.PARALYZERES, 10)
    target:addMod(dsp.mod.HPHEAL, 4)
    target:addMod(dsp.mod.MPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.LIZARD_KILLER, 10)
    target:delMod(dsp.mod.PARALYZERES, 10)
    target:delMod(dsp.mod.HPHEAL, 4)
    target:delMod(dsp.mod.MPHEAL, 4)
end
