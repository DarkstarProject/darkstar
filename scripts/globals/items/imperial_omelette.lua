
-----------------------------------------
-- ID: 4331
-- Item: imperial_omelette
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Non Elvaan Stats
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 22
-- Attack Cap 70
-- Ranged ATT % 22
-- Ranged ATT Cap 70
-----------------------------------------
-- Elvaan Stats
-- Strength 7
-- Health 30
-- Magic 30
-- Intelligence -1
-- Mind 6
-- Charisma 5
-- Attack % 20 (cap 80)
-- Ranged ATT % 20 (cap 80)
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4331)
end

function onEffectGain(target, effect)
    if (target:getRace() == dsp.race.ELVAAN_M or target:getRace() == dsp.race.ELVAAN_F) then
        target:addMod(dsp.mod.STR, 5)
        target:addMod(dsp.mod.DEX, 2)
        target:addMod(dsp.mod.INT, -3)
        target:addMod(dsp.mod.MND, 4)
        target:addMod(dsp.mod.FOOD_ATTP, 22)
        target:addMod(dsp.mod.FOOD_ATT_CAP, 70)
        target:addMod(dsp.mod.FOOD_RATTP, 22)
        target:addMod(dsp.mod.FOOD_RATT_CAP, 70)
    else
        target:addMod(dsp.mod.HP, 30)
        target:addMod(dsp.mod.MP, 30)
        target:addMod(dsp.mod.STR, 7)
        target:addMod(dsp.mod.DEX, 3)
        target:addMod(dsp.mod.INT, -1)
        target:addMod(dsp.mod.MND, 6)
        target:addMod(dsp.mod.CHR, 5)
        target:addMod(dsp.mod.FOOD_ATTP, 20)
        target:addMod(dsp.mod.FOOD_ATT_CAP, 80)
        target:addMod(dsp.mod.FOOD_RATTP, 20)
        target:addMod(dsp.mod.FOOD_RATT_CAP, 80)
    end
end

function onEffectLose(target, effect)
    if (target:getRace() == dsp.race.ELVAAN_M or target:getRace() == dsp.race.ELVAAN_F) then
        target:delMod(dsp.mod.STR, 5)
        target:delMod(dsp.mod.DEX, 2)
        target:delMod(dsp.mod.INT, -3)
        target:delMod(dsp.mod.MND, 4)
        target:delMod(dsp.mod.FOOD_ATTP, 22)
        target:delMod(dsp.mod.FOOD_ATT_CAP, 70)
        target:delMod(dsp.mod.FOOD_RATTP, 22)
        target:delMod(dsp.mod.FOOD_RATT_CAP, 70)
    else
        target:delMod(dsp.mod.HP, 30)
        target:delMod(dsp.mod.MP, 30)
        target:delMod(dsp.mod.STR, 7)
        target:delMod(dsp.mod.DEX, 3)
        target:delMod(dsp.mod.INT, -1)
        target:delMod(dsp.mod.MND, 6)
        target:delMod(dsp.mod.CHR, 5)
        target:delMod(dsp.mod.FOOD_ATTP, 20)
        target:delMod(dsp.mod.FOOD_ATT_CAP, 80)
        target:delMod(dsp.mod.FOOD_RATTP, 20)
        target:delMod(dsp.mod.FOOD_RATT_CAP, 80)
    end
end
