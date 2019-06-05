-----------------------------------------
-- ID: 5216
-- Item: plate_of_tentacle_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP 20
-- Dexterity 3
-- Agility 3
-- Accuracy % 20 (cap 20)
-- Ranged Accuracy % 20 (cap 20)
-- Double Attack 1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5216)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.DEX, 3)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.FOOD_ACCP, 20)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 20)
    target:addMod(dsp.mod.FOOD_RACCP, 20)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 20)
    target:addMod(dsp.mod.DOUBLE_ATTACK, 1)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.DEX, 3)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.FOOD_ACCP, 20)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 20)
    target:delMod(dsp.mod.FOOD_RACCP, 20)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 20)
    target:delMod(dsp.mod.DOUBLE_ATTACK, 1)
end
