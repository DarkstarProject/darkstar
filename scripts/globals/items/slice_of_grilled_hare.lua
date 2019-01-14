-----------------------------------------
-- ID: 4371
-- Item: slice_of_grilled_hare
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 2
-- Intelligence -1
-- Attack % 30
-- Attack Cap 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4371)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 30)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 30)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 15)
end
