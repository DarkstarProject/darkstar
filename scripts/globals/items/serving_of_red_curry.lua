-----------------------------------------
-- ID: 4298
-- Item: serving_of_red_curry
-- Food Effect: 3 hours, All Races
-----------------------------------------
-- HP +25
-- Strength +7
-- Agility +1
-- Intelligence -2
-- HP recovered while healing +2
-- MP recovered while healing +1
-- Attack +23% (Cap: 150@652 Base Attack)
-- Ranged Attack +23% (Cap: 150@652 Base Ranged Attack)
-- Demon Killer +4
-- Resist Sleep +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4298)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.DEMON_KILLER, 4)
    target:addMod(dsp.mod.SLEEPRES, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.DEMON_KILLER, 4)
    target:delMod(dsp.mod.SLEEPRES, 3)
end
