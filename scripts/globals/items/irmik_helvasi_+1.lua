-----------------------------------------
-- ID: 5573
-- Item: irmik_helvasi_+1
-- Food Effect: 4 hours, All Races
-----------------------------------------
-- HP +10% (cap 100)
-- MP +3% (cap 15)
-- INT +2
-- hHP +1
-- hMP +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5573)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 100)
    target:addMod(dsp.mod.FOOD_MPP, 3)
    target:addMod(dsp.mod.FOOD_MP_CAP, 15)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 100)
    target:delMod(dsp.mod.FOOD_MPP, 3)
    target:delMod(dsp.mod.FOOD_MP_CAP, 15)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
