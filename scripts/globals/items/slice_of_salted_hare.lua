-----------------------------------------
-- ID: 5737
-- Item: slice_of_salted_hare
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 10
-- Strength 1
-- hHP +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5737)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.HPHEAL, 1)
end
