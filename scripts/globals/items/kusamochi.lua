-----------------------------------------
-- ID: 6262
-- Item: kusamochi
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
-- Ranged Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6262);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20)
    target:addMod(MOD_VIT, 3)
    target:addMod(MOD_FOOD_ATTP, 20)
    target:addMod(MOD_FOOD_ATT_CAP, 72)
    target:addMod(MOD_FOOD_RATTP, 20)
    target:addMod(MOD_FOOD_RATT_CAP, 72)
    target:addPetMod(MOD_HP, 20)
    target:addPetMod(MOD_VIT, 3)
    target:addPetMod(MOD_FOOD_ATTP, 20)
    target:addPetMod(MOD_FOOD_ATT_CAP, 113)
    target:addPetMod(MOD_FOOD_RATTP, 20)
    target:addPetMod(MOD_FOOD_RATT_CAP, 113)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20)
    target:delMod(MOD_VIT, 3)
    target:delMod(MOD_FOOD_ATTP, 20)
    target:delMod(MOD_FOOD_ATT_CAP, 72)
    target:delMod(MOD_FOOD_RATTP, 20)
    target:delMod(MOD_FOOD_RATT_CAP, 72)
    target:delPetMod(MOD_HP, 20)
    target:delPetMod(MOD_VIT, 3)
    target:delPetMod(MOD_FOOD_ATTP, 20)
    target:delPetMod(MOD_FOOD_ATT_CAP, 113)
    target:delPetMod(MOD_FOOD_RATTP, 20)
    target:delPetMod(MOD_FOOD_RATT_CAP, 113)
end;
