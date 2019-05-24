-----------------------------------------
-- ID: 4568
-- Item: moon_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 3
-- Magic 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4568)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 3)
    target:addMod(dsp.mod.MP, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 3)
    target:delMod(dsp.mod.MP, 3)
end
