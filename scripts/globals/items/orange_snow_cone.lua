-----------------------------------------
-- ID: 5713
-- Item: orange_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP +20% (cap 20)
-- AGI -1
-- INT +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5713)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 20)
    target:addMod(dsp.mod.FOOD_MP_CAP, 20)
    target:addMod(dsp.mod.AGI, -1)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.WINDRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 20)
    target:delMod(dsp.mod.FOOD_MP_CAP, 20)
    target:delMod(dsp.mod.AGI, -1)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.WINDRES, 5)
end
