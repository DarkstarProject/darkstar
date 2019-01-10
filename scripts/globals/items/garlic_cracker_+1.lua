-----------------------------------------
-- ID: 4280
-- Item: garlic_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP recovered while healing +8
-- Undead Killer +12
-- Blind Resist +12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4280)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 8)
    target:addMod(dsp.mod.UNDEAD_KILLER, 12)
    target:addMod(dsp.mod.BLINDRES, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 8)
    target:delMod(dsp.mod.UNDEAD_KILLER, 12)
    target:delMod(dsp.mod.BLINDRES, 12)
end
