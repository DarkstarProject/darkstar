-----------------------------------------
-- ID: 6213
-- Item: slice of margherita pizza
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +30
-- Accuracy+10% (Max. 8)
-- Attack+10% (Max. 10)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6213)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 8)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 8)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 10)
end
