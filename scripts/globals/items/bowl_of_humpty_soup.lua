-----------------------------------------
-- ID: 4521
-- Item: Bowl of Humpty Soup
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health % 6
-- Health Cap 35
-- Magic 5
-- Health Regen While Healing 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4521)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 35)
    target:addMod(dsp.mod.MP, 5)
    target:addMod(dsp.mod.HPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 35)
    target:delMod(dsp.mod.MP, 5)
    target:delMod(dsp.mod.HPHEAL, 5)
end
