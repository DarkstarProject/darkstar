-----------------------------------------
-- ID: 5647
-- Item: Lik Kabob
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -2
-- Accuracy +1
-- Attack 7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5647)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.ACC, 1)
    target:addMod(dsp.mod.ATT, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.ACC, 1)
    target:delMod(dsp.mod.ATT, 7)
end
