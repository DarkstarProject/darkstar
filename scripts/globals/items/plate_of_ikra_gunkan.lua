-----------------------------------------
-- ID: 5219
-- Item: plate_of_ikra_gunkan
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 30
-- Magic 10
-- Dexterity 3
-- Mind -2
-- Accuracy % 18
-- Accuracy Cap 28
-- Ranged ACC % 18
-- Ranged ACC Cap 28
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5219)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.FOOD_ACCP, 18)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 28)
    target:addMod(dsp.mod.FOOD_RACCP, 18)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 28)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.FOOD_ACCP, 18)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 28)
    target:delMod(dsp.mod.FOOD_RACCP, 18)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 28)
end
