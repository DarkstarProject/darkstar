-----------------------------------------
-- ID: 5561
-- Item: Moogle Pie
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- HP 20
-- MP 20
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5561)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.MP, 20)
    target:addMod(dsp.mod.STR,1)
    target:addMod(dsp.mod.DEX, 1)
    target:addMod(dsp.mod.VIT,1)
    target:addMod(dsp.mod.AGI,1)
    target:addMod(dsp.mod.INT, 1)
    target:addMod(dsp.mod.MND,1)
    target:addMod(dsp.mod.CHR, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.MP, 20)
    target:delMod(dsp.mod.STR,1)
    target:delMod(dsp.mod.DEX, 1)
    target:delMod(dsp.mod.VIT,1)
    target:delMod(dsp.mod.AGI,1)
    target:delMod(dsp.mod.INT, 1)
    target:delMod(dsp.mod.MND,1)
    target:delMod(dsp.mod.CHR, 1)
end
