-----------------------------------------
-- ID: 5662
-- Item: Dragon Fruit
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- Intelligence 4
-- Agility -6
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
    target:addStatusEffect(tpz.effect.FOOD,0,0,300,5662)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.INT, 4)
    target:addMod(tpz.mod.AGI, -6)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.INT, 4)
    target:delMod(tpz.mod.AGI, -6)
end
