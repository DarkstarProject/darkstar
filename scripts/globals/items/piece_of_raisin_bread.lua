-----------------------------------------
-- ID: 4546
-- Item: piece_of_raisin_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 20
-- Dexterity -1
-- Vitality 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4546)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.VIT, 4)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.VIT, 4)
end
