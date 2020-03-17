-----------------------------------------
-- ID: 5590
-- Item: Balik Sandvici
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Agility 1
-- Intelligence 3
-- Mind -2
-- Ranged ACC 5
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
    target:addStatusEffect(tpz.effect.FOOD,0,0,1800,5590)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DEX, 3)
    target:addMod(tpz.mod.AGI, 1)
    target:addMod(tpz.mod.INT, 3)
    target:addMod(tpz.mod.MND, -2)
    target:addMod(tpz.mod.RACC, 5)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DEX, 3)
    target:delMod(tpz.mod.AGI, 1)
    target:delMod(tpz.mod.INT, 3)
    target:delMod(tpz.mod.MND, -2)
    target:delMod(tpz.mod.RACC, 5)
end
