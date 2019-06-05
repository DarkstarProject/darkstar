-----------------------------------------
-- ID: 4346
-- Item: serving_of_bass_meuniere_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health % 3 (cap 130)
-- Dexterity 3
-- Agility 3
-- Mind -3
-- Ranged ACC % 6
-- Ranged ACC Cap 20
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4346)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 3)
    target:addMod(dsp.mod.FOOD_HP_CAP, 130)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.FOOD_RACCP, 6)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 20)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 3)
    target:delMod(dsp.mod.FOOD_HP_CAP, 130)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.FOOD_RACCP, 6)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 20)
end
