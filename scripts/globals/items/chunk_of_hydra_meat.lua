-----------------------------------------
-- ID: 5564
-- Item: Chunk of Hydra Meat
-- Effect: 5 Minutes, food effect, Galka Only
-----------------------------------------
-- HP 10
-- MP -10
-- Strength +6
-- Intelligence -8
-- Demon Killer 10
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.GALKA) then
        result = dsp.msg.basic.CANNOT_EAT
    end
    if (target:getMod(dsp.mod.EAT_RAW_MEAT) == 1) then
        result = 0
    end
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5564)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.MP, -10)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.INT, -8)
    target:addMod(dsp.mod.DEMON_KILLER, 10)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.MP, -10)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.INT, -8)
    target:delMod(dsp.mod.DEMON_KILLER, 10)
end