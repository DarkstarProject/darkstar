-----------------------------------------
-- ID: 5610
-- Item: hellsteak_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health 22
-- Strength 7
-- Intelligence -3
-- Health Regen While Healing 2
-- hMP +1
-- Attack % 20 (cap 150)
-- Ranged ATT % 20 (cap 150)
-- Dragon Killer 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5610)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 22)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -3)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:addMod(dsp.mod.DRAGON_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 22)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -3)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 150)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 150)
    target:delMod(dsp.mod.DRAGON_KILLER, 5)
end
