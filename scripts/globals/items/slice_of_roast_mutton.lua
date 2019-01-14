-----------------------------------------
-- ID: 4437
-- Item: slice_of_roast_mutton
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4437)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 27)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 27)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 30)
end
