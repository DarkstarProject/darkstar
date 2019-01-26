-----------------------------------------
-- ID: 4505
-- Item: handful_of_sunflower_seeds
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Dexterity -3
-- Intelligence 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4505)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.DEX, -3)
    target:addMod(dsp.mod.INT, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -3)
    target:delMod(dsp.mod.INT, 1)
end
