-----------------------------------------
-- ID: 4519
-- Item: wild_steak
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Intelligence -2
-- Attack % 25
-- Attack Cap 50
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4519)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 25)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 50)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 25)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 50)
end
