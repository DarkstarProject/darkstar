-----------------------------------------
-- ID: 5658
-- Item: Dish of Spafhetti Ortolana
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- Agility 2
-- Vitality 2
-- HP +30% Cap 70
-- StoreTP +6
-- Resist Blind +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5658)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.AGI, 2)
    target:addMod(dsp.mod.FOOD_HPP, 30)
    target:addMod(dsp.mod.FOOD_HP_CAP, 70)
    target:addMod(dsp.mod.STORETP, 6)
    target:addMod(dsp.mod.BLINDRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, 2)
    target:delMod(dsp.mod.FOOD_HPP, 30)
    target:delMod(dsp.mod.FOOD_HP_CAP, 70)
    target:delMod(dsp.mod.STORETP, 6)
    target:delMod(dsp.mod.BLINDRES, 10)
end
