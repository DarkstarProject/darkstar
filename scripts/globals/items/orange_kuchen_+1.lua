-----------------------------------------
-- ID: 4332
-- Item: orange_kuchen_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP % 13 (cap 80)
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4332)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 13)
    target:addMod(dsp.mod.FOOD_MP_CAP, 80)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 13)
    target:delMod(dsp.mod.FOOD_MP_CAP, 80)
    target:delMod(dsp.mod.MPHEAL, 1)
end
