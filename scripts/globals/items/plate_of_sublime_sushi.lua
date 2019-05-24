-----------------------------------------
-- ID: 6468
-- Item: plate_of_sublime_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +40
-- MP +20
-- STR +6
-- DEX +7
-- MND -3
-- CHR +6
-- Accuracy +10% (cap 100)
-- Ranged Accuracy +10% (cap 100)
-- Resist Sleep +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6468)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.DEX, 7)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.CHR, 6)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 100)
    target:addMod(dsp.mod.FOOD_RACCP, 10)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 100)
    target:addMod(dsp.mod.SLEEPRES, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.DEX, 7)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.CHR, 6)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 100)
    target:delMod(dsp.mod.FOOD_RACCP, 10)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 100)
    target:delMod(dsp.mod.SLEEPRES, 1)
end
