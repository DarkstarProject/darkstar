-----------------------------------------
-- ID: 4557
-- Item: steamed_catfish
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 30
-- Magic % 1 (cap 110)
-- Dex 3
-- Intelligence 1
-- Mind -3
-- Earth Res 10
-- Ranged Accuracy +6% (cap 15)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4557)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.FOOD_MPP, 1)
    target:addMod(dsp.mod.FOOD_MP_CAP, 110)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.EARTHRES, 10)
    target:addMod(dsp.mod.FOOD_RACCP, 6)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.FOOD_MPP, 1)
    target:delMod(dsp.mod.FOOD_MP_CAP, 110)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.EARTHRES, 10)
    target:delMod(dsp.mod.FOOD_RACCP, 6)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 15)
end
