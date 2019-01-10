-----------------------------------------
-- ID: 5619
-- Item: Bowl of Zesti Zoni
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 12
-- MP 12
-- Strength 2
-- Dexterity 2
-- Vitality 2
-- Agility 2
-- Accuracy +2
-- Ranged Accuracy +2
-- Attack +2
-- Ranged Attack +2
-- Evasion +2
-- MP Recovered while healing 1
-- HP Recovered while healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5619)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.MP, 12)
    target:addMod(dsp.mod.STR, 2)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.ACC, 2)
    target:addMod(dsp.mod.RACC, 2)
    target:addMod(dsp.mod.ATT, 2)
    target:addMod(dsp.mod.RATT, 2)
    target:addMod(dsp.mod.EVA, 2)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.MP, 12)
    target:delMod(dsp.mod.STR, 2)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.ACC, 2)
    target:delMod(dsp.mod.RACC, 2)
    target:delMod(dsp.mod.ATT, 2)
    target:delMod(dsp.mod.RATT, 2)
    target:delMod(dsp.mod.EVA, 2)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
