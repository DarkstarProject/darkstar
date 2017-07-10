-----------------------------------------
-- ID: 5691
-- Item: plate_of_shrimp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Vitality 1
-- Defense 5
-- Accuracy % 14 (cap 68)
-- Ranged Accuracy % 14 (cap 68)
-- Resist sleep +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5691);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_DEF, 5);
    target:addMod(MOD_FOOD_ACCP, 14);
    target:addMod(MOD_FOOD_ACC_CAP, 68);
    target:addMod(MOD_FOOD_RACCP, 14);
    target:addMod(MOD_FOOD_RACC_CAP, 68);
    target:addMod(MOD_SLEEPRES, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_DEF, 5);
    target:delMod(MOD_FOOD_ACCP, 14);
    target:delMod(MOD_FOOD_ACC_CAP, 68);
    target:delMod(MOD_FOOD_RACCP, 14);
    target:delMod(MOD_FOOD_RACC_CAP, 68);
    target:delMod(MOD_SLEEPRES, 1);
end;
