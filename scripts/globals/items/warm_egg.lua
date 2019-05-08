-----------------------------------------
-- ID: 4602
-- Item: warm_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 18
-- Magic 18
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4602)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 18)
    target:addMod(dsp.mod.MP, 18)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 18)
    target:delMod(dsp.mod.MP, 18)
end
