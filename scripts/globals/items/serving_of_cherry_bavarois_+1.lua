-----------------------------------------
-- ID: 5746
-- Item: serving_of_cherry_bavarois_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 30
-- Intelligence 4
-- MP 15
-- HP Recovered While Healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5746)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.INT, 4)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.HPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.INT, 4)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.HPHEAL, 4)
end
