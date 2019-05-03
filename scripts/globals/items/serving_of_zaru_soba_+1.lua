-----------------------------------------
-- ID: 5728
-- Item: serving_of_zaru_soba_+1
-- Food Effect: 60min, All Races
-----------------------------------------
-- Agility 4
-- HP % 12 (cap 185)
-- Resist Sleep +10
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5728)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.FOOD_HPP, 12)
    target:addMod(dsp.mod.FOOD_HP_CAP, 185)
    target:addMod(dsp.mod.SLEEPRES, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.FOOD_HPP, 12)
    target:delMod(dsp.mod.FOOD_HP_CAP, 185)
    target:delMod(dsp.mod.SLEEPRES, 10)
end
