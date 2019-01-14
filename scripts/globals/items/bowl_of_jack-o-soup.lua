-----------------------------------------
-- ID: 4522
-- Item: Bowl of Jack-o'-Soup
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health % 2 (cap 120)
-- Agility 3
-- Vitality -1
-- Health Regen While Healing 5
-- Ranged ACC % 8
-- Ranged ACC Cap 25
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4522)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 2)
    target:addMod(dsp.mod.FOOD_HP_CAP, 120)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.FOOD_RACCP, 8)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 25)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 2)
    target:delMod(dsp.mod.FOOD_HP_CAP, 120)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.FOOD_RACCP, 8)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 25)
end
