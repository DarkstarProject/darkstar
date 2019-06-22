-----------------------------------------
-- ID: 4593
-- Item: Block of Rock Cheese
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 6
-- Health Cap 45
-- HP Recovered while healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4593)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 45)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 45)
    target:delMod(dsp.mod.HPHEAL, 1)
end
