-----------------------------------------
-- ID: 4285
-- Item: bowl_of_ocean_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP +5% (cap 150)
-- MP +5
-- DEX +4
-- Attack +14% (cap 90)
-- Ranged Attack +14% (cap 90)
-- HP recovered while healing +9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4285)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 5)
    target:addMod(dsp.mod.FOOD_HP_CAP, 150)
    target:addMod(dsp.mod.MP, 5)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.HPHEAL, 9)
    target:addMod(dsp.mod.FOOD_ATTP, 14)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:addMod(dsp.mod.FOOD_RATTP, 14)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 90)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 5)
    target:delMod(dsp.mod.FOOD_HP_CAP, 150)
    target:delMod(dsp.mod.MP, 5)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.HPHEAL, 9)
    target:delMod(dsp.mod.FOOD_ATTP, 14)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 90)
    target:delMod(dsp.mod.FOOD_RATTP, 14)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 90)
end
