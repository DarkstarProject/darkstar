-----------------------------------------
-- ID: 5595
-- Item: Bowl of Nashmau Stew
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP -100
-- Vitality -10
-- Agility -10
-- Intelligence -10
-- Mind -10
-- Charisma -10
-- Accuracy +15% Cap 25
-- Attack +18% Cap 60
-- Defense -100
-- Evasion -100
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5595)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, -100)
    target:addMod(dsp.mod.VIT, -10)
    target:addMod(dsp.mod.AGI, -10)
    target:addMod(dsp.mod.INT, -10)
    target:addMod(dsp.mod.MND, -10)
    target:addMod(dsp.mod.CHR, -10)
    target:addMod(dsp.mod.FOOD_ACCP, 15)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 25)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 60)
    target:addMod(dsp.mod.DEF, -100)
    target:addMod(dsp.mod.EVA, -100)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, -100)
    target:delMod(dsp.mod.VIT, -10)
    target:delMod(dsp.mod.AGI, -10)
    target:delMod(dsp.mod.INT, -10)
    target:delMod(dsp.mod.MND, -10)
    target:delMod(dsp.mod.CHR, -10)
    target:delMod(dsp.mod.FOOD_ACCP, 15)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 25)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 60)
    target:delMod(dsp.mod.DEF, -100)
    target:delMod(dsp.mod.EVA, -100)
end
