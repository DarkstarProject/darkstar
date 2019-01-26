-----------------------------------------
-- ID: 5652
-- Item: plate_of_anchovies
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Dexterity 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5652)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.MND, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.MND, -3)
end
