-----------------------------------------
-- ID: 5634
-- Item: Silken Spirit
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP +4% (cap 90)
-- HP Recovered while healing +2
-- MP Recovered while healing +7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5634)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 4)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 4)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 7)
end
