-----------------------------------------
-- ID: 6071
-- Item: Magma Steak
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- Strength +8
-- Attack +23% Cap 180
-- Ranged Attack +23% Cap 180
-- Vermin Killer +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6071)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 8)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 180)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 180)
    target:addMod(dsp.mod.VERMIN_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 8)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 180)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 180)
    target:delMod(dsp.mod.VERMIN_KILLER, 5)
end
