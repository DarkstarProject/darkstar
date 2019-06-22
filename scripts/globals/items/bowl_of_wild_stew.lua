-----------------------------------------
-- ID: 4589
-- Item: Bowl of Wild Stew
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Agility 1
-- Vitality 2
-- Intelligence -2
-- Attack % 25
-- Attack Cap 50
-- Ranged ATT % 25
-- Ranged ATT Cap 50
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4589)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 25)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:addMod(dsp.mod.FOOD_RATTP, 25)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 50)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 25)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:delMod(dsp.mod.FOOD_RATTP, 25)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 50)
end
