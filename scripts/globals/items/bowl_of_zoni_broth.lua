-----------------------------------------
-- ID: 5618
-- Item: bowl_of_zoni_broth
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 10
-- MP 10
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Accuracy +1
-- Ranged Accuracy +1
-- Attack +1
-- Ranged Attack +1
-- Evasion +1
-- HP Recovered While Healing 1
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5618)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.ACC, 1)
    target:addMod(dsp.mod.RACC, 1)
    target:addMod(dsp.mod.ATT, 1)
    target:addMod(dsp.mod.RATT, 1)
    target:addMod(dsp.mod.EVA, 1)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.ACC, 1)
    target:delMod(dsp.mod.RACC, 1)
    target:delMod(dsp.mod.ATT, 1)
    target:delMod(dsp.mod.RATT, 1)
    target:delMod(dsp.mod.EVA, 1)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
end
