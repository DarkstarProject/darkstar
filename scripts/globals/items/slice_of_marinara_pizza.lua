-----------------------------------------
-- ID: 6211
-- Item: slice of marinara pizza
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- HP +20
-- Accuracy +10% (54)
-- Attack +20% (cap 50 @ 250 base attack)
-- Undead Killer
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6211)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:addMod(dsp.mod.UNDEAD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:delMod(dsp.mod.UNDEAD_KILLER, 5)
end
