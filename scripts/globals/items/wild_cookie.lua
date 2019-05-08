-----------------------------------------
-- ID: 4577
-- Item: wild_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Aquan killer +12
-- Silence resistance +12
-- MP recovered while healing +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4577)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AQUAN_KILLER, 12)
    target:addMod(dsp.mod.SILENCERES, 12)
    target:addMod(dsp.mod.MPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AQUAN_KILLER, 12)
    target:delMod(dsp.mod.SILENCERES, 12)
    target:delMod(dsp.mod.MPHEAL, 5)
end
