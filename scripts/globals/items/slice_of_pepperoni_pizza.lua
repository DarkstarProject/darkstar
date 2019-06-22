-----------------------------------------
-- ID: 6215
-- Item: slice of pepperoni_pizza
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +30
-- STR+1
-- Accuracy+9% (Max. 10)
-- Attack+10% (Max. 15)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6215)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.FOOD_ACCP, 9)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 10)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.FOOD_ACCP, 9)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 10)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 15)
end
