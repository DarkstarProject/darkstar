-----------------------------------------
-- ID: 6276
-- Item: deep-fried_shrimp
-- Food Effect: 30Min, All Races
-----------------------------------------
-- VIT +3
-- Fire resistance +20
-- Accuracy +20% (cap 70)
-- Ranged Accuracy +20% (cap 70)
-- Subtle Blow +8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6276)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FIRERES, 20)
    target:addMod(dsp.mod.FOOD_ACCP, 20)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 70)
    target:addMod(dsp.mod.FOOD_RACCP, 20)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 70)
    target:addMod(dsp.mod.SUBTLE_BLOW, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FIRERES, 20)
    target:delMod(dsp.mod.FOOD_ACCP, 20)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 70)
    target:delMod(dsp.mod.FOOD_RACCP, 20)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 70)
    target:delMod(dsp.mod.SUBTLE_BLOW, 8)
end
