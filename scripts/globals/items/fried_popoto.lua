-----------------------------------------
-- ID: 6272
-- Item: fried_popoto
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +30
-- VIT +2
-- Fire resistance +20
-- DEF +20% (cap 145)
-- Subtle Blow +8
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6272)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.FIRERES, 20)
    target:addMod(dsp.mod.FOOD_DEFP, 20)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 145)
    target:addMod(dsp.mod.SUBTLE_BLOW, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.FIRERES, 20)
    target:delMod(dsp.mod.FOOD_DEFP, 20)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 145)
    target:delMod(dsp.mod.SUBTLE_BLOW, 8)
end
