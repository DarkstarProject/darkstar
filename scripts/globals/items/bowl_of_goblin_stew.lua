-----------------------------------------
-- ID: 4465
-- Item: bowl_of_goblin_stew
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Dexterity -4
-- Attack +16% (cap 80)
-- Ranged Attack +16% (cap 80)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4465)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, -4)
    target:addMod(dsp.mod.FOOD_ATTP, 16)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:addMod(dsp.mod.FOOD_RATTP, 16)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 80)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, -4)
    target:delMod(dsp.mod.FOOD_ATTP, 16)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
    target:delMod(dsp.mod.FOOD_RATTP, 16)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 80)
end
