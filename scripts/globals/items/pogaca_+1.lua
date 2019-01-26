-----------------------------------------
-- ID: 5638
-- Item: pogaca_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Lizard Killer +12
-- Resist Paralyze +12
-- HP Recovered While Healing 6
-- MP Recovered While Healing 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,360,5638)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.LIZARD_KILLER, 12)
    target:addMod(dsp.mod.PARALYZERES, 12)
    target:addMod(dsp.mod.HPHEAL, 6)
    target:addMod(dsp.mod.MPHEAL, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.LIZARD_KILLER, 12)
    target:delMod(dsp.mod.PARALYZERES, 12)
    target:delMod(dsp.mod.HPHEAL, 6)
    target:delMod(dsp.mod.MPHEAL, 6)
end
