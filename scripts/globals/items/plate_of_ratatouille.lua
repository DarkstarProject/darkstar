-----------------------------------------
-- ID: 5731
-- Item: plate_of_ratatouille
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Agility 5
-- Evasion 5
-- HP recovered while healing 2
-- MP recovered while healing 2
-- Undead Killer 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5731)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 5)
    target:addMod(dsp.mod.EVA, 5)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.MPHEAL, 2)
    target:addMod(dsp.mod.UNDEAD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 5)
    target:delMod(dsp.mod.EVA, 5)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.MPHEAL, 2)
    target:delMod(dsp.mod.UNDEAD_KILLER, 5)
end
