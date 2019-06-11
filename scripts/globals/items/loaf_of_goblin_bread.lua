-----------------------------------------
-- ID: 4458
-- Item: loaf_of_goblin_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 7
-- Vitality 1
-- Charisma -5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4458)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 7)
    target:addMod(dsp.mod.VIT, 1)
    target:addMod(dsp.mod.CHR, -5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 7)
    target:delMod(dsp.mod.VIT, 1)
    target:delMod(dsp.mod.CHR, -5)
end
