-----------------------------------------
-- ID: 5927
-- Item: Cup of Caravan Tea
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 22
-- MP 32
-- Charisma 6
-- Intelligence 4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5927)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 22)
    target:addMod(dsp.mod.MP, 32)
    target:addMod(dsp.mod.CHR, 6)
    target:addMod(dsp.mod.INT, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 22)
    target:delMod(dsp.mod.MP, 32)
    target:delMod(dsp.mod.CHR, 6)
    target:delMod(dsp.mod.INT, 4)
end
