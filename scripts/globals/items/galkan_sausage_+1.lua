-----------------------------------------
-- ID: 5859
-- Item: galkan_sausage_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 4
-- Intelligence -5
-- Attack 10
-- Ranged Attack 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5859)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.INT, -5)
    target:addMod(dsp.mod.ATT, 10)
    target:addMod(dsp.mod.RATT, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.INT, -5)
    target:delMod(dsp.mod.ATT, 10)
    target:delMod(dsp.mod.RATT, 10)
end
