-----------------------------------------
-- ID: 5175
-- Item: leremieu_taco
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 20
-- Magic 20
-- Dexterity 4
-- Agility 4
-- Vitality 6
-- Charisma 4
-- Health Regen While Healing 1
-- Magic Regen While Healing 1
-- Defense % 25
-- Defense Cap 160
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5175)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.CHR, 4)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.MPHEAL, 1)
    target:addMod(dsp.mod.FOOD_DEFP, 25)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 160)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.CHR, 4)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.MPHEAL, 1)
    target:delMod(dsp.mod.FOOD_DEFP, 25)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 160)
end
