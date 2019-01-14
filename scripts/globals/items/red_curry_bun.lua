-----------------------------------------
-- ID: 5759
-- Item: red_curry_bun
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- TODO: Group effects
-- Health 25
-- Strength 7
-- Agility 1
-- Intelligence -2
-- Attack % 23 (cap 150)
-- Ranged Atk % 23 (cap 150)
-- Demon Killer 4
-- Resist Sleep +3
-- HP recovered when healing +2
-- MP recovered when healing +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5759)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 23)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_RATTP, 23)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.DEMON_KILLER, 4)
    target:addMod(dsp.mod.SLEEPRES, 3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 23)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_RATTP, 23)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.DEMON_KILLER, 4)
    target:delMod(dsp.mod.SLEEPRES, 3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
end