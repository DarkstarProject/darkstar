-----------------------------------------
-- ID: 5621
-- Item: Candy Ring
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 4
-- Agility 4
-- Charisma 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5621)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.CHR, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.CHR, 4)
end
