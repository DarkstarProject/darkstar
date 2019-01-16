-----------------------------------------
-- ID: 5729
-- Item: serving_of_bavarois
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 20
-- Intelligence 3
-- hHP +3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5729)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.HPHEAL, 3)
end
