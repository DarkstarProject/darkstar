-----------------------------------------
-- ID: 4446
-- Item: pumpkin_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 40
-- Agility -1
-- Intelligence 3
-- Charisma -2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4446)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MP, 40)
    target:addMod(dsp.mod.AGI, -1)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.CHR, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 40)
    target:delMod(dsp.mod.AGI, -1)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.CHR, -2)
end
