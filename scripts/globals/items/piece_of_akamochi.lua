-----------------------------------------
-- ID: 6260
-- Item: akamochi
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Acc + 10% Cap: 50 (Pet & Master) Pet Cap: 75
-- R. Acc + 10% Cap: 50 (Pet & Master) Pet Cap: 75
-- Attack + 16% Cap: 50 (Pet & Master) Pet Cap: 75
-- R. Attack + 16% Cap: 50 (Pet & Master) Pet Cap: 75
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6260)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FOOD_ACCP, 10)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 50)
    target:addMod(dsp.mod.FOOD_RACCP, 10)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:addMod(dsp.mod.FOOD_ATTP, 16)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:addMod(dsp.mod.FOOD_RATTP, 16)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 50)
    target:addPetMod(dsp.mod.HP, 20)
    target:addPetMod(dsp.mod.VIT, 3)
    target:addPetMod(dsp.mod.FOOD_ACCP, 10)
    target:addPetMod(dsp.mod.FOOD_ACC_CAP, 75)
    target:addPetMod(dsp.mod.FOOD_RACCP, 10)
    target:addPetMod(dsp.mod.FOOD_RACC_CAP, 75)
    target:addPetMod(dsp.mod.FOOD_ATTP, 16)
    target:addPetMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:addPetMod(dsp.mod.FOOD_RATTP, 16)
    target:addPetMod(dsp.mod.FOOD_RATT_CAP, 75)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FOOD_ACCP, 10)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 50)
    target:delMod(dsp.mod.FOOD_RACCP, 10)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 50)
    target:delMod(dsp.mod.FOOD_ATTP, 16)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 50)
    target:delMod(dsp.mod.FOOD_RATTP, 16)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 50)
    target:delPetMod(dsp.mod.HP, 20)
    target:delPetMod(dsp.mod.VIT, 3)
    target:delPetMod(dsp.mod.FOOD_ACCP, 10)
    target:delPetMod(dsp.mod.FOOD_ACC_CAP, 75)
    target:delPetMod(dsp.mod.FOOD_RACCP, 10)
    target:delPetMod(dsp.mod.FOOD_RACC_CAP, 75)
    target:delPetMod(dsp.mod.FOOD_ATTP, 16)
    target:delPetMod(dsp.mod.FOOD_ATT_CAP, 75)
    target:delPetMod(dsp.mod.FOOD_RATTP, 16)
    target:delPetMod(dsp.mod.FOOD_RATT_CAP, 75)
end
