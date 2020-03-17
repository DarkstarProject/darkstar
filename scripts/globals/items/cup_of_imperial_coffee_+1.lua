-----------------------------------------
-- ID: 5593
-- Item: cup_of_imperial_coffee_+1
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health Regen While Healing 5
-- Magic Regen While Healing 5
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
    target:addStatusEffect(tpz.effect.FOOD,0,0,10800,5593)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HPHEAL, 5)
    target:addMod(tpz.mod.MPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HPHEAL, 5)
    target:delMod(tpz.mod.MPHEAL, 5)
end
