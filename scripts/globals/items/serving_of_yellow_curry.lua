-----------------------------------------
-- ID: 4517
-- Item: serving_of_yellow_curry
-- Food Effect: 3hours, All Races
-----------------------------------------
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- HP Recovered While Healing 2
-- MP Recovered While Healing 1
-- Attack 21% (caps @ 75)
-- Ranged Attack 21% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4

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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4517)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.INT, -4)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 21)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:addMod(dsp.mod.FOOD_RATTP, 21)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 75)
    target:addMod(dsp.mod.SLEEPRES, 3)
    target:addMod(dsp.mod.STUNRES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.INT, -4)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 21)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:delMod(dsp.mod.FOOD_RATTP, 21)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 75)
    target:delMod(dsp.mod.SLEEPRES, 3)
    target:delMod(dsp.mod.STUNRES, 4)
end
