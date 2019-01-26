-----------------------------------------
-- ID: 4329
-- Item: serving_of_newt_flambe
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 18
-- Attack Cap 65
-- Virus Resist 4
-- Curse Resist 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4329)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.FOOD_ATTP, 18)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:addMod(dsp.mod.VIRUSRES, 4)
    target:addMod(dsp.mod.CURSERES, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.FOOD_ATTP, 18)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 65)
    target:delMod(dsp.mod.VIRUSRES, 4)
    target:delMod(dsp.mod.CURSERES, 4)
end
