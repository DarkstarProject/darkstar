-----------------------------------------
-- ID: 4361
-- Item: nebimonite
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -3
-- Vitality 2
-- Defense % 13 (cap 50)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.MITHRA) then
        result = dsp.msg.basic.CANNOT_EAT
    end
    if (target:getMod(dsp.mod.EAT_RAW_FISH) == 1) then
        result = 0
    end
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4361)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, -3)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.FOOD_DEFP, 13)
    target:addMod(dsp.mod.FOOD_DEF_CAP,50)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -3)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.FOOD_DEFP, 13)
    target:delMod(dsp.mod.FOOD_DEF_CAP,50)
end
