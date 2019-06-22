-----------------------------------------
-- ID: 4420
-- Item: bowl_of_tomato_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Agility 3
-- Vitality -1
-- HP Recovered While Healing 5
-- Ranged Accuracy % 9 (cap 15)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4420)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.HPHEAL, 5)
    target:addMod(dsp.mod.FOOD_RACCP, 9)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.HPHEAL, 5)
    target:delMod(dsp.mod.FOOD_RACCP, 9)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 15)
end
