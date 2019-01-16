-----------------------------------------
-- ID: 6261
-- Item: akamochi+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Attack + 17% Cap: 54 (Pet & Master) Pet Cap: 81
-- Accuracy + 11% Cap: 54 (Pet & Master) Pet Cap: 81
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6261)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.FOOD_ACCP, 11)
    target:addMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:addMod(dsp.mod.FOOD_RACCP, 11)
    target:addMod(dsp.mod.FOOD_RACC_CAP, 54)
    target:addMod(dsp.mod.FOOD_ATTP, 17)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 54)
    target:addMod(dsp.mod.FOOD_RATTP, 17)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 54)
    target:addPetMod(dsp.mod.HP, 30)
    target:addPetMod(dsp.mod.VIT, 4)
    target:addPetMod(dsp.mod.FOOD_ACCP, 11)
    target:addPetMod(dsp.mod.FOOD_ACC_CAP, 81)
    target:addPetMod(dsp.mod.FOOD_RACCP, 11)
    target:addPetMod(dsp.mod.FOOD_RACC_CAP, 81)
    target:addPetMod(dsp.mod.FOOD_ATTP, 17)
    target:addPetMod(dsp.mod.FOOD_ATT_CAP, 82)
    target:addPetMod(dsp.mod.FOOD_RATTP, 17)
    target:addPetMod(dsp.mod.FOOD_RATT_CAP, 82)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.FOOD_ACCP, 11)
    target:delMod(dsp.mod.FOOD_ACC_CAP, 54)
    target:delMod(dsp.mod.FOOD_RACCP, 11)
    target:delMod(dsp.mod.FOOD_RACC_CAP, 54)
    target:delMod(dsp.mod.FOOD_ATTP, 17)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 54)
    target:delMod(dsp.mod.FOOD_RATTP, 17)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 54)
    target:delPetMod(dsp.mod.HP, 30)
    target:delPetMod(dsp.mod.VIT, 4)
    target:delPetMod(dsp.mod.FOOD_ACCP, 11)
    target:delPetMod(dsp.mod.FOOD_ACC_CAP, 81)
    target:delPetMod(dsp.mod.FOOD_RACCP, 11)
    target:delPetMod(dsp.mod.FOOD_RACC_CAP, 81)
    target:delPetMod(dsp.mod.FOOD_ATTP, 17)
    target:delPetMod(dsp.mod.FOOD_ATT_CAP, 82)
    target:delPetMod(dsp.mod.FOOD_RATTP, 17)
    target:delPetMod(dsp.mod.FOOD_RATT_CAP, 82)
end
