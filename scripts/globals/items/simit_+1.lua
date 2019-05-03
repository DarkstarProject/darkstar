-----------------------------------------
-- ID: 5597
-- Item: simit_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 18
-- Vitality 4
-- Defense 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5597)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 18)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.DEF, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 18)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.DEF, 2)
end