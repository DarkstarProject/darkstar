-----------------------------------------
-- ID: 4324
-- Item: chunk_of_hobgoblin_chocolate
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health Regen While Healing 7
-- Lizard Killer 12
-- Petrify Resist 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4324)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HPHEAL, 7)
    target:addMod(dsp.mod.LIZARD_KILLER, 12)
    target:addMod(dsp.mod.PETRIFYRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 7)
    target:delMod(dsp.mod.LIZARD_KILLER, 12)
    target:delMod(dsp.mod.PETRIFYRES, 12)
end
