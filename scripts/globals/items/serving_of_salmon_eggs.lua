-----------------------------------------
-- ID: 5217
-- Item: serving_of_salmon_eggs
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 6
-- Magic 6
-- Dexterity 2
-- Mind -3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5217)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 6)
    target:addMod(dsp.mod.MP, 6)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.MND, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 6)
    target:delMod(dsp.mod.MP, 6)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.MND, -3)
end
