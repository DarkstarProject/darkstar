-----------------------------------------
-- ID: 4271
-- Item: rice_dumpling
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- HP 17
-- Strength 3
-- Vitality 2
-- Agility 1
-- Attack 20% (caps @ 45)
-- Ranged Attack 30% (caps @ 45)
-- HP Regeneration While Healing 2
-- MP Regeneration While Healing 2
-- Accuracy 5
-- Resist Paralyze +4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4271)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 17)
    target:addMod(dsp.mod.STR, 3)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 45)
    target:addMod(dsp.mod.FOOD_RATTP, 30)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 45)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.ACC, 5)
    target:addMod(dsp.mod.PARALYZERES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 17)
    target:delMod(dsp.mod.STR, 3)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 45)
    target:delMod(dsp.mod.FOOD_RATTP, 30)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 45)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.ACC, 5)
    target:delMod(dsp.mod.PARALYZERES, 4)
end
