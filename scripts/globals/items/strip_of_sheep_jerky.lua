-----------------------------------------
-- ID: 4518
-- Item: strip_of_sheep_jerky
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 23
-- Attack Cap 35
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4518)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 35)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 35)
end
