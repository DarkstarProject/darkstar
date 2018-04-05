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
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,6261);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 30)
    target:addMod(MOD_VIT, 4)
    target:addMod(MOD_FOOD_ACCP, 11)
    target:addMod(MOD_FOOD_ACC_CAP, 54)
    target:addMod(MOD_FOOD_RACCP, 11)
    target:addMod(MOD_FOOD_RACC_CAP, 54)
    target:addMod(MOD_FOOD_ATTP, 17)
    target:addMod(MOD_FOOD_ATT_CAP, 54)
    target:addMod(MOD_FOOD_RATTP, 17)
    target:addMod(MOD_FOOD_RATT_CAP, 54)
    target:addPetMod(MOD_HP, 30)
    target:addPetMod(MOD_VIT, 4)
    target:addPetMod(MOD_FOOD_ACCP, 11)
    target:addPetMod(MOD_FOOD_ACC_CAP, 81)
    target:addPetMod(MOD_FOOD_RACCP, 11)
    target:addPetMod(MOD_FOOD_RACC_CAP, 81)
    target:addPetMod(MOD_FOOD_ATTP, 17)
    target:addPetMod(MOD_FOOD_ATT_CAP, 82)
    target:addPetMod(MOD_FOOD_RATTP, 17)
    target:addPetMod(MOD_FOOD_RATT_CAP, 82)
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 30)
    target:delMod(MOD_VIT, 4)
    target:delMod(MOD_FOOD_ACCP, 11)
    target:delMod(MOD_FOOD_ACC_CAP, 54)
    target:delMod(MOD_FOOD_RACCP, 11)
    target:delMod(MOD_FOOD_RACC_CAP, 54)
    target:delMod(MOD_FOOD_ATTP, 17)
    target:delMod(MOD_FOOD_ATT_CAP, 54)
    target:delMod(MOD_FOOD_RATTP, 17)
    target:delMod(MOD_FOOD_RATT_CAP, 54)
    target:delPetMod(MOD_HP, 30)
    target:delPetMod(MOD_VIT, 4)
    target:delPetMod(MOD_FOOD_ACCP, 11)
    target:delPetMod(MOD_FOOD_ACC_CAP, 81)
    target:delPetMod(MOD_FOOD_RACCP, 11)
    target:delPetMod(MOD_FOOD_RACC_CAP, 81)
    target:delPetMod(MOD_FOOD_ATTP, 17)
    target:delPetMod(MOD_FOOD_ATT_CAP, 82)
    target:delPetMod(MOD_FOOD_RATTP, 17)
    target:delPetMod(MOD_FOOD_RATT_CAP, 82)
end;
