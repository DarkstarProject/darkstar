-----------------------------------------
-- ID: 6343
-- Item: grape_daifuku
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Master MAB + 3 , Pet MAB + 14
-- Accuracy/Ranged Accuracy +10% (cap 50 on master, cap 75 on pet)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,6343);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 20)
    target:addMod(MOD_VIT, 3)
    target:addMod(MOD_MATT, 3)
    target:addMod(MOD_FOOD_ACCP, 10)
    target:addMod(MOD_FOOD_ACC_CAP, 50)
    target:addMod(MOD_FOOD_RACCP, 10)
    target:addMod(MOD_FOOD_RACC_CAP, 50)
    target:addPetMod(MOD_HP, 20)
    target:addPetMod(MOD_VIT, 3)
    target:addPetMod(MOD_MATT, 14)
    target:addPetMod(MOD_FOOD_ACCP, 10)
    target:addPetMod(MOD_FOOD_ACC_CAP, 75)
    target:addPetMod(MOD_FOOD_RACCP, 10)
    target:addPetMod(MOD_FOOD_RACC_CAP, 75)
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 20)
    target:delMod(MOD_VIT, 3)
    target:delMod(MOD_MATT, 3)
    target:delMod(MOD_FOOD_ACCP, 10)
    target:delMod(MOD_FOOD_ACC_CAP, 50)
    target:delMod(MOD_FOOD_RACCP, 10)
    target:delMod(MOD_FOOD_RACC_CAP, 50)
    target:delPetMod(MOD_HP, 20)
    target:delPetMod(MOD_VIT, 3)
    target:delPetMod(MOD_MATT, 14)
    target:delPetMod(MOD_FOOD_ACCP, 10)
    target:delPetMod(MOD_FOOD_ACC_CAP, 75)
    target:delPetMod(MOD_FOOD_RACCP, 10)
    target:delPetMod(MOD_FOOD_RACC_CAP, 75)
end;