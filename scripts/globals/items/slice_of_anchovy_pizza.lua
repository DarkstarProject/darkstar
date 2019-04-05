-----------------------------------------
-- ID: 6217
-- Item: slice of anchovy_pizza
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +30
-- DEX +1
-- Accuracy +9% (Cap 15)
-- Attack +10% (Cap 20)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6217)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.FOOD_ACCP, 9)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 15)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.FOOD_ACCP, 9)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 15)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 20)
end
