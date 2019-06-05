-----------------------------------------
-- ID: 4539
-- Item: goblin_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 12
-- Magic 12
-- Dexterity -1
-- Agility 3
-- Vitality -1
-- Charisma -5
-- Defense % 9 (cap 100)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4539)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.MP, 12)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.CHR, -5)
    target:addMod(dsp.mod.FOOD_DEFP, 9)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 100)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.MP, 12)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.CHR, -5)
    target:delMod(dsp.mod.FOOD_DEFP, 9)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 100)
end
