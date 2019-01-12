-----------------------------------------
-- ID: 4486
-- Item: Dragon Heart
-- Food Effect: 3 Hr, Galka Only
-----------------------------------------
-- Strength 7
-- Intelligence -9
-- MP -40
-- HP 40
-- Dragon Killer 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4486)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -9)
    target:addMod(dsp.mod.MP, -40)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.DRAGON_KILLER, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -9)
    target:delMod(dsp.mod.MP, -40)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.DRAGON_KILLER, 10)
end
