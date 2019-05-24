-----------------------------------------
-- ID: 6466
-- Item: bowl_of_miso_soup
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +7% (cap 50)
-- DEX +4
-- AGI +4
-- Accuracy +10% (cap 40)
-- Attack +10% (cap 40)
-- Ranged Accuracy +10% (cap 40)
-- Ranged Attack +10% (cap 40)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6466)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 7)
    target:addMod(dsp.mod.FOOD_HP_CAP, 50)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.AGI, 4)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 40)
    target:addMod(dsp.mod.FOOD_RACCP, 10)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 40)
    target:addMod(dsp.mod.FOOD_ATTP, 10)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 40)
    target:addMod(dsp.mod.FOOD_RATTP, 10)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 40)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 7)
    target:delMod(dsp.mod.FOOD_HP_CAP, 50)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.AGI, 4)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 40)
    target:delMod(dsp.mod.FOOD_RACCP, 10)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 40)
    target:delMod(dsp.mod.FOOD_ATTP, 10)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 40)
    target:delMod(dsp.mod.FOOD_RATTP, 10)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 40)
end
