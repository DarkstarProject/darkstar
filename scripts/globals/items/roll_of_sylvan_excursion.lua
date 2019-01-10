-----------------------------------------
-- ID: 5551
-- Item: Roll of Sylvan Excursion
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10
-- MP +3% Cap 15
-- Intelligence +3
-- HP Recovered while healing +2
-- MP Recovered while healing +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5551)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 3)
    target:addMod(dsp.mod.FOOD_MP_CAP, 15)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 3)
    target:delMod(dsp.mod.FOOD_MP_CAP, 15)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 5)
end
