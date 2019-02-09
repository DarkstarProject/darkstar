-----------------------------------------
-- ID: 5753
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -3
-- Ranged Attk % 16 Cap 65
-- Ranged ACC % 11 Cap 55
-- Enmity -3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5753)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_RATTP, 16)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:addMod(dsp.mod.FOOD_RACCP, 11)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 55)
    target:addMod(dsp.mod.ENMITY, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_RATTP, 16)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:delMod(dsp.mod.FOOD_RACCP, 11)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 55)
    target:delMod(dsp.mod.ENMITY, -3)
end
