-----------------------------------------
-- ID: 4581
-- Item: Blackened Newt
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 18
-- Attack Cap 60
-- Virus Resist 4
-- Curse Resist 4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD,0,0,10800,4581)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DEX, 4)
    target:addMod(tpz.mod.MND, -3)
    target:addMod(tpz.mod.FOOD_ATTP, 18)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 60)
    target:addMod(tpz.mod.VIRUSRES, 4)
    target:addMod(tpz.mod.CURSERES, 4)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DEX, 4)
    target:delMod(tpz.mod.MND, -3)
    target:delMod(tpz.mod.FOOD_ATTP, 18)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 60)
    target:delMod(tpz.mod.VIRUSRES, 4)
    target:delMod(tpz.mod.CURSERES, 4)
end
