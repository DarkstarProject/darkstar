-----------------------------------------
-- ID: 5617
-- Item: lebkuchen_manse
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +10
-- MP +10% (cap 55)
-- INT +4
-- hHP +3
-- hMP +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5617)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.FOOD_MPP, 10)
    target:addMod(dsp.mod.FOOD_MP_CAP, 55)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.FOOD_MPP, 10)
    target:delMod(dsp.mod.FOOD_MP_CAP, 55)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.MPHEAL, 2)
end
