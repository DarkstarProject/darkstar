-----------------------------------------
-- ID: 4592
-- Item: bowl_of_wisdom_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 3
-- MP 3
-- Strength 1
-- Dexterity 1
-- Agility 1
-- Vitality 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
-- HP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4592)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 3)
    target:addMod(dsp.mod.MP, 3)
    target:addMod(dsp.mod.STR, 1)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.AGI, 1)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.MND, 1)
    target:addMod(dsp.mod.CHR, 1)
    target:addMod(dsp.mod.HPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 3)
    target:delMod(dsp.mod.MP, 3)
    target:delMod(dsp.mod.STR, 1)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.AGI, 1)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.MND, 1)
    target:delMod(dsp.mod.CHR, 1)
    target:delMod(dsp.mod.HPHEAL, 3)
end
