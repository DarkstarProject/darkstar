-----------------------------------------
-- ID: 4468
-- Item: Bunch of Pamamas
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength -3
-- Intelligence 1
-- Additional Effect with Opo-Opo Crown
-- HP 50
-- MP 50
-- CHR 14
-- Additional Effect with Kinkobo or
-- Primate Staff
-- DELAY -90
-- ACC 10
-- Additional Effect with Primate Staff +1
-- DELAY -80
-- ACC 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4468)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, -3)
    target:addMod(dsp.mod.INT, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, -3)
    target:delMod(dsp.mod.INT, 1)
end
