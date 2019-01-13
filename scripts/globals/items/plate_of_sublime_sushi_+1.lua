-----------------------------------------
-- ID: 6469
-- Item: plate_of_sublime_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +45
-- MP +25
-- STR +7
-- DEX +8
-- MND -4
-- CHR +7
-- Accuracy +11% (cap 105)
-- Ranged Accuracy +11% (cap 105)
-- Resist Sleep +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6469)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 45)
    target:addMod(dsp.mod.MP, 25)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.DEX, 8)
    target:addMod(dsp.mod.MND, -4)
    target:addMod(dsp.mod.CHR, 7)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 105)
    target:addMod(dsp.mod.FOOD_RACCP, 11)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 105)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 45)
    target:delMod(dsp.mod.MP, 25)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.DEX, 8)
    target:delMod(dsp.mod.MND, -4)
    target:delMod(dsp.mod.CHR, 7)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 105)
    target:delMod(dsp.mod.FOOD_RACCP, 11)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 105)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
