-----------------------------------------
-- ID: 5552
-- Item: Serving of Black Pudding
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +8
-- MP +5% Cap 25
-- Intelligence +4
-- HP Recovered while healing +1
-- MP Recovered while healing +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5552)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 5)
    target:addMod(dsp.mod.FOOD_MP_CAP, 25)
    target:addMod(dsp.mod.HP, 8)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 5)
    target:delMod(dsp.mod.FOOD_MP_CAP, 25)
    target:delMod(dsp.mod.HP, 8)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
