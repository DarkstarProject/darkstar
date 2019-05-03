-----------------------------------------
-- ID: 5588
-- Item: serving_of_karni_yarik
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Agility 3
-- Vitality -1
-- Attack % 20 (cap 65)
-- Ranged Attack % 20 (cap 65)
-- Evasion +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5588)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:addMod(dsp.mod.EVA, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 65)
    target:delMod(dsp.mod.EVA, 6)
end
