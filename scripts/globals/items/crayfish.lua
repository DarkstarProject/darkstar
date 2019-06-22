-----------------------------------------
-- ID: 4472
-- Item: crayfish
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -3
-- Vitality 1
-- defense +10% (unknown cap)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4472)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, -3)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.FOOD_DEFP, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -3)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.FOOD_DEFP, 10)
end
