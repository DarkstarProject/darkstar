-----------------------------------------
-- ID: 5976
-- Item: Bowl of Ulbuconut Milk
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Charisma +3
-- Vitality -2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5976)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.CHR, 3)
    target:addMod(dsp.mod.VIT, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.CHR, 3)
    target:delMod(dsp.mod.VIT, -2)
end
