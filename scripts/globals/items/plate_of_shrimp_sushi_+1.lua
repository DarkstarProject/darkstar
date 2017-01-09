-----------------------------------------
-- ID: 5692
-- Item: plate_of_shrimp_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Vitality 2
-- Defense 10
-- Accuracy % 15 (cap 72)
-- Ranged Accuracy % 15 (cap 72)
-- Resist Sleep +2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5692);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_DEF, 10);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 72);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 72);
    target:addMod(MOD_SLEEPRES, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_DEF, 10);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 72);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 72);
    target:delMod(MOD_SLEEPRES, 2);
end;
