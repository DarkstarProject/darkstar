-----------------------------------------
-- ID: 5299
-- Item: dish_of_salsa
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Strength -1
-- Dexterity -1
-- Agility -1
-- Vitality -1
-- Intelligence -1
-- Mind -1
-- Sleep Resist 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,180,5299)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, -1)
    target:addMod(dsp.mod.DEX, -1)
    target:addMod(dsp.mod.AGI, -1)
    target:addMod(dsp.mod.VIT, -1)
    target:addMod(dsp.mod.INT, -1)
    target:addMod(dsp.mod.MND, -1)
    target:addMod(dsp.mod.SLEEPRES, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, -1)
    target:delMod(dsp.mod.DEX, -1)
    target:delMod(dsp.mod.AGI, -1)
    target:delMod(dsp.mod.VIT, -1)
    target:delMod(dsp.mod.INT, -1)
    target:delMod(dsp.mod.MND, -1)
    target:delMod(dsp.mod.SLEEPRES, 5)
end
