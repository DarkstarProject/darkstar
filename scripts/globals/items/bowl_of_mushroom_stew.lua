-----------------------------------------
-- ID: 4544
-- Item: mushroom_stew
-- Food Effect: 3hours, All Races
-----------------------------------------
-- Magic Points 40
-- Strength -1
-- Mind 4
-- MP Recovered While Healing 4
-- Enmity -4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4544)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 40)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.MND, 4)
    target:addMod(dsp.mod.MPHEAL, 4)
    target:addMod(dsp.mod.ENMITY, -4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 40)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.MND, 4)
    target:delMod(dsp.mod.MPHEAL, 4)
    target:delMod(dsp.mod.ENMITY, -4)
end
