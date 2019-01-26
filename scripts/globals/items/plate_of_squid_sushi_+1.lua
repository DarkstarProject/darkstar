-----------------------------------------
-- ID: 5162
-- Item: plate_of_squid_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 30
-- Dexterity 6
-- Agility 5
-- Accuracy % 16
-- Ranged ACC % 16
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5162)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.FOOD_ACCP, 16)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 76)
    target:addMod(dsp.mod.FOOD_RACCP, 16)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 76)
    target:addMod(dsp.mod.SLEEPRES, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.FOOD_ACCP, 16)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 76)
    target:delMod(dsp.mod.FOOD_RACCP, 16)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 76)
    target:delMod(dsp.mod.SLEEPRES, 2)
end
