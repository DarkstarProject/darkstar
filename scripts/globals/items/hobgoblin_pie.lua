-----------------------------------------
-- ID: 4325
-- Item: hobgoblin_pie
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 15
-- Magic 15
-- Agility 4
-- Charisma -7
-- Health Regen While Healing 2
-- Defense % 12 (cap 60)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4325)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 15)
    target:addMod(dsp.mod.MP, 15)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.CHR, -7)
    target:addMod(dsp.mod.HPHEAL, 2)
    target:addMod(dsp.mod.FOOD_DEFP, 12)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 60)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 15)
    target:delMod(dsp.mod.MP, 15)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.CHR, -7)
    target:delMod(dsp.mod.HPHEAL, 2)
    target:delMod(dsp.mod.FOOD_DEFP, 12)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 60)
end
