-----------------------------------------
-- ID: 5924
-- Item: Smoldering Salisbury Steak
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- HP +30
-- Strength +7
-- Intelligence -5
-- Attack % 20 Cap 160
-- Ranged Attack %20 Cap 160
-- Dragon Killer +5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5924)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.STR, 7)
    target:addMod(dsp.mod.INT, -5)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:addMod(dsp.mod.DRAGON_KILLER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.STR, 7)
    target:delMod(dsp.mod.INT, -5)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 160)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 160)
    target:delMod(dsp.mod.DRAGON_KILLER, 5)
end
