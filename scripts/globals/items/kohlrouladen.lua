-----------------------------------------
-- ID: 5760
-- Item: kohlrouladen
-- Food Effect: 3hr, All Races
-----------------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -5
-- RACC +8% (cap 60)
-- RATT +14% (cap 65)
-- Enmity -4
-- Subtle Blow +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5760)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.INT, -5)
    target:addMod(dsp.mod.FOOD_RACCP, 8)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 60)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:addMod(dsp.mod.ENMITY, -4)
    target:addMod(dsp.mod.SUBTLE_BLOW, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.INT, -5)
    target:delMod(dsp.mod.FOOD_RACCP, 8)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 60)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:delMod(dsp.mod.ENMITY, -4)
    target:delMod(dsp.mod.SUBTLE_BLOW, 5)
end
