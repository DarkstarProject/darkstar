-----------------------------------------
-- ID: 5692
-- Item: plate_of_shrimp_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Vitality 1
-- Defense 5
-- Accuracy % 12 (unknown, assuming HQ stat)
-- Store TP 2
-- Triple Attack 1 (unknown, assuming same as NQ)
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
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_DEF, 5);
    target:addMod(MOD_FOOD_ACCP, 12);
    target:addMod(MOD_FOOD_ACC_CAP, 999);
    target:addMod(MOD_STORETP, 2);
    target:addMod(MOD_TRIPLE_ATTACK, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_DEF, 5);
    target:delMod(MOD_FOOD_ACCP, 12);
    target:delMod(MOD_FOOD_ACC_CAP, 999);
    target:delMod(MOD_STORETP, 2);
    target:delMod(MOD_TRIPLE_ATTACK, 1);
end;
