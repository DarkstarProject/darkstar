-----------------------------------------
-- ID: 5193
-- Item: dish_of_spaghetti_nero_di_seppia
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP % 17 (cap 130)
-- Dexterity 3
-- Vitality 2
-- Agility -1
-- Mind -2
-- Charisma -1
-- Double Attack 1
-- Store TP 6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5193)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 17)
    target:addMod(dsp.mod.FOOD_HP_CAP, 130)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.AGI, -1)
    target:addMod(dsp.mod.MND, -2)
    target:addMod(dsp.mod.CHR, -1)
    target:addMod(dsp.mod.DOUBLE_ATTACK, 1)
    target:addMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 17)
    target:delMod(dsp.mod.FOOD_HP_CAP, 130)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, -1)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.CHR, -1)
    target:delMod(dsp.mod.DOUBLE_ATTACK, 1)
    target:delMod(dsp.mod.STORETP, 6)
end
