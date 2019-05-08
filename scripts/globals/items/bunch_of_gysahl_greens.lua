-----------------------------------------
-- ID: 4545
-- Item: Bunch of Gysahl Greens
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility +3
-- Vitality -5
-- Additional Effect with Chocobo Shirt
-- Agility +10
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
    target:addStatusEffect(dsp.effect.FOOD,ChocoboShirt(target),0,300,4545)
end

function onEffectGain(target, effect)
    local power = effect:getPower()
    if (power == 1) then
        chocoboShirt = 1
        target:addMod(dsp.mod.AGI, 13)
        target:addMod(dsp.mod.VIT, -5)
    else
        target:addMod(dsp.mod.AGI, 3)
        target:addMod(dsp.mod.VIT, -5)
    end
end

-----------------------------------------
-- onEffectLose Action
-----------------------------------------
function onEffectLose(target,effect)
    local power = effect:getPower()
    if (power == 1) then
        target:delMod(dsp.mod.AGI, 13)
        target:delMod(dsp.mod.VIT, -5)
    else
        target:delMod(dsp.mod.AGI, 3)
        target:delMod(dsp.mod.VIT, -5)
    end
end