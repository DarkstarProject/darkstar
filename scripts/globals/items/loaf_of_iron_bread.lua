-----------------------------------------
-- ID: 4499
-- Item: loaf_of_iron_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 4
-- Vitality 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4499)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 4)
    target:addMod(dsp.mod.VIT, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 4)
    target:delMod(dsp.mod.VIT, 1)
end
