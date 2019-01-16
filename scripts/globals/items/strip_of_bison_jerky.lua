-----------------------------------------
-- ID: 5207
-- Item: strip_of_bison_jerky
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 5
-- Mind -2
-- Attack % 18
-- Attack Cap 70
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5207)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 70)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 70)
end
