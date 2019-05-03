-----------------------------------------
-- ID: 5635
-- Item: shrimp_cracker
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Vitality 1
-- DEF +10
-- Amorph Killer 10
-- Resist Virus +10
-- HP Recovered While Healing 8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5635)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.DEF, 10)
    target:addMod(dsp.mod.AMORPH_KILLER, 10)
    target:addMod(dsp.mod.VIRUSRES, 10)
    target:addMod(dsp.mod.HPHEAL, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.DEF, 10)
    target:delMod(dsp.mod.AMORPH_KILLER, 10)
    target:delMod(dsp.mod.VIRUSRES, 10)
    target:delMod(dsp.mod.HPHEAL, 8)
end
