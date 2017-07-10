-----------------------------------------
-- ID: 5220
-- Item: plate_of_ikra_gunkan_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 30
-- Magic 12
-- Dexterity 3
-- Mind -1
-- Accuracy % 18
-- Accuracy Cap 30
-- Ranged ACC % 18
-- Ranged ACC Cap 30
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5220);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_MP, 12);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_ACCP, 18);
    target:addMod(MOD_FOOD_ACC_CAP, 30);
    target:addMod(MOD_FOOD_RACCP, 18);
    target:addMod(MOD_FOOD_RACC_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_MP, 12);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_ACCP, 18);
    target:delMod(MOD_FOOD_ACC_CAP, 30);
    target:delMod(MOD_FOOD_RACCP, 18);
    target:delMod(MOD_FOOD_RACC_CAP, 30);
end;
