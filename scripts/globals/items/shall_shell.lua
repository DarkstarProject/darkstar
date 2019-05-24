-----------------------------------------
-- ID: 4484
-- Item: shall_shell
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -5
-- Vitality 4
-- Defense % 16.4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.MITHRA) then
        result = dsp.msg.basic.CANNOT_EAT
    elseif target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4484)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, -5)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.FOOD_DEFP, 16.4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -5)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.FOOD_DEFP, 16.4)
end
