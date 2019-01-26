-----------------------------------------
-- ID: 5556
-- Item: cone_of_seraphs_kiss
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- HP 15
-- MP % 16 (cap 85)
-- MP Recovered While Healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5556)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 15)
    target:addMod(dsp.mod.FOOD_MPP, 16)
    target:addMod(dsp.mod.FOOD_MP_CAP, 85)
    target:addMod(dsp.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 15)
    target:delMod(dsp.mod.FOOD_MPP, 16)
    target:delMod(dsp.mod.FOOD_MP_CAP, 85)
    target:delMod(dsp.mod.MPHEAL, 2)
end
