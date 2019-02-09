-----------------------------------------
-- ID: 4535
-- Item: Boiled Crayfish
-- Food Effect: 30Min, All Races
-----------------------------------------
-- defense % 30
-- defense % 25
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4535)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_DEFP, 30)
    target:addMod(dsp.mod.FOOD_DEF_CAP, 25)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_DEFP, 30)
    target:delMod(dsp.mod.FOOD_DEF_CAP, 25)
end
