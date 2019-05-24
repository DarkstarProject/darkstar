-----------------------------------------
-- ID: 4295
-- Item: plate_of_royal_sautee
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Attack +22% (cap 80)
-- Ranged Attack +22% (cap 80)
-- Stun Resist +4
-- HP recovered while healing +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4295)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:addMod(dsp.mod.STUNRES, 4)
    target:addMod(dsp.mod.HPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 80)
    target:delMod(dsp.mod.STUNRES, 4)
    target:delMod(dsp.mod.HPHEAL, 1)
end
