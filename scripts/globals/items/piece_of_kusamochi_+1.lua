-----------------------------------------
-- ID: 6263
-- Item: kusamochi+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
-- Ranged Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,6263);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 30)
    target:addMod(MOD_VIT, 4)
    target:addMod(MOD_FOOD_ATTP, 21)
    target:addMod(MOD_FOOD_ATT_CAP, 77)
    target:addMod(MOD_FOOD_RATTP, 21)
    target:addMod(MOD_FOOD_RATT_CAP, 77)
    target:addPetMod(MOD_HP, 30)
    target:addPetMod(MOD_VIT, 4)
    target:addPetMod(MOD_FOOD_ATTP, 21)
    target:addPetMod(MOD_FOOD_ATT_CAP, 120)
    target:addPetMod(MOD_FOOD_RATTP, 21)
    target:addPetMod(MOD_FOOD_RATT_CAP, 120)
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 30)
    target:delMod(MOD_VIT, 4)
    target:delMod(MOD_FOOD_ATTP, 21)
    target:delMod(MOD_FOOD_ATT_CAP, 77)
    target:delMod(MOD_FOOD_RATTP, 21)
    target:delMod(MOD_FOOD_RATT_CAP, 77)
    target:delPetMod(MOD_HP, 30)
    target:delPetMod(MOD_VIT, 4)
    target:delPetMod(MOD_FOOD_ATTP, 21)
    target:delPetMod(MOD_FOOD_ATT_CAP, 120)
    target:delPetMod(MOD_FOOD_RATTP, 21)
    target:delPetMod(MOD_FOOD_RATT_CAP, 120)
end;
