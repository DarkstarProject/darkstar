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

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6260);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20)
    target:addMod(MOD_VIT, 3)
    target:addMod(MOD_FOOD_ACCP, 10)
    target:addMod(MOD_FOOD_ACC_CAP, 50)
    target:addMod(MOD_FOOD_RACCP, 10)
    target:addMod(MOD_FOOD_RACC_CAP, 50)
    target:addMod(MOD_FOOD_ATTP, 16)
    target:addMod(MOD_FOOD_ATT_CAP, 50)
    target:addMod(MOD_FOOD_RATTP, 16)
    target:addMod(MOD_FOOD_RATT_CAP, 50)
    target:addPetMod(MOD_HP, 20)
    target:addPetMod(MOD_VIT, 3)
    target:addPetMod(MOD_FOOD_ACCP, 10)
    target:addPetMod(MOD_FOOD_ACC_CAP, 75)
    target:addPetMod(MOD_FOOD_RACCP, 10)
    target:addPetMod(MOD_FOOD_RACC_CAP, 75)
    target:addPetMod(MOD_FOOD_ATTP, 16)
    target:addPetMod(MOD_FOOD_ATT_CAP, 75)
    target:addPetMod(MOD_FOOD_RATTP, 16)
    target:addPetMod(MOD_FOOD_RATT_CAP, 75)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20)
    target:delMod(MOD_VIT, 3)
    target:delMod(MOD_FOOD_ACCP, 10)
    target:delMod(MOD_FOOD_ACC_CAP, 50)
    target:delMod(MOD_FOOD_RACCP, 10)
    target:delMod(MOD_FOOD_RACC_CAP, 50)
    target:delMod(MOD_FOOD_ATTP, 16)
    target:delMod(MOD_FOOD_ATT_CAP, 50)
    target:delMod(MOD_FOOD_RATTP, 16)
    target:delMod(MOD_FOOD_RATT_CAP, 50)
    target:delPetMod(MOD_HP, 20)
    target:delPetMod(MOD_VIT, 3)
    target:delPetMod(MOD_FOOD_ACCP, 10)
    target:delPetMod(MOD_FOOD_ACC_CAP, 75)
    target:delPetMod(MOD_FOOD_RACCP, 10)
    target:delPetMod(MOD_FOOD_RACC_CAP, 75)
    target:delPetMod(MOD_FOOD_ATTP, 16)
    target:delPetMod(MOD_FOOD_ATT_CAP, 75)
    target:delPetMod(MOD_FOOD_RATTP, 16)
    target:delPetMod(MOD_FOOD_RATT_CAP, 75)
end;
