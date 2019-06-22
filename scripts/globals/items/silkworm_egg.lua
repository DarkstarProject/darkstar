-----------------------------------------
-- ID: 4526
-- Item: Silkworm Egg
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- HP 12
-- MP 12
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4526)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 12)
    target:addMod(dsp.mod.MP, 12)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 12)
    target:delMod(dsp.mod.MP, 12)
end
