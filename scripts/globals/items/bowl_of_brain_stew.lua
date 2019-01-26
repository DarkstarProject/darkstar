-----------------------------------------
-- ID: 4542
-- Item: Bowl of Brain Stew
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Dexterity 5
-- Intelligence 5
-- Mind 5
-- Health Regen While Healing 3
-- Magic Regen While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4542)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 5)
    target:addMod(dsp.mod.INT, 5)
    target:addMod(dsp.mod.MND, 5)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 5)
    target:delMod(dsp.mod.INT, 5)
    target:delMod(dsp.mod.MND, 5)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.MPHEAL, 3)
end
