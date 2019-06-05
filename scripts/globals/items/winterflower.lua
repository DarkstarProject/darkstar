-----------------------------------------
-- ID: 5907
-- Item: Winterflower
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility +3
-- Intelligence +5
-- Charisma -5
-- Resist Virus +20
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5907)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.INT, 5)
    target:addMod(dsp.mod.CHR, -5)
    target:addMod(dsp.mod.VIRUSRES, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.INT, 5)
    target:delMod(dsp.mod.CHR, -5)
    target:delMod(dsp.mod.VIRUSRES, 20)
end
