-----------------------------------------
-- ID: 5202
-- Item: Dish of Spaghetti Nero Di Seppia +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- HP % 17 (cap 140)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5202)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 17)
    target:addMod(dsp.mod.FOOD_HP_CAP, 140)
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
    target:delMod(dsp.mod.FOOD_HP_CAP, 140)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, -1)
    target:delMod(dsp.mod.MND, -2)
    target:delMod(dsp.mod.CHR, -1)
    target:delMod(dsp.mod.DOUBLE_ATTACK, 1)
    target:delMod(dsp.mod.STORETP, 6)
end
