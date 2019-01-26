-----------------------------------------
-- ID: 4452
-- Item: bowl_of_shark_fin_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP % 5 (cap 150)
-- MP 5
-- Dexterity 4
-- HP Recovered While Healing 9
-- Attack % 14 (cap 85)
-- Ranged Attack % 14 (cap 85)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4452)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 5)
    target:addMod(dsp.mod.FOOD_HP_CAP, 150)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MP, 5)
    target:addMod(dsp.mod.HPHEAL, 9)
    target:addMod(dsp.mod.FOOD_ATTP, 14)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 85)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 5)
    target:delMod(dsp.mod.FOOD_HP_CAP, 150)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MP, 5)
    target:delMod(dsp.mod.HPHEAL, 9)
    target:delMod(dsp.mod.FOOD_ATTP, 14)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 85)
end
