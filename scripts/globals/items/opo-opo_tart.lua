-----------------------------------------
-- ID: 4287
-- Item: opo-opo_tart
-- Food Effect: 1hour, All Races
-----------------------------------------
-- HP 12
-- MP 12
-- Intelligence 4
-- MP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4287)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.MP, 12)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.MP, 12)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MPHEAL, 3)
end
