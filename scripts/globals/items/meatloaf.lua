-----------------------------------------
-- ID: 5689
-- Item: Meatloaf
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Strength 6
-- Agility 2
-- Intelligence -3
-- Attack 18% Cap 90
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5689)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 90)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 90)
end
