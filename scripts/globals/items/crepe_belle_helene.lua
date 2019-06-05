-----------------------------------------
-- ID: 5778
-- Item: Crepe Belle Helene
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Intelligence +2
-- MP Healing +3
-- Magic Accuracy +21% (cap 50)
-- Magic Defense +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5778)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.INT, 2)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.FOOD_MACCP, 21)
    target:addMod(dsp.mod.FOOD_MACC_CAP, 50)
    target:addMod(dsp.mod.MDEF, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 2)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.FOOD_MACCP, 21)
    target:delMod(dsp.mod.FOOD_MACC_CAP, 50)
    target:delMod(dsp.mod.MDEF, 1)
end
