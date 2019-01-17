-----------------------------------------
-- ID: 5151
-- Item: plate_of_urchin_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 40
-- Strength 1
-- Vitality 5
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5151)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 72)
    target:addMod(dsp.mod.FOOD_RACCP, 15)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 72)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 72)
    target:delMod(dsp.mod.FOOD_RACCP, 15)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 72)
end
