-----------------------------------------
-- ID: 5732
-- Item: plate_of_ratatouille_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Agility 6
-- Evasion 10
-- HP recovered while healing 3
-- MP recovered while healing 3
-- Undead Killer 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5732)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 6)
    target:addMod(dsp.mod.EVA, 10)
    target:addMod(dsp.mod.HPHEAL, 3)
    target:addMod(dsp.mod.MPHEAL, 3)
    target:addMod(dsp.mod.UNDEAD_KILLER, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 6)
    target:delMod(dsp.mod.EVA, 10)
    target:delMod(dsp.mod.HPHEAL, 3)
    target:delMod(dsp.mod.MPHEAL, 3)
    target:delMod(dsp.mod.UNDEAD_KILLER, 10)
end
