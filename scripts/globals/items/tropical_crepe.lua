-----------------------------------------
-- ID: 6567
-- Item: Tropical Crepe
-- Food Effect: 30 minutes, all Races
-----------------------------------------
-- INT +2
-- MND +2
-- Magic Accuracy +20% (Max. 90)
-- "Magic Def. Bonus" +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6567)
end
function onEffectGain(target,effect)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.MND, 2)
    target:addMod(dsp.mod.FOOD_MACCP, 20)
    target:addMod(dsp.mod.FOOD_MACC_CAP, 90)
    target:addMod(dsp.mod.MDEF, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.MND, 2)
    target:delMod(dsp.mod.FOOD_MACCP, 20)
    target:delMod(dsp.mod.FOOD_MACC_CAP, 90)
    target:delMod(dsp.mod.MDEF, 1)
end
