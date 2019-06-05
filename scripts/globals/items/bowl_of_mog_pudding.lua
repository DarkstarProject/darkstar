-----------------------------------------
-- ID: 6009
-- Item: Bowl of Mog Pudding
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 7
-- MP 7
-- Vitality 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6009)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 7)
    target:addMod(dsp.mod.MP, 7)
    target:addMod(dsp.mod.VIT, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 7)
    target:delMod(dsp.mod.MP, 7)
    target:delMod(dsp.mod.VIT, 3)
end
