-----------------------------------------
-- ID: 6462
-- Item: bowl_of_salt_ramen
-- Food Effect: 30Min, All Races
-----------------------------------------
-- DEX +5
-- VIT +5
-- AGI +5
-- Accuracy +5% (cap 90)
-- Ranged Accuracy +5% (cap 90)
-- Evasion +5% (cap 90)
-- Resist Slow +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6462)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 5)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.FOOD_ACCP, 5)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 90)
    target:addMod(dsp.mod.FOOD_RACCP, 5)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 90)
    -- target:addMod(dsp.mod.FOOD_EVAP, 5)
    -- target:addMod(dsp.mod.FOOD_EVA_CAP, 90)
    target:addMod(dsp.mod.SLOWRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 5)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.FOOD_ACCP, 5)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 90)
    target:delMod(dsp.mod.FOOD_RACCP, 5)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 90)
    -- target:delMod(dsp.mod.FOOD_EVAP, 5)
    -- target:delMod(dsp.mod.FOOD_EVA_CAP, 90)
    target:delMod(dsp.mod.SLOWRES, 10)
end
