-----------------------------------------
-- ID: 4495
-- Item: chunk_of_goblin_chocolate
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Health Regen While Healing 5
-- Lizard Killer 10
-- Petrify resistance +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,4495)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.LIZARD_KILLER, 5)
    target:addMod(dsp.mod.PETRIFYRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.LIZARD_KILLER, 5)
    target:delMod(dsp.mod.PETRIFYRES, 5)
end
