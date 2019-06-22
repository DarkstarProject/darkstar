-----------------------------------------
-- ID: 6212
-- Item: slice of marinara pizza +1
-- Food Effect: 60 minutes, all Races
-----------------------------------------
-- HP +25
-- Accuracy+11% (Max. 58)
-- Attack+21% (Max. 55)
-- "Undead Killer"+5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6212)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:addMod(dsp.mod.FOOD_ATTP, 21)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 55)
    target:addMod(dsp.mod.UNDEAD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:delMod(dsp.mod.FOOD_ATTP, 21)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 55)
    target:delMod(dsp.mod.UNDEAD_KILLER, 5)
end
