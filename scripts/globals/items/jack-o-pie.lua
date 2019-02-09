-----------------------------------------
-- ID: 5644
-- Item: jack-o-pie
-- Food Effect: 1hour, All Races
-----------------------------------------
-- MP 45
-- CHR -1
-- Intelligence 4
-- hMP +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5644)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 45)
    target:addMod(dsp.mod.CHR, -1)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MPHEAL, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 45)
    target:delMod(dsp.mod.CHR, -1)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MPHEAL, 1)
end
