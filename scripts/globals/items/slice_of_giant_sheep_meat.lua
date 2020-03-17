-----------------------------------------
-- ID: 4372
-- Item: slice_of_giant_sheep_meat
-- Food Effect: 5Min, Galka only
-----------------------------------------
-- Strength 2
-- Intelligence -4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= tpz.race.GALKA) then
        result = tpz.msg.basic.CANNOT_EAT
    end
    if (target:getMod(tpz.mod.EAT_RAW_MEAT) == 1) then
        result = 0
    end
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD,0,0,300,4372)
end

function onEffectGain(target,effect)
    target:addMod(tpz.mod.STR, 2)
    target:addMod(tpz.mod.INT, -4)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, 2)
    target:delMod(tpz.mod.INT, -4)
end
