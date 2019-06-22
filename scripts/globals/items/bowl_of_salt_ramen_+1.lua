-----------------------------------------
-- ID: 6463
-- Item: bowl_of_salt_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- DEX +6
-- VIT +6
-- AGI +6
-- Accuracy +6% (cap 95)
-- Ranged Accuracy +6% (cap 95)
-- Evasion +6% (cap 95)
-- Resist Slow +15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6463)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.AGI, 6)
    target:addMod(dsp.mod.FOOD_ACCP, 6)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 95)
    target:addMod(dsp.mod.FOOD_RACCP, 6)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 95)
    -- target:addMod(dsp.mod.FOOD_EVAP, 6)
    -- target:addMod(dsp.mod.FOOD_EVA_CAP, 95)
    target:addMod(dsp.mod.SLOWRES, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.AGI, 6)
    target:delMod(dsp.mod.FOOD_ACCP, 6)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 95)
    target:delMod(dsp.mod.FOOD_RACCP, 6)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 95)
    -- target:delMod(dsp.mod.FOOD_EVAP, 6)
    -- target:delMod(dsp.mod.FOOD_EVA_CAP, 95)
    target:delMod(dsp.mod.SLOWRES, 15)
end
