-----------------------------------------
-- ID: 5630
-- Item: Silken Squeeze
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP Recovered while healing +4
-- MP Recovered while healing +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5630)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HPHEAL, 4)
    target:addMod(dsp.mod.MPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 4)
    target:delMod(dsp.mod.MPHEAL, 5)
end
