-----------------------------------------
-- ID: 4511
-- Item: Bowl of Ambrosia
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +7
-- MP +7
-- STR +7
-- DEX +7
-- VIT +7
-- AGI +7
-- INT +7
-- MND +7
-- CHR +7
-- Accuracy +7
-- Ranged Accuracy +7
-- Attack +7
-- Ranged Attack +7
-- Evasion +7
-- Defense +7
-- HP recovered while healing +7
-- MP recovered while healing +7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4511)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 7)
    target:addMod(dsp.mod.MP, 7)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.DEX, 7)
    target:addMod(dsp.mod.VIT, 7)
    target:addMod(dsp.mod.AGI, 7)
    target:addMod(dsp.mod.INT, 7)
    target:addMod(dsp.mod.MND, 7)
    target:addMod(dsp.mod.CHR, 7)
    target:addMod(dsp.mod.ATT, 7)
    target:addMod(dsp.mod.RATT, 7)
    target:addMod(dsp.mod.ACC, 7)
    target:addMod(dsp.mod.RACC, 7)
    target:addMod(dsp.mod.HPHEAL, 7)
    target:addMod(dsp.mod.MPHEAL, 7)
    target:addMod(dsp.mod.DEF, 7)
    target:addMod(dsp.mod.EVA, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 7)
    target:delMod(dsp.mod.MP, 7)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.DEX, 7)
    target:delMod(dsp.mod.VIT, 7)
    target:delMod(dsp.mod.AGI, 7)
    target:delMod(dsp.mod.INT, 7)
    target:delMod(dsp.mod.MND, 7)
    target:delMod(dsp.mod.CHR, 7)
    target:delMod(dsp.mod.ATT, 7)
    target:delMod(dsp.mod.RATT, 7)
    target:delMod(dsp.mod.ACC, 7)
    target:delMod(dsp.mod.RACC, 7)
    target:delMod(dsp.mod.HPHEAL, 7)
    target:delMod(dsp.mod.MPHEAL, 7)
    target:delMod(dsp.mod.DEF, 7)
    target:delMod(dsp.mod.EVA, 7)
end
