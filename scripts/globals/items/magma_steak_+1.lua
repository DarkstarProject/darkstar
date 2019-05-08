-----------------------------------------
-- ID: 6072
-- Item: Magma Steak +1
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- Strength +9
-- Attack +24% Cap 185
-- Ranged Attack +24% Cap 185
-- Vermin Killer +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,6072)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.STR, 9)
    target:addMod(dsp.mod.FOOD_ATTP, 24)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 185)
    target:addMod(dsp.mod.FOOD_RATTP, 24)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 185)
    target:addMod(dsp.mod.VERMIN_KILLER, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 9)
    target:delMod(dsp.mod.FOOD_ATTP, 24)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 185)
    target:delMod(dsp.mod.FOOD_RATTP, 24)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 185)
    target:delMod(dsp.mod.VERMIN_KILLER, 6)
end
