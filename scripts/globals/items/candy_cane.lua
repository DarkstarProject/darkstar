-----------------------------------------
-- ID: 5622
-- Item: Candy Cane
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Intelligence 4
-- Mind 4
-- MP Recovery while healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5622)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.MPHEAL, 2)
end
