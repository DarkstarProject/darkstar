-----------------------------------------
-- ID: 4488
-- Item: jack-o-lantern
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Charisma -10
-- Accuracy 10
-- Ranged Acc 10
-- Evasion 10
-- Arcana Killer 4
-- Dark Res 25
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4488)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.CHR, -10)
    target:addMod(dsp.mod.ACC, 10)
    target:addMod(dsp.mod.RACC, 10)
    target:addMod(dsp.mod.EVA, 10)
    target:addMod(dsp.mod.ARCANA_KILLER, 4)
    target:addMod(dsp.mod.DARKRES, 25)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.CHR, -10)
    target:delMod(dsp.mod.ACC, 10)
    target:delMod(dsp.mod.RACC, 10)
    target:delMod(dsp.mod.EVA, 10)
    target:delMod(dsp.mod.ARCANA_KILLER, 4)
    target:delMod(dsp.mod.DARKRES, 25)
end
