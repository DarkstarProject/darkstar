-----------------------------------------
-- ID: 5761
-- Item: kohlrouladen
-- Food Effect: 4hr, All Races
-----------------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -4
-- RACC +10% (cap 65)
-- RATT +16% (cap 70)
-- Enmity -5
-- Subtle Blow +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5761)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.INT, -4)
    target:addMod(dsp.mod.FOOD_RACCP, 10)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 65)
    target:addMod(dsp.mod.FOOD_RATTP, 16)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 70)
    target:addMod(dsp.mod.ENMITY, -5)
    target:addMod(dsp.mod.SUBTLE_BLOW, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.INT, -4)
    target:delMod(dsp.mod.FOOD_RACCP, 10)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 65)
    target:delMod(dsp.mod.FOOD_RATTP, 16)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 70)
    target:delMod(dsp.mod.ENMITY, -5)
    target:delMod(dsp.mod.SUBTLE_BLOW, 6)
end
