-----------------------------------------
-- ID: 5681
-- Item: cupid_chocolate
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Accuracy +10
-- Ranged Accuracy +10
-- Attack 10
-- Ranged Attack 10
-- Store TP +25
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5681)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATT, 10)
    target:addMod(dsp.mod.RATT, 10)
    target:addMod(dsp.mod.ACC, 10)
    target:addMod(dsp.mod.RACC, 10)
    target:addMod(dsp.mod.STORETP, 25)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.ATT, 10)
    target:delMod(dsp.mod.RATT, 10)
    target:delMod(dsp.mod.ACC, 10)
    target:delMod(dsp.mod.RACC, 10)
    target:delMod(dsp.mod.STORETP, 25)
end
