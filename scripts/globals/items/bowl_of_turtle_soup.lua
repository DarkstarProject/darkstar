-----------------------------------------
-- ID: 4418
-- Item: Turtle Soup
-- Food Effect: 3hours, All Races
-----------------------------------------
-- HP + 10% (200 Cap)
-- Dexterity +4
-- Vitality +6
-- Mind -3
-- HP Recovered While Healing +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4418)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 10)
    target:addMod(dsp.mod.FOOD_HP_CAP, 200)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.HPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10)
    target:delMod(dsp.mod.FOOD_HP_CAP, 200)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.HPHEAL, 5)
end
