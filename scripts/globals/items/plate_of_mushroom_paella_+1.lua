-----------------------------------------
-- ID: 5971
-- Item: Plate of Mushroom Paella +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 43
-- Mind 6
-- Magic Accuracy 6
-- Undead Killer 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5971)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 45)
    target:addMod(dsp.mod.MND, 6)
    target:addMod(dsp.mod.MACC, 6)
    target:addMod(dsp.mod.UNDEAD_KILLER, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 45)
    target:delMod(dsp.mod.MND, 6)
    target:delMod(dsp.mod.MACC, 6)
    target:delMod(dsp.mod.UNDEAD_KILLER, 6)
end
