-----------------------------------------
-- ID: 6394
-- Item: pork_cutlet
-- Food Effect: 180Min, All Races
-----------------------------------------
-- HP +40
-- STR +7
-- INT -7
-- Fire resistance +20
-- Attack +20% (cap 120)
-- Ranged Attack +20% (cap 120)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,6394)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 40)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -7)
    target:addMod(dsp.mod.FIRERES, 20)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 120)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 120)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 40)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -7)
    target:delMod(dsp.mod.FIRERES, 20)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 120)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 120)
end
