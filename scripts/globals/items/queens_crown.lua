-----------------------------------------
-- ID: 6064
-- Item: queens_crown
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- MP+6% (Upper limit 55)
-- INT+4
-- MND+3
-- CHR+2
-- STR-2
-- MACC+4
-- MAB+7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,6064)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 6)
    target:addMod(dsp.mod.FOOD_MP_CAP, 55)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MND, 3)
    target:addMod(dsp.mod.CHR, 2)
    target:addMod(dsp.mod.STR, -2)
    target:addMod(dsp.mod.MACC, 4)
    target:addMod(dsp.mod.MATT, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 6)
    target:delMod(dsp.mod.FOOD_MP_CAP, 55)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MND, 3)
    target:delMod(dsp.mod.CHR, 2)
    target:delMod(dsp.mod.STR, -2)
    target:delMod(dsp.mod.MACC, 4)
    target:delMod(dsp.mod.MATT, 7)
end
