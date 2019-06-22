-----------------------------------------
-- ID: 5745
-- Item: serving_of_cherry_bavarois
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 25
-- Intelligence 3
-- MP 10
-- HP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5745)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 25)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.MP, 10)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 25)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.MP, 10)
    target:delMod(dsp.mod.HPHEAL, 3)
end
