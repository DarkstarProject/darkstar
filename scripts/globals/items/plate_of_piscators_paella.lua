-----------------------------------------
-- ID: 5969
-- Item: Plate of Piscator's Paella
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 45
-- Dexterity 6
-- Accuracy % 16 (cap 85)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5969)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 45)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.FOOD_ACCP, 16)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 85)
    target:addMod(dsp.mod.UNDEAD_KILLER, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 45)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.FOOD_ACCP, 16)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 85)
    target:delMod(dsp.mod.UNDEAD_KILLER, 6)
end
