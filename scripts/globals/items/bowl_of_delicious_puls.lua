-----------------------------------------
-- ID: 4533
-- Item: Bowl of Delicious Puls
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity -1
-- Vitality 3
-- Health Regen While Healing 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4533)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.HPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.HPHEAL, 5)
end
