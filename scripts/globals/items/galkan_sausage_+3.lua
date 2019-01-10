-----------------------------------------
-- ID: 5861
-- Item: galkan_sausage_+3
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 6
-- Intelligence -7
-- Attack 12
-- Ranged Attack 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5861)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.INT, -7)
    target:addMod(dsp.mod.ATT, 12)
    target:addMod(dsp.mod.RATT, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.INT, -7)
    target:delMod(dsp.mod.ATT, 12)
    target:delMod(dsp.mod.RATT, 12)
end
