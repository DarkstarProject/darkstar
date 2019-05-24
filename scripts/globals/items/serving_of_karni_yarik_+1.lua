-----------------------------------------
-- ID: 5589
-- Item: serving_of_karni_yarik_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Agility 4
-- Vitality -2
-- Attack % 22 (cap 70)
-- Ranged Attack % 22 (cap 70)
-- Evasion +7
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5589)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.VIT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 70)
    target:addMod(dsp.mod.EVA, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.VIT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 70)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 70)
    target:delMod(dsp.mod.EVA, 7)
end
