-----------------------------------------
-- ID: 6273
-- Item: fried_popoto_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +35
-- VIT +3
-- Fire resistance +21
-- DEF +21% (cap 150)
-- Subtle Blow +9
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6273)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 35)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FIRERES, 21)
    target:addMod(dsp.mod.FOOD_DEFP, 21)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 150)
    target:addMod(dsp.mod.SUBTLE_BLOW, 9)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 35)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FIRERES, 21)
    target:delMod(dsp.mod.FOOD_DEFP, 21)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 150)
    target:delMod(dsp.mod.SUBTLE_BLOW, 9)
end
