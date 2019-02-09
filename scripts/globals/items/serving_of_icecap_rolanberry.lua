-----------------------------------------
-- ID: 4556
-- Item: serving_of_icecap_rolanberry
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic % 19
-- Magic Cap 55
-- Intelligence 2
-- Wind Res 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4556)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_MPP, 19)
    target:addMod(dsp.mod.FOOD_MP_CAP, 55)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.WINDRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 19)
    target:delMod(dsp.mod.FOOD_MP_CAP, 55)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.WINDRES, 5)
end
