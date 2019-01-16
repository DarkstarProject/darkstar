-----------------------------------------
-- ID: 5636
-- Item: shrimp_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Vitality 2
-- Defense +10
-- Amorph Killer 12
-- Resist Virus 12
-- HP Recovered While Healing 9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5636)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.DEF, 10)
    target:addMod(dsp.mod.AMORPH_KILLER, 12)
    target:addMod(dsp.mod.VIRUSRES, 12)
    target:addMod(dsp.mod.HPHEAL, 9)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.DEF, 10)
    target:delMod(dsp.mod.AMORPH_KILLER, 12)
    target:delMod(dsp.mod.VIRUSRES, 12)
    target:delMod(dsp.mod.HPHEAL, 9)
end
