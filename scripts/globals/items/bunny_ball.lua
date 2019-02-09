-----------------------------------------
-- ID: 4349
-- Item: Bunny Ball
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health 10
-- Strength 2
-- Vitality 2
-- Intelligence -1
-- Attack % 30 (cap 30)
-- Ranged ATT % 30 (cap 30)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4349)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 30)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 30)
    target:addMod(dsp.mod.FOOD_RATTP, 30)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 30)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 30)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 30)
    target:delMod(dsp.mod.FOOD_RATTP, 30)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 30)
end
