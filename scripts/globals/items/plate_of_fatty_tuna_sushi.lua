-----------------------------------------
-- ID: 5153
-- Item: plate_of_fatty_tuna_sushi
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 20
-- Dexterity 3
-- Charisma 5
-- Accuracy % 16 (cap 76)
-- Ranged ACC 16 (cap 76)
-- Sleep Resist 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5153)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.CHR, 5)
    target:addMod(dsp.mod.FOOD_ACCP, 16)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 76)
    target:addMod(dsp.mod.FOOD_RACCP, 16)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 76)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.CHR, 5)
    target:delMod(dsp.mod.FOOD_ACCP, 16)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 76)
    target:delMod(dsp.mod.FOOD_RACCP, 16)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 76)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
