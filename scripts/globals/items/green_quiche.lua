-----------------------------------------
-- ID: 5170
-- Item: green_quiche
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 10
-- Agility 1
-- Vitality -1
-- Ranged ACC % 7
-- Ranged ACC Cap 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5170)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.FOOD_RACCP, 7)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.FOOD_RACCP, 7)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 15)
end
