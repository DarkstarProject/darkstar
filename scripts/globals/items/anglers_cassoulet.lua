-----------------------------------------
-- ID: 5704
-- Item: anglers_cassoulet
-- Food Effect: 30, All Races
-----------------------------------------
-- VIT -1
-- AGI +5
-- Ranged Accuracy +1
-- Regen +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5704)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.REGEN, 1)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.RACC, 5)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.REGEN, 1)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.RACC, 5)
end
