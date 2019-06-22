-----------------------------------------
-- ID: 5596
-- Item: simit
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 16
-- Dexterity -1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5596)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 16)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.VIT, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 16)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.VIT, 3)
end