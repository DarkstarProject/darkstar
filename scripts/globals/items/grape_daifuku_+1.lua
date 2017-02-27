-----------------------------------------
-- ID: 6344
-- Item: grape_daifuku+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Master MAB + 4 , Pet MAB + 15
-- Accuracy/Ranged Accuracy +11% (cap 54 on master, cap 81 on pet)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6344);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30)
    target:addMod(MOD_VIT, 4)
    target:addMod(MOD_MATT, 4)
    target:addMod(MOD_FOOD_ACCP, 11)
    target:addMod(MOD_FOOD_ACC_CAP, 54)
    target:addMod(MOD_FOOD_RACCP, 11)
    target:addMod(MOD_FOOD_RACC_CAP, 54)
    target:addPetMod(MOD_HP, 30)
    target:addPetMod(MOD_VIT, 4)
    target:addPetMod(MOD_MATT, 15)
    target:addPetMod(MOD_FOOD_ACCP, 11)
    target:addPetMod(MOD_FOOD_ACC_CAP, 81)
    target:addPetMod(MOD_FOOD_RACCP, 11)
    target:addPetMod(MOD_FOOD_RACC_CAP, 81)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30)
    target:delMod(MOD_VIT, 4)
    target:delMod(MOD_MATT, 4)
    target:delMod(MOD_FOOD_ACCP, 11)
    target:delMod(MOD_FOOD_ACC_CAP, 54)
    target:delMod(MOD_FOOD_RACCP, 11)
    target:delMod(MOD_FOOD_RACC_CAP, 54)
    target:delPetMod(MOD_HP, 30)
    target:delPetMod(MOD_VIT, 4)
    target:delPetMod(MOD_MATT, 15)
    target:delPetMod(MOD_FOOD_ACCP, 11)
    target:delPetMod(MOD_FOOD_ACC_CAP, 81)
    target:delPetMod(MOD_FOOD_RACCP, 11)
    target:delPetMod(MOD_FOOD_RACC_CAP, 81)
end;