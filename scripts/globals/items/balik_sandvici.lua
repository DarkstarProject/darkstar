-----------------------------------------
-- ID: 5590
-- Item: Balik Sandvici
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Agility 1
-- Intelligence 3
-- Mind -2
-- Ranged ACC 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5590)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.RACC, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.RACC, 5)
end
