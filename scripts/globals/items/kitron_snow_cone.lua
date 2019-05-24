-----------------------------------------
-- ID: 5711
-- Item: kitron_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP +15% (cap 15)
-- Intelligence 2
-- Wind resistance +5
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5711)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 15)
    target:addMod(dsp.mod.FOOD_MP_CAP, 15)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.WINDRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 15)
    target:delMod(dsp.mod.FOOD_MP_CAP, 15)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.WINDRES, 5)
end
