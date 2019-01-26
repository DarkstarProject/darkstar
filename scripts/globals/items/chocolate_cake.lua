-----------------------------------------
-- ID: 5633
-- Item: Chocolate Cake
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP +3% (cap 90)
-- HP Recovered while healing +1
-- MP Recovered while healing +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5633)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 3)
    target:addMod(dsp.mod.FOOD_MP_CAP, 90)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 3)
    target:delMod(dsp.mod.FOOD_MP_CAP, 90)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 6)
end
