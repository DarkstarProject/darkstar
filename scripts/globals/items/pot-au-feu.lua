-----------------------------------------
-- ID: 5752
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -3
-- Ranged Attk % 15 Cap 60
-- Ranged ACC % 10 Cap 50
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5752)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_RATTP, 15)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 60)
    target:addMod(dsp.mod.FOOD_RACCP, 10)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:addMod(dsp.mod.ENMITY, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_RATTP, 15)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 60)
    target:delMod(dsp.mod.FOOD_RACCP, 10)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:delMod(dsp.mod.ENMITY, -3)
end
