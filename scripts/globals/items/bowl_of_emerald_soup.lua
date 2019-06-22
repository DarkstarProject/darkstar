-----------------------------------------
-- ID: 4327
-- Item: Bowl of Emerald Soup
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 2
-- Vitality -1
-- Health Regen While Healing 3
-- Ranged ACC 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4327)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.RACC, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.RACC, 6)
end
