-----------------------------------------
-- ID: 4550
-- Item: plate_of_bream_risotto
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 40
-- Dexterity 6
-- Agility 3
-- Mind -4
-- Health Regen While Healing 1
-- Ranged Accuracy % 6
-- Ranged Accuracy Cap 15
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4550)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.DEX, 6)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.MND, -4)
    target:addMod(dsp.mod.HPHEAL, 1)
    target:addMod(dsp.mod.FOOD_RACCP, 6)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.DEX, 6)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.MND, -4)
    target:delMod(dsp.mod.HPHEAL, 1)
    target:delMod(dsp.mod.FOOD_RACCP, 6)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 15)
end
