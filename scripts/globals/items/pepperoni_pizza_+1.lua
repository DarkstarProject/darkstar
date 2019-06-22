-----------------------------------------
-- ID: 5698
-- Item: pepperoni_pizza_+1
-- Food Effect: 4 hours, all Races
-----------------------------------------
-- HP +35
-- Strength 2
-- Accuracy 9% (caps @ 11)
-- Attack 10% (caps @ 16)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5698)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 35)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 16)
    target:addMod(dsp.mod.FOOD_ACCP, 9)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 11)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 35)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 16)
    target:delMod(dsp.mod.FOOD_ACCP, 9)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 11)
end
