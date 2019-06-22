-----------------------------------------
-- ID: 4552
-- Item: serving_of_herb_crawler_eggs
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 6
-- Health Cap 80
-- Magic 10
-- Agility 3
-- Vitality -1
-- Evasion 8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4552)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 6)
    target:addMod(dsp.mod.FOOD_HP_CAP, 80)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.EVA, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6)
    target:delMod(dsp.mod.FOOD_HP_CAP, 80)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.EVA, 8)
end
