-----------------------------------------
-- ID: 5685
-- Item: rabbit_pie
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- Strength 5
-- Vitality 5
-- Attack 25% (caps @ 100)
-- Ranged Attack 25% (caps @ 100)
-- Defense 25% (caps @ 100)
-- Intelligence -2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5685)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.FOOD_ATTP, 25)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 100)
    target:addMod(dsp.mod.FOOD_RATTP, 25)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 100)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 100)
    target:addMod(dsp.mod.INT, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.FOOD_ATTP, 25)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 100)
    target:delMod(dsp.mod.FOOD_RATTP, 25)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 100)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 100)
    target:delMod(dsp.mod.INT, -2)
end
