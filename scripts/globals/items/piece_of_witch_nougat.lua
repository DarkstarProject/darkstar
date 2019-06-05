-----------------------------------------
-- ID: 5645
-- Item: piece_of_witch_nougat
-- Food Effect: 1hour, All Races
-----------------------------------------
-- HP 50
-- Intelligence 3
-- Agility -3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5645)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 50)
    target:addMod(dsp.mod.INT, 3)
    target:addMod(dsp.mod.AGI, -3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 50)
    target:delMod(dsp.mod.INT, 3)
    target:delMod(dsp.mod.AGI, -3)
end
