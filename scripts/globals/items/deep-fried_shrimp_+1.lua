-----------------------------------------
-- ID: 6277
-- Item: deep-fried_shrimp
-- Food Effect: 60Min, All Races
-----------------------------------------
-- VIT +4
-- Fire resistance +21
-- Accuracy +21% (cap 75)
-- Ranged Accuracy +21% (cap 75)
-- Subtle Blow +9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6277)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.FIRERES, 21)
    target:addMod(dsp.mod.FOOD_ACCP, 21)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 75)
    target:addMod(dsp.mod.FOOD_RACCP, 21)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 75)
    target:addMod(dsp.mod.SUBTLE_BLOW, 9)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.FIRERES, 21)
    target:delMod(dsp.mod.FOOD_ACCP, 21)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 75)
    target:delMod(dsp.mod.FOOD_RACCP, 21)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 75)
    target:delMod(dsp.mod.SUBTLE_BLOW, 9)
end
