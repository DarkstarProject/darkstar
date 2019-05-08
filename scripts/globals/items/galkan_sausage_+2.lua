-----------------------------------------
-- ID: 5860
-- Item: galkan_sausage_+2
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 5
-- Intelligence -6
-- Attack 11
-- Ranged Attack 11
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5860)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.INT, -6)
    target:addMod(dsp.mod.ATT, 11)
    target:addMod(dsp.mod.RATT, 11)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.INT, -6)
    target:delMod(dsp.mod.ATT, 11)
    target:delMod(dsp.mod.RATT, 11)
end
