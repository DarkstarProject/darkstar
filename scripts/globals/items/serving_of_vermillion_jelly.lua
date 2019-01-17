-----------------------------------------
-- ID: 5158
-- Item: Vermillion Jelly
-- Food Effect: 4 hours, All Races
-----------------------------------------
-- MP +12%(Cap: 90@750 Base MP)
-- Intelligence +6
-- MP Recovered While Healing +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5158)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 12)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
    target:addMod(dsp.mod.INT, 6)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP,12)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
    target:delMod(dsp.mod.INT, 6)
    target:delMod(dsp.mod.MPHEAL, 2)
end
