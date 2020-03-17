-----------------------------------------
-- ID: 5680
-- Item: agaricus mushroom
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- STR -4
-- MND +2
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD)) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD,0,0,300,5680)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STR, -4)
    target:addMod(tpz.mod.MND, 2)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, -4)
    target:delMod(tpz.mod.MND, 2)
end
