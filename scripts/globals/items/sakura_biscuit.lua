-----------------------------------------
-- ID: 6010
-- Item: Sakura Biscuit
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Intelligence 3
-- Charisma 2
-- Evasion +2
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
    target:addStatusEffect(tpz.effect.FOOD,0,0,1800,6010)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.INT, 3)
    target:addMod(tpz.mod.CHR, 2)
    target:addMod(tpz.mod.EVA, 2)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.INT, 3)
    target:delMod(tpz.mod.CHR, 2)
    target:delMod(tpz.mod.EVA, 2)
end
