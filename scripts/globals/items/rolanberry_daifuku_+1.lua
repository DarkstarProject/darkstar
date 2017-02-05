-----------------------------------------
-- ID: 6340
-- Item: rolanberry_daifuku_+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +30
-- VIT +4
-- Accuracy +11% (cap 54)
-- Ranged Accuracy +11% (cap 54)
-- Magic Accuracy +4
-- Pet:
-- HP +30
-- VIT +4
-- Accuracy +11% (cap 81)
-- Ranged Accuracy +11% (cap 81)
-- Magic Accuracy +15
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6340);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 54);
    target:addMod(MOD_FOOD_RACCP, 11);
    target:addMod(MOD_FOOD_RACC_CAP, 54);
    target:addMod(MOD_MACC, 4);
    target:addPetMod(MOD_HP, 30);
    target:addPetMod(MOD_VIT, 4);
    target:addPetMod(MOD_FOOD_ACCP, 11);
    target:addPetMod(MOD_FOOD_ACC_CAP, 81);
    target:addPetMod(MOD_FOOD_RACCP, 11);
    target:addPetMod(MOD_FOOD_RACC_CAP, 81);
    target:addPetMod(MOD_MACC, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 54);
    target:delMod(MOD_FOOD_RACCP, 11);
    target:delMod(MOD_FOOD_RACC_CAP, 54);
    target:delMod(MOD_MACC, 4);
    target:delPetMod(MOD_HP, 30);
    target:delPetMod(MOD_VIT, 4);
    target:delPetMod(MOD_FOOD_ACCP, 11);
    target:delPetMod(MOD_FOOD_ACC_CAP, 81);
    target:delPetMod(MOD_FOOD_RACCP, 11);
    target:delPetMod(MOD_FOOD_RACC_CAP, 81);
    target:delPetMod(MOD_MACC, 15);
end;