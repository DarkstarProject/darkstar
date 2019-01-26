-----------------------------------------
-- ID: 4362
-- Item: lizard_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 5
-- Magic 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4362)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 5)
    target:addMod(dsp.mod.MP, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 5)
    target:delMod(dsp.mod.MP, 5)
end
