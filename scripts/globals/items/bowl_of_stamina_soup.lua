-----------------------------------------
-- ID: 4337
-- Item: bowl_of_stamina_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP +12% (cap 200)
-- Dexterity 4
-- Vitality 6
-- Mind -3
-- HP Recovered While Healing 10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4337)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 12)
    target:addMod(dsp.mod.FOOD_HP_CAP, 200)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.VIT, 6)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.HPHEAL, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 12)
    target:delMod(dsp.mod.FOOD_HP_CAP, 200)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.VIT, 6)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.HPHEAL, 10)
end
