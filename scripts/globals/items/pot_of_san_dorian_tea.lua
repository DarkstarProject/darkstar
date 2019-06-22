-----------------------------------------
-- ID: 4494
-- Item: pot_of_san_dorian_tea
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Vitality -2
-- Charisma 2
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4494)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, -2)
    target:addMod(dsp.mod.CHR, 2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, -2)
    target:delMod(dsp.mod.CHR, 2)
end
