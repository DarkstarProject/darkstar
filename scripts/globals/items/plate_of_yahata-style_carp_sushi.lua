-----------------------------------------
-- ID: 5186
-- Item: plate_of_yahata-style_carp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 2
-- Accuracy % 11 (cap 56)
-- HP Recovered While Healing 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5186)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 2)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 56)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 2)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 56)
    target:delMod(dsp.mod.HPHEAL, 2)
end
