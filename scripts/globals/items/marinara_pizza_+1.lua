-----------------------------------------
-- ID: 5744
-- Item: marinara_pizza +1
-- Food Effect: 4 hours, all Races
-----------------------------------------
-- HP +25
-- Attack +21% (cap 55)
-- Accuracy +11% (cap 58)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5744)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.FOOD_ATTP, 21)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 55)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:addMod(dsp.mod.UNDEAD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.FOOD_ATTP, 21)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 55)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 58)
    target:delMod(dsp.mod.UNDEAD_KILLER, 5)
end
