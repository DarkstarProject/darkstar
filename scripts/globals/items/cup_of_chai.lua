-----------------------------------------
-- ID: 5570
-- Item: cup_of_chai
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Vitality -2
-- Charisma 2
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
    target:addStatusEffect(tpz.effect.FOOD,0,0,10800,5570)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.VIT, -2)
    target:addMod(tpz.mod.CHR, 2)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.VIT, -2)
    target:delMod(tpz.mod.CHR, 2)
end
