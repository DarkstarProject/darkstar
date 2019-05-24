-----------------------------------------
-- ID: 6063
-- Item: fruit_parfait
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- MP+5% (Upper limit 50)
-- INT+3
-- MND+2
-- CHR+1
-- STR-3
-- MACC+3
-- MAB+6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6063)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 5)
    target:addMod(dsp.mod.FOOD_MP_CAP, 50)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.CHR, 1)
    target:addMod(dsp.mod.STR, -3)
    target:addMod(dsp.mod.MACC, 3)
    target:addMod(dsp.mod.MATT, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 5)
    target:delMod(dsp.mod.FOOD_MP_CAP, 50)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.CHR, 1)
    target:delMod(dsp.mod.STR, -3)
    target:delMod(dsp.mod.MACC, 3)
    target:delMod(dsp.mod.MATT, 6)
end
