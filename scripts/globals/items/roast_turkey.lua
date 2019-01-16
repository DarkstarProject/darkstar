-----------------------------------------
-- ID: 5620
-- Item: roast_turkey
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Vitality 4
-- hMP +2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5620)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 4)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.HPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 4)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.HPHEAL, 2)
end
