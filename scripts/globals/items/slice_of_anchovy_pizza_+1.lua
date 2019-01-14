-----------------------------------------
-- ID: 6218
-- Item: slice of anchovy pizza +1
-- Food Effect: 60 minutes, all Races
-----------------------------------------
-- HP +35
-- DEX +2
-- Accuracy +9% (Cap 16)
-- Attack +10% (Cap 21)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6218)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 35)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.FOOD_ACCP, 9)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 16)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 21)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 35)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.FOOD_ACCP, 9)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 16)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 21)
end
