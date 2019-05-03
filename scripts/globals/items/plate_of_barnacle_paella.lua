-----------------------------------------
-- ID: 5974
-- Item: Plate of Barnacle Paella
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP 40
-- Vitality 5
-- Mind -1
-- Charisma -1
-- Defense % 25 Cap 150
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5974)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.VIT, 5)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.CHR, -1)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 150)
    target:addMod(dsp.mod.UNDEAD_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.VIT, 5)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.CHR, -1)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 150)
    target:delMod(dsp.mod.UNDEAD_KILLER, 5)
end
